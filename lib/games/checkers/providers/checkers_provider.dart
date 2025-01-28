import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/checkers_session.dart';
import '../../../providers/starknet.dart';
import 'package:graphql/client.dart';

part 'checkers_provider.g.dart';

enum Position {
  None,
  Up,
  Down,
}

@Riverpod(keepAlive: true)
class CheckersSession extends _$CheckersSession {
  Box<CheckersSessionData>? _hiveBox;
  String? _sessionId;
  CheckersPiece? _selectedPiece;
  GraphQLClient? _graphQLClient;
  StreamSubscription<QueryResult>? _subscription;

  // Initialize GraphQL client
  void _initGraphQLClient() {
    final httpLink = HttpLink('http://localhost:8080/graphql');
    final wsLink = WebSocketLink('ws://localhost:8080/graphql');

    _graphQLClient = GraphQLClient(
      link: Link.split(
        (request) => request.isSubscription,
        wsLink,
        httpLink,
      ),
      cache: GraphQLCache(),
    );
  }

  @override
  CheckersSessionData? build() {
    _hiveBox ??= Hive.box<CheckersSessionData>("checkersSession");
    _initGraphQLClient();
    ref.onDispose(() {
      _subscription?.cancel();
    });
    return null;
  }

  // Create a new game lobby
  Future<void> createLobby() async {
    try {
      final sessionId = await ref.read(starknetProvider.notifier).createLobby();
      if (kDebugMode) print("Created lobby with session: $sessionId");

      // Join the lobby we just created
      await joinLobby(int.parse(sessionId));

      // Query for the specific session we created
      final sessionData = await findSession(int.parse(sessionId));
      if (sessionData != null) {
        state = sessionData;
        // Subscribe to session updates
        await subscribeToSession(sessionId);
      } else {
        throw Exception('Failed to create game: Could not find session data');
      }
    } catch (e) {
      if (kDebugMode) print("Error creating lobby: $e");
      if (e is OperationException) {
        final errors = e.graphqlErrors;
        if (errors.isNotEmpty) {
          throw Exception(
              'GraphQL Errors: ${errors.map((e) => e.message).join(', ')}');
        } else {
          throw Exception(
              'Network Error: ${e.linkException?.toString() ?? e.toString()}');
        }
      }
      throw Exception("Failed to create lobby: $e");
    }
  }

  // Join an existing game lobby
  Future<void> joinLobby(int sessionId) async {
    try {
      final txHash =
          await ref.read(starknetProvider.notifier).joinLobby(sessionId);
      if (kDebugMode) print("Joined lobby with tx: $txHash");
      _sessionId = sessionId.toString();
      await subscribeToSession(_sessionId!);
    } catch (e) {
      if (kDebugMode) print("Error joining lobby: $e");
      throw Exception("Failed to join lobby: $e");
    }
  }

  // Spawn a piece on the board
  Future<void> spawn({
    required String player,
    required int position,
    required int sessionId,
  }) async {
    try {
      final txHash = await ref.read(starknetProvider.notifier).spawn(
            player: player,
            position: position,
            sessionId: sessionId,
          );
      if (kDebugMode) print("Spawned piece with tx: $txHash");
    } catch (e) {
      if (kDebugMode) print("Error spawning piece: $e");
      throw Exception("Failed to spawn piece: $e");
    }
  }

  // Check if a piece can be selected
  Future<bool> canChoosePiece(CheckersPiece piece) async {
    try {
      return await ref.read(starknetProvider.notifier).canChoosePiece(
            position: piece.position,
            row: piece.row,
            col: piece.col,
            sessionId: piece.sessionId,
          );
    } catch (e) {
      if (kDebugMode) print("Error checking piece selection: $e");
      return false;
    }
  }

  // Move a piece on the board
  Future<void> movePiece({
    required CheckersPiece piece,
    required int targetRow,
    required int targetCol,
  }) async {
    try {
      final txHash = await ref.read(starknetProvider.notifier).movePiece(
            currentPiece: piece,
            targetRow: targetRow,
            targetCol: targetCol,
          );
      if (kDebugMode) print("Moved piece with tx: $txHash");
    } catch (e) {
      if (kDebugMode) print("Error moving piece: $e");
      throw Exception("Failed to move piece: $e");
    }
  }

  // Select a piece
  Future<void> selectPiece(CheckersPiece piece) async {
    if (await canChoosePiece(piece)) {
      _selectedPiece = piece;
      state = state?.copyWith(message: "Piece selected");
    }
  }

  // Clear session data
  Future<void> clearData() async {
    await _hiveBox?.delete("checkersSession");
    _subscription?.cancel();
    state = null;
    _sessionId = null;
    _selectedPiece = null;
  }

  // Get selected piece
  CheckersPiece? get selectedPiece => _selectedPiece;

