import 'dart:math';

import 'package:flame/components.dart';

import '../game/checkers_game_controller.dart';
import 'checkers_pin.dart';

class CheckersState extends Component with HasGameReference<CheckersGameController> {
  CheckersPin? selectedPiece;
  List<Vector2> validMoves = [];
  bool isBlackTurn = true;
  final Random _random = Random();

  void selectPiece(CheckersPin piece, Vector2 position) {
    selectedPiece = piece;
    validMoves = getValidMoves(position);
  }

  void clearSelection() {
    selectedPiece = null;
    validMoves.clear();
  }

  List<Vector2> getValidMoves(Vector2 position) {
    List<Vector2> moves = [];
    // Add basic moves (diagonally forward)
    final direction = selectedPiece!.isBlack ? 1 : -1;

    // Left and right diagonal moves
    moves.add(position + Vector2(-1.0, direction.toDouble()));
    moves.add(position + Vector2(1.0, direction.toDouble()));

    return moves.where((move) => move.x >= 0 && move.x < 8 && move.y >= 0 && move.y < 8).toList();
  }

  void switchTurn() {
    isBlackTurn = !isBlackTurn;
    game.currentPlayer = isBlackTurn ? 0 : 1;
  }

  void randomizePositions() {
    // Get all available black squares on the board (8x8)
    List<Vector2> availablePositions = [];
    for (int row = 0; row < 8; row++) {
      for (int col = 0; col < 8; col++) {
        if ((row + col) % 2 == 1) {
          // Black squares only
          availablePositions.add(Vector2(col.toDouble(), row.toDouble()));
        }
      }
    }

    // Count total pieces on the board
    int totalPieces = 0;
    if (game.board != null) {
      for (int row = 0; row < 8; row++) {
        for (int col = 0; col < 8; col++) {
          if (game.board!.pieces[row][col] != null) {
            totalPieces++;
          }
        }
      }
    }

    // Shuffle only the positions we need
    availablePositions.shuffle(_random);
    availablePositions = availablePositions.take(totalPieces).toList();

    // Tell the board to update positions
    if (game.board != null) {
      game.board!.randomizePieces(availablePositions);
    }
  }
}
