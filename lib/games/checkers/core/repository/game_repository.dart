import 'package:marquis_v2/games/checkers/core/extensions/felt_extensions.dart';
import 'package:marquis_v2/games/checkers/core/models/cordinates.dart';
import 'package:marquis_v2/games/checkers/core/models/pieces.dart';
import 'package:marquis_v2/games/checkers/core/models/positions.dart';
import 'package:marquis_v2/games/checkers/core/models/sessions.dart';
import 'package:starknet/starknet.dart';

class GameRepository {
  final Account account;
  final Contract contract;

  GameRepository({
    required this.account,
    required this.contract,
  });

  Future<BigInt> createLobby() async {
    try {
      final response = await contract.call(
        'create_lobby',
        [],
      );

      if (response.isEmpty) {
        throw Exception('No response from contract');
      }

      return BigInt.parse(response[0].toString());
    } catch (e) {
      throw Exception('Failed to create lobby: $e');
    }
  }

  Future<void> joinLobby(BigInt sessionId) async {
    try {
      await contract.execute(
        'join_lobby',
        [Felt(sessionId)],
      );
    } catch (e) {
      throw Exception('Failed to join lobby: $e');
    }
  }

  Future<Session> getSession(BigInt sessionId) async {
    try {
      final response = await contract.call(
        'get_session',
        [Felt(sessionId)],
      );
      return Session.fromContractResponse(sessionId, response);
    } catch (e) {
      throw Exception('Failed to get session: $e');
    }
  }

  Future<bool> canChoosePiece(
    Position position,
    Coordinates coords,
    BigInt sessionId,
  ) async {
    try {
      final response = await contract.call(
        'can_choose_piece',
        [
          Felt(BigInt.from(position.value)),
          Felt(BigInt.from(coords.row)),
          Felt(BigInt.from(coords.col)),
          Felt(sessionId),
        ],
      );

      return response[0].toBool();
    } catch (e) {
      throw Exception('Failed to check piece: $e');
    }
  }

  Future<void> movePiece(Piece piece, Coordinates newPosition) async {
    try {
      await contract.execute(
        'move_piece',
        [
          Felt(piece.sessionId),
          Felt(piece.row as BigInt),
          Felt(piece.col as BigInt),
          Felt.fromString(piece.player),
          Felt(piece.position.value as BigInt),
          Felt((piece.isKing ? 1 : 0) as BigInt),
          Felt((piece.isAlive ? 1 : 0) as BigInt),
          Felt(newPosition.row as BigInt),
          Felt(newPosition.col as BigInt),
        ],
      );
    } catch (e) {
      throw Exception('Failed to move piece: $e');
    }
  }

  Future<List<Piece>> getBoardState(BigInt sessionId) async {
    try {
      final List<Piece> pieces = [];
      for (int row = 0; row < 8; row++) {
        for (int col = 0; col < 8; col++) {
          if ((row + col) % 2 == 1) {
            final response = await contract.call(
              'get_piece',
              [Felt(sessionId), Felt(row as BigInt), Felt(col as BigInt)],
            );
            if (response.isNotEmpty) {
              pieces.add(Piece(
                sessionId: sessionId,
                row: row,
                col: col,
                player: response[0].toString(),
                position: Position.fromValue(response[1].toInt()),
                isKing: response[2].toBool(),
                isAlive: response[3].toBool(),
              ));
            }
          }
        }
      }
      return pieces;
    } catch (e) {
      throw Exception('Failed to get board state: $e');
    }
  }
}