  // Subscribe to session updates
  Future<void> subscribeToSession(String sessionId) async {
    final subscriptionDocument = gql('''
      subscription OnSessionUpdate(\$sessionId: ID!) {
        entityUpdated(id: \$sessionId) {
          keys
          models {
            ... on checkers_marq_Session {
              session_id
              player_1
              player_2
              turn
              winner
              state
            }
            ... on checkers_marq_Piece {
              row
              col
              player
              position
              is_king
              is_alive
            }
            ... on checkers_marq_Player {
              player
              remaining_pieces
            }
          }
        }
      }
    ''');

    _subscription?.cancel();
    _subscription = _graphQLClient
        ?.subscribe(
      SubscriptionOptions(
        document: subscriptionDocument,
        variables: {'sessionId': sessionId},
      ),
    )
        .listen(
      (result) {
        if (result.hasException) {
          final errors = result.exception?.graphqlErrors ?? [];
          if (errors.isNotEmpty) {
            if (kDebugMode) {
              print(
                  'GraphQL Errors: ${errors.map((e) => e.message).join(', ')}');
            }
          } else {
            if (kDebugMode) {
              print('Subscription Error: ${result.exception.toString()}');
            }
          }
          return;
        }

        if (result.data != null) {
          _updateStateFromGraphQL(result.data!);
        }
      },
      onError: (error) {
        if (kDebugMode) {
          print('Subscription Error: $error');
        }
      },
    );
  }

  // Update state from GraphQL data
  void _updateStateFromGraphQL(Map<String, dynamic> data) {
    try {
      final entityData = data['entityUpdated'];
      if (entityData == null) return;

      final models = entityData['models'] as List;
      Map<String, dynamic>? sessionData;
      List<Map<String, dynamic>> piecesData = [];
      List<Map<String, dynamic>> playersData = [];

      // Sort the models into their respective types
      for (var model in models) {
        if (model['session_id'] != null) {
          sessionData = model;
        } else if (model['row'] != null) {
          piecesData.add(model);
        } else if (model['remaining_pieces'] != null) {
          playersData.add(model);
        }
      }

      if (sessionData == null) return;

      final pieces = piecesData.map<CheckersPiece>((node) {
        return CheckersPiece(
          sessionId: int.parse(sessionData!['session_id']),
          row: node['row'],
          col: node['col'],
          player: node['player'],
          position: _parsePosition(node['position']),
          isKing: node['is_king'],
          isAlive: node['is_alive'],
        );
      }).toList();

      final newState = CheckersSessionData(
        id: sessionData['session_id'].toString(),
        status: _parseGameState(sessionData['state']),
        nextPlayer: sessionData['turn'].toString(),
        sessionUserStatus: _buildUserStatus(playersData),
        nextPlayerId: sessionData['turn'].toString(),
        createdAt: state?.createdAt ?? DateTime.now(),
        pieces: pieces,
        isGameOver: sessionData['winner'] != null,
        orangeScore: _getPlayerScore(playersData, Position.Up),
        blackScore: _getPlayerScore(playersData, Position.Down),
        isBlackTurn: sessionData['turn'] == '2',
        message: state?.message,
      );

      state = newState;
    } catch (e) {
      if (kDebugMode) print('Error updating state from GraphQL: $e');
    }
  }

  // Build user status from GraphQL data
  List<CheckersSessionUserStatus> _buildUserStatus(List<dynamic> playersData) {
    return playersData.map<CheckersSessionUserStatus>((edge) {
      final node = edge['node'];
      return CheckersSessionUserStatus(
        playerId: node['player'],
        userId: node['player'], // Using player address as userId
        email: '', // Optional in checkers
        role: 'PLAYER',
        status: 'ACTIVE',
        points: node['remaining_pieces'],
        position: node['position'] == 'UP' ? 'up' : 'down',
      );
    }).toList();
  }

  // Calculate player score based on remaining pieces
  int _getPlayerScore(List<dynamic> playersData, Position position) {
    final playerData = playersData.firstWhere(
      (edge) {
        final node = edge['node'];
        return _parsePosition(node['position']) == position.index;
      },
      orElse: () => {
        'node': {'remaining_pieces': 12}
      },
    );

    return playerData['node']['remaining_pieces'] as int;
  }

  // Helper method to parse position string to enum
  Position _parsePositionToEnum(String position) {
    switch (position.toUpperCase()) {
      case 'UP':
        return Position.Up;
      case 'DOWN':
        return Position.Down;
      default:
        return Position.None;
    }
  }

  // Helper methods
  int _parsePosition(String position) {
    switch (position.toUpperCase()) {
      case 'UP':
        return 1;
      case 'DOWN':
        return 2;
      default:
        return 0;
    }
  }

  String _parseGameState(int state) {
    switch (state) {
      case 1:
        return 'ACTIVE';
      case 2:
        return 'FINISHED';
      default:
        return 'WAITING';
    }
  }

