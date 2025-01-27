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
  Piece? _selectedPiece;
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
      final txHash = await ref.read(starknetProvider.notifier).createLobby();
      if (kDebugMode) print("Created lobby with tx: $txHash");
      // The state will be updated automatically through GraphQL subscription
    } catch (e) {
      if (kDebugMode) print("Error creating lobby: $e");
      rethrow;
    }
  }

  // Join an existing game lobby
  Future<void> joinLobby(int sessionId) async {
    try {
      final txHash =
          await ref.read(starknetProvider.notifier).joinLobby(sessionId);
      if (kDebugMode) print("Joined lobby with tx: $txHash");
      _sessionId = sessionId.toString();
      // Subscribe to session updates
      await subscribeToSession(_sessionId!);
    } catch (e) {
      if (kDebugMode) print("Error joining lobby: $e");
      rethrow;
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
      // State will be updated through subscription
    } catch (e) {
      if (kDebugMode) print("Error spawning piece: $e");
      rethrow;
    }
  }

  // Check if a piece can be selected
  Future<bool> canChoosePiece(Piece piece) async {
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
    required Piece piece,
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
      // State will be updated through subscription
    } catch (e) {
      if (kDebugMode) print("Error moving piece: $e");
      rethrow;
    }
  }

  // Select a piece
  Future<void> selectPiece(Piece piece) async {
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
  Piece? get selectedPiece => _selectedPiece;

  // Subscribe to session updates
  Future<void> subscribeToSession(String sessionId) async {
    final subscriptionDocument = gql('''
      subscription OnSessionUpdate(\$sessionId: u64!) {
        checkersMarqSessionModels(where: { session_idEQ: \$sessionId }) {
          edges {
            node {
              session_id
              player_1
              player_2
              turn
              winner
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
    ''');

    _subscription?.cancel();
    _subscription = _graphQLClient
        ?.subscribe(
      SubscriptionOptions(
        document: subscriptionDocument,
        variables: {'sessionId': sessionId},
      ),
    )
        .listen((result) {
      if (result.hasException) {
        if (kDebugMode) print('GraphQL Error: ${result.exception}');
        return;
      }

      if (result.data != null) {
        _updateStateFromGraphQL(result.data!);
      }
    });
  }

  // Update state from GraphQL data
  void _updateStateFromGraphQL(Map<String, dynamic> data) {
    try {
      final sessionData = data['checkersMarqSessionModels']['edges'][0]['node'];
      final piecesData = data['checkersMarqPieceModels']['edges'];
      final playersData = data['checkersMarqPlayerModels']['edges'];

      final pieces = piecesData.map<Piece>((edge) {
        final node = edge['node'];
        return Piece(
          sessionId: int.parse(sessionData['session_id']),
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
}
