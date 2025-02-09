import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/checkers_session.dart';
import '../../../providers/starknet.dart';
import 'package:graphql/client.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

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
    const httpEndpoint = 'http://localhost:8080/graphql';
    const wsEndpoint = 'ws://localhost:8080/graphql';

    if (kDebugMode) {
      log("Initializing Checkers GraphQL client with endpoints:");
      log("HTTP: $httpEndpoint");
      log("WS: $wsEndpoint");
    }

    final httpLink = HttpLink(httpEndpoint);
    final wsLink = WebSocketLink(
      wsEndpoint,
      config: SocketClientConfig(
        autoReconnect: true,
        inactivityTimeout: const Duration(seconds: 100),
        initialPayload: () {
          if (kDebugMode) {
            log("Setting up WebSocket initial payload");
          }
          return {
            'content-type': 'application/json',
            'type': 'connection_init',
          };
        },
      ),
    );

    if (kDebugMode) {
      wsLink.connectOrReconnect();
      log("WebSocket connection initiated");
    }

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
        query: Policies(
          fetch: FetchPolicy.networkOnly,
        ),
      ),
    );

    if (kDebugMode) {
      log("GraphQL client initialized");
    }
  }

  @override
  CheckersSessionData? build() {
    _hiveBox ??= Hive.box<CheckersSessionData>("checkersSession");
    if (kDebugMode) {
      log("Initializing CheckersSession provider");
    }
    _initGraphQLClient();
    ref.onDispose(() {
      if (kDebugMode) {
        log("Disposing CheckersSession provider");
      }
      _subscription?.cancel();
      _graphQLClient = null;
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

      // Update the state immediately after move is confirmed
      if (state != null) {
        final updatedPieces = List<CheckersPiece>.from(state!.pieces);
        final pieceIndex = updatedPieces.indexWhere((p) =>
            p.row == piece.row &&
            p.col == piece.col &&
            p.player == piece.player &&
            p.isAlive); // Make sure we're updating a live piece

        if (pieceIndex != -1) {
          // Update the moved piece with all its properties preserved
          final movedPiece = updatedPieces[pieceIndex];
          updatedPieces[pieceIndex] = movedPiece.copyWith(
            row: targetRow,
            col: targetCol,
            // Preserve other properties
            isKing: movedPiece.isKing,
            position: movedPiece.position,
            player: movedPiece.player,
            isAlive: true,
            sessionId: movedPiece.sessionId,
          );

          // Check for captured pieces
          final rowDiff = (targetRow - piece.row).abs();
          if (rowDiff == 2) {
            final capturedRow = (targetRow + piece.row) ~/ 2;
            final capturedCol = (targetCol + piece.col) ~/ 2;

            final capturedPieceIndex = updatedPieces.indexWhere((p) =>
                p.row == capturedRow &&
                p.col == capturedCol &&
                p.isAlive &&
                p.player !=
                    piece.player); // Make sure we capture opponent's piece

            if (capturedPieceIndex != -1) {
              // Mark the captured piece as not alive
              updatedPieces[capturedPieceIndex] =
                  updatedPieces[capturedPieceIndex].copyWith(
                isAlive: false,
              );
            }
          }

          // Clear selected piece
          _selectedPiece = null;

          // Update the state with new pieces and toggle turn
          state = state!.copyWith(
            pieces: updatedPieces,
            isBlackTurn: !state!.isBlackTurn,
            nextPlayer: state!.isBlackTurn ? "1" : "2",
            message: null, // Clear any previous messages
          );

          if (kDebugMode) {
            print("Updated piece position - Row: $targetRow, Col: $targetCol");
            print("Total pieces: ${updatedPieces.length}");
            print(
                "Live pieces: ${updatedPieces.where((p) => p.isAlive).length}");
          }
        }
      }
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
    if (kDebugMode) {
      log("Setting up subscription for session: $sessionId");
    }

    final subscriptionDocument = gql('''
      subscription OnSessionUpdate(\$sessionId: ID!) {
        entityUpdated(id: \$sessionId) {
          id
          keys
          models {
            __typename
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
            }
          }
        }
      }
    ''');

    try {
      if (kDebugMode) {
        log("Cancelling any existing subscription");
      }
      _subscription?.cancel();

      if (_graphQLClient == null) {
        if (kDebugMode) {
          log("GraphQL client was null, initializing...");
        }
        _initGraphQLClient();
      }

      // Convert session ID to hex format if needed
      final formattedSessionId = sessionId.startsWith('0x')
          ? sessionId
          : '0x${BigInt.parse(sessionId).toRadixString(16)}';

      if (kDebugMode) {
        log("Subscribing with formatted session ID: $formattedSessionId");
        log("Subscription document: ${subscriptionDocument.toString()}");
      }

      final stream = _graphQLClient?.subscribe(
        SubscriptionOptions(
          document: subscriptionDocument,
          variables: {'sessionId': formattedSessionId},
          fetchPolicy: FetchPolicy.noCache,
          parserFn: (data) {
            if (kDebugMode) {
              log("Parsing subscription data: $data");
            }
            return data;
          },
        ),
      );

      if (stream == null) {
        if (kDebugMode) {
          log("Error: GraphQL subscription stream is null");
        }
        return;
      }

      if (kDebugMode) {
        log("Successfully created subscription stream");
      }

      _subscription = stream.listen(
        (result) {
          if (kDebugMode) {
            log("Received subscription event");
            log("Raw event data: ${result.data}");
          }

          if (result.hasException) {
            final errors = result.exception?.graphqlErrors ?? [];
            if (errors.isNotEmpty) {
              if (kDebugMode) {
                log('GraphQL Errors: ${errors.map((e) => e.message).join(', ')}');
                log('Full error details: ${result.exception.toString()}');
              }
            } else {
              if (kDebugMode) {
                log('Subscription Error: ${result.exception.toString()}');
                if (result.exception?.linkException != null) {
                  log('Link Exception: ${result.exception?.linkException.toString()}');
                }
              }
            }
            return;
          }

          if (result.data != null) {
            if (kDebugMode) {
              log('Processing subscription data');
            }
            _updateStateFromGraphQL(result.data!);
          }
        },
        onError: (error) {
          if (kDebugMode) {
            log('Subscription Error: $error');
            log('Error type: ${error.runtimeType}');
            if (error is Error) {
              log('Stack trace: ${error.stackTrace}');
            }
          }
        },
        onDone: () {
          if (kDebugMode) {
            log('Subscription completed or disconnected');
          }
          // Try to reconnect
          Future.delayed(Duration(seconds: 1), () {
            if (kDebugMode) {
              log('Attempting to reconnect subscription...');
            }
            subscribeToSession(sessionId);
          });
        },
        cancelOnError: false,
      );

      if (kDebugMode) {
        log("Successfully set up subscription listener");
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        log('Error setting up subscription: $e');
        log('Stack trace: $stackTrace');
      }
      // Try to reconnect after error
      Future.delayed(Duration(seconds: 1), () {
        if (kDebugMode) {
          log('Attempting to reconnect subscription after error...');
        }
        subscribeToSession(sessionId);
      });
    }
  }

  // Update state from GraphQL data
  void _updateStateFromGraphQL(Map<String, dynamic> data) {
    try {
      if (kDebugMode) {
        log('Updating state from GraphQL data: $data');
      }

      final entityData = data['entityUpdated'];
      if (entityData == null) {
        if (kDebugMode) {
          log('No entityUpdated data found');
        }
        return;
      }

      final models = entityData['models'] as List;
      if (kDebugMode) {
        log('Processing models: $models');
      }

      Map<String, dynamic>? sessionData;
      List<Map<String, dynamic>> piecesData = [];
      List<Map<String, dynamic>> playersData = [];

      // Sort the models into their respective types
      for (var model in models) {
        final type = model['__typename'];
        if (kDebugMode) {
          log('Processing model of type: $type');
        }

        switch (type) {
          case 'checkers_marq_Session':
            sessionData = model;
            break;
          case 'checkers_marq_Piece':
            piecesData.add(model);
            break;
          case 'checkers_marq_Player':
            playersData.add(model);
            break;
        }
      }

      if (sessionData == null) {
        if (kDebugMode) {
          log('No session data found in update');
        }
        return;
      }

      if (kDebugMode) {
        log('Session data: $sessionData');
        log('Pieces data: $piecesData');
        log('Players data: $playersData');
      }

      // Convert pieces data to CheckersPiece objects
      final pieces = piecesData.map<CheckersPiece>((piece) {
        return CheckersPiece(
          sessionId: int.parse(piece['session_id']),
          row: piece['row'],
          col: piece['col'],
          player: piece['player'],
          position: _parsePosition(piece['position']),
          isKing: piece['is_king'] ?? false,
          isAlive: piece['is_alive'] ?? true,
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

      if (kDebugMode) {
        log('Updating state with new data:');
        log('Status: ${newState.status}');
        log('Next player: ${newState.nextPlayer}');
        log('Pieces count: ${newState.pieces.length}');
        log('Orange score: ${newState.orangeScore}');
        log('Black score: ${newState.blackScore}');
      }

      // Update state
      state = newState;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        log('Error updating state from GraphQL: $e');
        log('Stack trace: $stackTrace');
      }
    }
  }

  // Build user status from GraphQL data
  List<CheckersSessionUserStatus> _buildUserStatus(List<dynamic> playersData) {
    return playersData.map<CheckersSessionUserStatus>((player) {
      final playerNode = player['node'] as Map<String, dynamic>;
      return CheckersSessionUserStatus(
        playerId: playerNode['player'],
        userId: playerNode['player'],
        email: '', // Required but not used in checkers
        role: 'PLAYER',
        status: 'PLAYING',
        points: playerNode['remaining_pieces'],
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
      await ensureConnection();

      if (kDebugMode) {
        log("Fetching available sessions...");
      }

      final result = await _graphQLClient?.query(
        QueryOptions(
          document: gql('''
            query GetAvailableSessions {
              checkersMarqSessionModels {
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
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (kDebugMode) {
        log("Raw query result: ${result?.data}");
        if (result?.data != null) {
          final sessionEdges =
              result!.data!['checkersMarqSessionModels']['edges'] as List;
          log("Number of sessions found: ${sessionEdges.length}");
          for (final edge in sessionEdges) {
            final node = edge['node'];
            log("Session: id=${node['session_id']}, state=${node['state']}, player1=${node['player_1']}, player2=${node['player_2']}");
          }
        }
      }

      // Check for GraphQL errors
      if (result?.hasException ?? false) {
        final errors = result?.exception?.graphqlErrors ?? [];
        if (errors.isNotEmpty) {
          if (kDebugMode) {
            log('GraphQL Errors: ${errors.map((e) => e.message).join(', ')}');
          }
          throw Exception(
              'GraphQL Errors: ${errors.map((e) => e.message).join(', ')}');
        } else if (result?.exception != null) {
          if (kDebugMode) {
            log('Network Error: ${result?.exception.toString()}');
          }
          throw Exception('Network Error: ${result?.exception.toString()}');
        }
      }

      // Check for null data
      if (result?.data == null) {
        if (kDebugMode) {
          log('No data received from server');
        }
        throw Exception('No data received from server');
      }

      final sessions = <CheckersSessionData>[];
      final sessionEdges =
          result!.data!['checkersMarqSessionModels']['edges'] as List;
      final playersData =
          result.data!['checkersMarqPlayerModels']['edges'] as List;

      if (kDebugMode) {
        log("Found ${sessionEdges.length} sessions");
        log("Session edges: $sessionEdges");
        log("Players data: $playersData");
      }

      for (final edge in sessionEdges) {
        final sessionData = edge['node'];
        if (kDebugMode) {
          log("Processing session: $sessionData");
        }

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

      if (kDebugMode) {
        log("Returning ${sessions.length} sessions");
        for (final session in sessions) {
          log("Session ${session.id}: status=${session.status}, nextPlayer=${session.nextPlayer}");
        }
      }

      return sessions;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        log('Error querying available sessions: $e');
        log('Stack trace: $stackTrace');
      }
      throw Exception('Failed to query available sessions: $e');
    }
  }

  // Test GraphQL connection
  Future<bool> testConnection() async {
    try {
      if (_graphQLClient == null) {
        if (kDebugMode) {
          log("GraphQL client not initialized, initializing now...");
        }
        _initGraphQLClient();
      }

      if (kDebugMode) {
        log("Testing GraphQL connection...");
      }

      final result = await _graphQLClient?.query(
        QueryOptions(
          document: gql('''
            query TestConnection {
              __typename
            }
          '''),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result?.hasException ?? true) {
        if (kDebugMode) {
          log("Connection test failed: ${result?.exception}");
        }
        return false;
      }

      if (kDebugMode) {
        log("Connection test successful");
      }
      return true;
    } catch (e) {
      if (kDebugMode) {
        log("Connection test error: $e");
      }
      return false;
    }
  }

  // Helper method to ensure connection
  Future<void> ensureConnection() async {
    if (!await testConnection()) {
      if (kDebugMode) {
        log("Connection test failed, reinitializing client...");
      }
      _graphQLClient = null;
      _initGraphQLClient();
      await testConnection();
    }
  }
}