  void updateTurn(bool isBlackTurn) {
    if (state != null) {
      try {
        state = state!.copyWith(
          isBlackTurn: isBlackTurn,
          nextPlayer:
              isBlackTurn ? "2" : "1", // Update nextPlayer based on turn
        );
      } catch (e) {
        if (kDebugMode) print('Error updating turn: $e');
      }
    }
  }

  Future<CheckersSessionData?> findSession(int sessionId) async {
    try {
      // Query for session
      final result = await _graphQLClient?.query(
        QueryOptions(
          document: gql('''
            query FindSession(\$sessionId: u64!) {
              checkersMarqSessionModels(where: { session_idEQ: \$sessionId }) {
                edges {
                  node {
                    session_id
                    player_1
                    player_2
                    turn
                    state
                  }
                }
              }
              checkersMarqPieceModels(where: { session_idEQ: \$sessionId }) {
                edges {
                  node {
                    row
                    col
                    player
                    position
                    is_king
                    is_alive
                  }
                }
              }
              checkersMarqPlayerModels {
                edges {
                  node {
                    player
                    remaining_pieces
                  }
                }
              }
            }
          '''),
          variables: {'sessionId': sessionId},
        ),
      );

      if (result?.data != null) {
        // Create and return a new CheckersSessionData
        final sessionData =
            result!.data!['checkersMarqSessionModels']['edges'][0]['node'];
        final piecesData = result.data!['checkersMarqPieceModels']['edges'];
        final playersData = result.data!['checkersMarqPlayerModels']['edges'];

        final pieces = piecesData.map<CheckersPiece>((edge) {
          final node = edge['node'];
          return CheckersPiece(
            sessionId: int.parse(sessionData['session_id']),
            row: node['row'],
            col: node['col'],
            player: node['player'],
            position: _parsePosition(node['position']),
            isKing: node['is_king'],
            isAlive: node['is_alive'],
          );
        }).toList();

        return CheckersSessionData(
          id: sessionData['session_id'].toString(),
          status: _parseGameState(sessionData['state']),
          nextPlayer: sessionData['turn'].toString(),
          sessionUserStatus: _buildUserStatus(playersData),
          nextPlayerId: sessionData['turn'].toString(),
          createdAt: DateTime.now(),
          pieces: pieces,
          isGameOver: false,
          orangeScore: _getPlayerScore(playersData, Position.Up),
          blackScore: _getPlayerScore(playersData, Position.Down),
          isBlackTurn: sessionData['turn'] == '2', // 2 = Down = Black's turn
          message: null,
        );
      }
    } catch (e) {
      throw Exception("Failed to find session: $e");
    }
    return null;
  }

  Future<List<CheckersSessionData>> getAvailableSessions() async {
    try {
      final result = await _graphQLClient?.query(
        QueryOptions(
          document: gql('''
            query GetAvailableSessions {
              checkersMarqSessionModels(
                first: 10,
                order: {direction: DESC, field: STATE},
                where: {stateEQ: 0}  # 0 = WAITING state
              ) {
                edges {
                  node {
                    session_id
                    player_1
                    player_2
                    turn
                    state
                  }
                }
              }
              checkersMarqPlayerModels {
                edges {
                  node {
                    player
                    remaining_pieces
                  }
                }
              }
            }
          '''),
        ),
      );

      // Check for GraphQL errors
      if (result?.hasException ?? false) {
        final errors = result?.exception?.graphqlErrors ?? [];
        if (errors.isNotEmpty) {
          throw Exception(
              'GraphQL Errors: ${errors.map((e) => e.message).join(', ')}');
        } else if (result?.exception != null) {
          throw Exception('Network Error: ${result?.exception.toString()}');
        }
      }

      // Check for null data
      if (result?.data == null) {
        throw Exception('No data received from server');
      }

      final sessions = <CheckersSessionData>[];
      final sessionEdges =
          result!.data!['checkersMarqSessionModels']['edges'] as List;
      final playersData = result.data!['checkersMarqPlayerModels']['edges'];

      for (final edge in sessionEdges) {
        final sessionData = edge['node'];
        sessions.add(CheckersSessionData(
          id: sessionData['session_id'].toString(),
          status: _parseGameState(sessionData['state']),
          nextPlayer: sessionData['turn'].toString(),
          sessionUserStatus: _buildUserStatus(playersData),
          nextPlayerId: sessionData['turn'].toString(),
          createdAt: DateTime.now(),
          pieces: [], // Initial empty board
          isGameOver: false,
          orangeScore: 12,
          blackScore: 12,
          isBlackTurn: sessionData['turn'] == '2',
          message: null,
        ));
      }

      return sessions;
    } catch (e) {
      if (kDebugMode) print('Error querying available sessions: $e');
      throw Exception('Failed to query available sessions: $e');
    }
  }
}
