import 'dart:async';
import 'dart:developer';
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
    final wsLink = WebSocketLink(
      'ws://localhost:8080/graphql',
      config: SocketClientConfig(
        autoReconnect: true,
        inactivityTimeout: const Duration(seconds: 30),
        initialPayload: () => {
          'headers': {
            'content-type': 'application/json',
          },
        },
      ),
    );

    final link = Link.split(
      (request) => request.isSubscription,
      wsLink,
      httpLink,
    );

    _graphQLClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
      defaultPolicies: DefaultPolicies(
        subscribe: Policies(
          fetch: FetchPolicy.noCache,
        ),
      ),
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
      if (kDebugMode) {
        log("Created lobby with session: $sessionId");
        log("Raw session ID value: $sessionId");
      }

      // Parse the session ID correctly
      final parsedSessionId = sessionId.startsWith('0x')
          ? int.parse(sessionId.substring(2), radix: 16)
          : int.parse(sessionId);

      if (kDebugMode) {
        log("Parsed session ID: $parsedSessionId");
      }

      // Query for the session we just created (with retries)
      final sessionData = await findSession(parsedSessionId, retries: 3);
      if (sessionData != null) {
        if (kDebugMode) {
          log("Updated state with session data:");
          log("ID: ${sessionData.id}");
          log("Status: ${sessionData.status}");
          log("Next Player: ${sessionData.nextPlayer}");
          log("User Status: ${sessionData.sessionUserStatus}");
        }
        state = sessionData;

        // Subscribe to session updates
        await subscribeToSession(sessionId);

        // Join the lobby after subscribing
        await ref
            .read(starknetProvider.notifier)
            .joinLobby(int.parse(sessionId));
        if (kDebugMode) log("Joined created lobby");
      } else {
        throw Exception('Failed to create game: Could not find session data');
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        log("Error creating lobby: $e");
        log("Stack trace: $stackTrace");
      }
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
      if (kDebugMode) log("Joining lobby with session ID: $sessionId");

      // Join the lobby
      final txHash =
          await ref.read(starknetProvider.notifier).joinLobby(sessionId);
      if (kDebugMode) log("Joined lobby with tx: $txHash");

      // Query for the session we just joined
      final sessionData = await findSession(sessionId);
      if (sessionData != null) {
        if (kDebugMode) {
          log("Updated state with session data:");
          log("ID: ${sessionData.id}");
          log("Status: ${sessionData.status}");
          log("Next Player: ${sessionData.nextPlayer}");
          log("User Status: ${sessionData.sessionUserStatus}");
        }
        state = sessionData;
        // Subscribe to session updates
        await subscribeToSession(sessionId.toString());
      } else {
        throw Exception('Failed to join game: Could not find session data');
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        log("Error joining lobby: $e");
        log("Stack trace: $stackTrace");
      }
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
              session_id
            }
            ... on checkers_marq_Player {
              player
              remaining_pieces
              session_id
            }
          }
        }
      }
    ''');

    try {
      _subscription?.cancel();

      if (_graphQLClient == null) {
        _initGraphQLClient();
      }

      _subscription = _graphQLClient
          ?.subscribe(
        SubscriptionOptions(
          document: subscriptionDocument,
          variables: {'sessionId': sessionId},
          fetchPolicy: FetchPolicy.noCache,
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
            if (kDebugMode) {
              print('Received subscription data: ${result.data}');
            }
            _updateStateFromGraphQL(result.data!);
          }
        },
        onError: (error) {
          if (kDebugMode) {
            print('Subscription Error: $error');
          }
          // Try to reconnect after error
          Future.delayed(Duration(seconds: 5), () {
            if (kDebugMode) {
              print('Attempting to reconnect subscription...');
            }
            subscribeToSession(sessionId);
          });
        },
        onDone: () {
          if (kDebugMode) {
            print('Subscription completed');
          }
        },
        cancelOnError: false,
      );
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error setting up subscription: $e');
        print('Stack trace: $stackTrace');
      }
      // Try to reconnect after error
      Future.delayed(Duration(seconds: 5), () {
        if (kDebugMode) {
          print('Attempting to reconnect subscription after error...');
        }
        subscribeToSession(sessionId);
      });
    }
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
        if (model['session_id'] != null && model['turn'] != null) {
          sessionData = model;
        } else if (model['row'] != null) {
          piecesData.add(model);
        } else if (model['remaining_pieces'] != null) {
          playersData.add(model);
        }
      }

      if (sessionData == null) return;

      // Convert pieces data to CheckersPiece objects
      final pieces = piecesData.map<CheckersPiece>((node) {
        return CheckersPiece(
          sessionId: int.parse(sessionData!['session_id']),
          row: node['row'],
          col: node['col'],
          player: node['player'],
          position: _parsePosition(node['position']),
          isKing: node['is_king'] ?? false,
          isAlive: node['is_alive'] ?? true,
        );
      }).toList();

      // Create new state
      final newState = CheckersSessionData(
        id: sessionData['session_id'].toString(),
        status: _parseGameState(sessionData['state']),
        nextPlayer: sessionData['turn'].toString(),
        sessionUserStatus: _buildUserStatus(playersData),
        nextPlayerId: sessionData['turn'].toString(),
        createdAt: state?.createdAt ?? DateTime.now(),
        pieces: pieces,
        isGameOver: sessionData['winner'] != null && sessionData['state'] == 2,
        orangeScore: _getPlayerScore(playersData, Position.Up),
        blackScore: _getPlayerScore(playersData, Position.Down),
        isBlackTurn: sessionData['turn'] == '2',
        message: state?.message,
      );

      // Update state - the board will be notified through state change
      state = newState;
    } catch (e) {
      // Log error but don't crash
      debugPrint('Error updating state from GraphQL: $e');
    }
  }

  // Build user status from GraphQL data
  List<CheckersSessionUserStatus> _buildUserStatus(List<dynamic> playersData) {
    return playersData.map<CheckersSessionUserStatus>((player) {
      return CheckersSessionUserStatus(
        playerId: player['player'],
        userId: player['player'],
        email: '', // Required but not used in checkers
        role: 'PLAYER',
        status: 'PLAYING',
        points: player['remaining_pieces'],
        position: 'none',
      );
    }).toList();
  }

  // Calculate player score based on remaining pieces
  int _getPlayerScore(List<dynamic> playersData, Position position) {
    for (final player in playersData) {
      final playerId = player['player'];
      final playerPieces =
          state?.pieces.where((piece) => piece.player == playerId);

      if (playerPieces != null && playerPieces.isNotEmpty) {
        final playerPosition =
            _parsePositionToEnum(playerPieces.first.position.toString());
        if (playerPosition == position) {
          return player['remaining_pieces'] as int? ?? 12;
        }
      }
    }
    return 12;
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

  Future<CheckersSessionData?> findSession(int sessionId,
      {int retries = 3}) async {
    try {
      if (kDebugMode) {
        log("Finding session with ID: $sessionId (Attempt ${4 - retries}/3)");
      }

      final hexSessionId = "0x${sessionId.toRadixString(16)}";

      // Updated query to match the schema structure
      final result = await _graphQLClient?.query(
        QueryOptions(
          document: gql('''
            query FindSession(\$sessionId: String!) {
              checkersMarqSessionModels(
                where: {session_id: \$sessionId}
              ) {
                edges {
                  node {
                    session_id
                    player_1
                    player_2
                    turn
                    state
                    winner
                  }
                }
              }
              checkersMarqPieceModels(
                where: {session_id: \$sessionId}
              ) {
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
              # Removed session_id filter for players since it's not in the schema
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
          variables: {'sessionId': hexSessionId},
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (kDebugMode) {
        log("Query variables: {'sessionId': $hexSessionId}");
        log("Raw query result: ${result?.data}");
      }

      // If no session found and we have retries left, wait and try again
      final edges =
          result?.data?['checkersMarqSessionModels']['edges'] as List?;
      if ((edges?.isEmpty ?? true) && retries > 1) {
        if (kDebugMode) {
          log("Session not found, retrying in 1 second... (${retries - 1} retries left)");
        }
        await Future.delayed(const Duration(seconds: 1));
        return findSession(sessionId, retries: retries - 1);
      }

      if (result?.hasException ?? false) {
        final errors = result?.exception?.graphqlErrors ?? [];
        if (errors.isNotEmpty) {
          throw Exception(
              'GraphQL Errors: ${errors.map((e) => e.message).join(', ')}');
        } else if (result?.exception != null) {
          throw Exception('Network Error: ${result?.exception.toString()}');
        }
      }

      if (edges?.isEmpty ?? true) {
        if (kDebugMode)
          log("No session found with ID: $sessionId after all retries");
        return null;
      }

      final sessionData = edges![0]['node'] as Map<String, dynamic>;
      final piecesData =
          result!.data!['checkersMarqPieceModels']['edges'] as List;
      final playersData =
          result.data!['checkersMarqPlayerModels']['edges'] as List;

      // Create pieces list from the pieces data
      final pieces = piecesData.map<CheckersPiece>((edge) {
        final node = edge['node'] as Map<String, dynamic>;
        return CheckersPiece(
          sessionId: sessionId,
          row: node['row'] as int? ?? 0,
          col: node['col'] as int? ?? 0,
          player: node['player']?.toString() ?? '',
          position: _parsePosition(node['position']?.toString() ?? ''),
          isKing: node['is_king'] as bool? ?? false,
          isAlive: node['is_alive'] as bool? ?? true,
        );
      }).toList();

      return CheckersSessionData(
        id: sessionId.toString(),
        status: _parseGameState(sessionData['state'] as int? ?? 0),
        nextPlayer: sessionData['turn']?.toString() ?? '1',
        sessionUserStatus: _buildUserStatus(playersData),
        nextPlayerId: sessionData['turn']?.toString() ?? '1',
        createdAt: DateTime.now(),
        pieces: pieces,
        isGameOver: sessionData['winner'] != null && sessionData['state'] == 2,
        orangeScore: _getPlayerScore(playersData, Position.Up),
        blackScore: _getPlayerScore(playersData, Position.Down),
        isBlackTurn: sessionData['turn'] == '2',
        message: null,
      );
    } catch (e) {
      if (kDebugMode) log("Error in findSession: $e");
      throw Exception("Failed to find session: $e");
    }
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
          orangeScore: _getPlayerScore(playersData, Position.Up),
          blackScore: _getPlayerScore(playersData, Position.Down),
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
