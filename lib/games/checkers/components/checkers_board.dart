import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquis_v2/games/checkers/components/checkers_pin.dart';
import 'package:marquis_v2/games/checkers/components/checkers_state.dart';
import 'package:marquis_v2/games/checkers/models/checkers_session.dart';

import '../checkers_game_controller.dart';

class CheckersBoard extends RectangleComponent
    with HasGameReference<CheckersGameController>, TapCallbacks {
  static const int boardSize = 8;
  late PictureInfo blackPinSprite;
  late PictureInfo whitePinSprite;

  // Track selected piece
  CheckersPin? selectedPiece;
  Vector2? selectedPosition;

  // Add this line to track pieces
  List<List<CheckersPin?>> pieces =
      List.generate(boardSize, (_) => List.filled(boardSize, null));

  late CheckersState gameState;

  CheckersBoard()
      : super(
          paint: Paint()..color = Colors.transparent,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final isTablet = game.width / game.height > 0.7;

    // Calculate base board size
    final baseBoardSize = game.unitSize * (isTablet ? 24 : 13);

    // For tablets, make width larger while keeping height the same
    final boardWidth =
        isTablet ? baseBoardSize * 1.3 : baseBoardSize; // 30% wider on tablets
    final boardHeight = baseBoardSize;

    // Set non-square size for tablets
    size = Vector2(boardWidth, boardHeight);

    // Keep the same tablet offset
    final tabletOffset = isTablet ? -game.width * 0.15 : 0.0;

    // Center the board using game dimensions with tablet offset
    position = Vector2(
        (game.width - size.x) / 2 + tabletOffset, (game.height - size.y) / 2);

    // Initialize game state
    gameState = CheckersState();
    await add(gameState);

    // Load the SVG sprites
    final blackData = await rootBundle.load('assets/images/blackchecker.svg');
    final whiteData = await rootBundle.load('assets/images/whitechecker.svg');

    blackPinSprite = await vg.loadPicture(
      SvgStringLoader(String.fromCharCodes(blackData.buffer.asUint8List())),
      null,
    );
    whitePinSprite = await vg.loadPicture(
      SvgStringLoader(String.fromCharCodes(whiteData.buffer.asUint8List())),
      null,
    );

    // Initialize the board state
    pieces = List.generate(
      boardSize,
      (row) => List.generate(boardSize, (col) => null),
    );

    // Set up initial piece positions
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < boardSize; col++) {
        if ((row + col) % 2 == 1) {
          final piece = CheckersPin(
            isBlack: true,
            position:
                Vector2(col * (size.x / boardSize), row * (size.y / boardSize)),
            dimensions:
                Vector2(size.x / boardSize * 0.8, size.y / boardSize * 0.8),
            spritePath: 'assets/images/blackchecker.svg',
          );
          pieces[row][col] = piece;
          await add(piece);
        }
      }
    }

    for (int row = boardSize - 3; row < boardSize; row++) {
      for (int col = 0; col < boardSize; col++) {
        if ((row + col) % 2 == 1) {
          final piece = CheckersPin(
            isBlack: false,
            position:
                Vector2(col * (size.x / boardSize), row * (size.y / boardSize)),
            dimensions:
                Vector2(size.x / boardSize * 0.8, size.y / boardSize * 0.8),
            spritePath: 'assets/images/whitechecker.svg',
          );
          pieces[row][col] = piece;
          await add(piece);
        }
      }
    }
  }

  @override
  void render(Canvas canvas) {
    final squareSize = size.x / boardSize;
    final pinSize = squareSize * 0.8;

    final boardBackground = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        -squareSize * 0.3,
        -squareSize * 0.3,
        size.x + squareSize * 0.6,
        size.y + squareSize * 0.6,
      ),
      const Radius.circular(12),
    );

    canvas.drawRRect(
      boardBackground,
      Paint()..color = const Color.fromRGBO(68, 41, 22, 1),
    );

    // Draw the 8x8 board with rounded corners
    for (int row = 0; row < boardSize; row++) {
      for (int col = 0; col < boardSize; col++) {
        final isBlackSquare = (row + col) % 2 == 1;
        final rect = RRect.fromRectAndRadius(
          Rect.fromLTWH(
            col * squareSize,
            row * squareSize,
            squareSize,
            squareSize,
          ),
          const Radius.circular(3),
        );

        canvas.drawRRect(
            rect,
            Paint()
              ..color = isBlackSquare
                  ? const Color.fromRGBO(101, 58, 12, 1) // Dark brown
                  : const Color.fromRGBO(243, 180, 110, 1) // Light brown
            );
      }
    }

    // Draw pieces from the pieces array
    for (int row = 0; row < boardSize; row++) {
      for (int col = 0; col < boardSize; col++) {
        if (pieces[row][col] != null) {
          canvas.save();
          canvas.translate(
            pieces[row][col]!.position.x,
            pieces[row][col]!.position.y,
          );

          canvas.scale(
            pinSize /
                (pieces[row][col]!.isBlack ? blackPinSprite : whitePinSprite)
                    .size
                    .width,
            pinSize /
                (pieces[row][col]!.isBlack ? blackPinSprite : whitePinSprite)
                    .size
                    .height,
          );

          canvas.translate(
            -(pieces[row][col]!.isBlack ? blackPinSprite : whitePinSprite)
                    .size
                    .width /
                2,
            -(pieces[row][col]!.isBlack ? blackPinSprite : whitePinSprite)
                    .size
                    .height /
                2,
          );

          canvas.drawPicture(
              (pieces[row][col]!.isBlack ? blackPinSprite : whitePinSprite)
                  .picture);
          canvas.restore();
        }
      }
    }

    // Highlight valid moves if a piece is selected
    if (selectedPiece != null) {
      for (final move in gameState.validMoves) {
        final rect = RRect.fromRectAndRadius(
          Rect.fromLTWH(
            move.x * squareSize,
            move.y * squareSize,
            squareSize,
            squareSize,
          ),
          const Radius.circular(3),
        );

        canvas.drawRRect(
          rect,
          Paint()
            ..color = const Color.fromRGBO(76, 175, 80, 0.5)
            ..style = PaintingStyle.fill,
        );
      }
    }
  }

  @override
  bool onTapUp(TapUpEvent event) {
    final position = event.localPosition;
    final row = (position.y / (size.y / boardSize)).floor();
    final col = (position.x / (size.x / boardSize)).floor();

    if (!isValidPosition(row, col)) return false;

    // If a piece is already selected
    if (selectedPiece != null) {
      final validMoves = getValidMoves(
          selectedPosition!.y.toInt(), selectedPosition!.x.toInt());
      final targetPos = Vector2(col.toDouble(), row.toDouble());

      if (validMoves.contains(targetPos)) {
        // Move the piece
        movePiece(
            selectedPosition!.y.toInt(), selectedPosition!.x.toInt(), row, col);
        clearSelection();
        return true;
      }

      clearSelection();
      return false;
    }

    // Select a piece
    final piece = pieces[row][col];
    if (piece != null && piece.isBlack == game.isBlackTurn) {
      selectedPiece = piece;
      selectedPosition = Vector2(col.toDouble(), row.toDouble());
      return true;
    }

    return false;
  }

  bool isValidPosition(int row, int col) {
    return row >= 0 && row < boardSize && col >= 0 && col < boardSize;
  }

  List<Vector2> getValidMoves(int row, int col) {
    List<Vector2> moves = [];
    final piece = pieces[row][col];
    if (piece == null) return moves;

    // Directions for movement (diagonal)
    List<int> directions = [];
    if (piece.isKing) {
      directions = [-1, 1]; // Kings can move both directions
    } else {
      directions = [
        piece.isBlack ? 1 : -1
      ]; // Regular pieces move one direction
    }

    // Check for regular moves and captures
    for (final dRow in directions) {
      for (final dCol in [-1, 1]) {
        // Check regular move
        final newRow = row + dRow;
        final newCol = col + dCol;

        if (isValidPosition(newRow, newCol) && pieces[newRow][newCol] == null) {
          moves.add(Vector2(newCol.toDouble(), newRow.toDouble()));
        }

        // Check capture move
        final jumpRow = row + (dRow * 2);
        final jumpCol = col + (dCol * 2);

        if (isValidPosition(jumpRow, jumpCol) &&
            pieces[jumpRow][jumpCol] == null &&
            pieces[newRow][newCol] != null &&
            pieces[newRow][newCol]?.isBlack != piece.isBlack) {
          moves.add(Vector2(jumpCol.toDouble(), jumpRow.toDouble()));
        }
      }
    }

    return moves;
  }

  void movePiece(int fromRow, int fromCol, int toRow, int toCol) {
    final piece = pieces[fromRow][fromCol];
    if (piece == null) return;

    // Check if this is a capture move
    if ((toRow - fromRow).abs() == 2) {
      final capturedRow = (fromRow + toRow) ~/ 2;
      final capturedCol = (fromCol + toCol) ~/ 2;
      final capturedPiece = pieces[capturedRow][capturedCol];
      if (capturedPiece != null) {
        remove(capturedPiece);
        pieces[capturedRow][capturedCol] = null;
      }
    }

    // Move the piece
    pieces[toRow][toCol] = piece;
    pieces[fromRow][fromCol] = null;
    piece.position = Vector2(
      toCol * (size.x / boardSize) + (size.x / boardSize) / 2,
      toRow * (size.y / boardSize) + (size.y / boardSize) / 2,
    );

    // Check for king promotion
    if ((piece.isBlack && toRow == boardSize - 1) ||
        (!piece.isBlack && toRow == 0)) {
      piece.promoteToKing();
    }

    // Update stats if userStats is available
    game.userStats?.updateRandomStats(); // Add null-safe call

    // Switch turns
    game.isBlackTurn = !game.isBlackTurn;
  }

  void clearSelection() {
    selectedPiece = null;
    selectedPosition = null;
  }

  bool checkGameOver() {
    bool blackHasPieces = false;
    bool whiteHasPieces = false;
    bool blackCanMove = false;
    bool whiteCanMove = false;

    for (int row = 0; row < boardSize; row++) {
      for (int col = 0; col < boardSize; col++) {
        final piece = pieces[row][col];
        if (piece != null) {
          if (piece.isBlack) {
            blackHasPieces = true;
            if (getValidMoves(row, col).isNotEmpty) {
              blackCanMove = true;
            }
          } else {
            whiteHasPieces = true;
            if (getValidMoves(row, col).isNotEmpty) {
              whiteCanMove = true;
            }
          }
        }
      }
    }

    if (!blackHasPieces) {
      game.winnerIndex = 1; // White wins
      return true;
    }
    if (!whiteHasPieces) {
      game.winnerIndex = 0; // Black wins
      return true;
    }
    if (!blackCanMove) {
      game.winnerIndex = 1; // White wins
      return true;
    }
    if (!whiteCanMove) {
      game.winnerIndex = 0; // Black wins
      return true;
    }

    return false;
  }

  void randomizePieces(List<Vector2> randomPositions) {
    // Create a list of all current pieces
    List<CheckersPin> currentPieces = [];
    for (int row = 0; row < boardSize; row++) {
      for (int col = 0; col < boardSize; col++) {
        if (pieces[row][col] != null) {
          currentPieces.add(pieces[row][col]!);
        }
      }
    }

    // Clear the current board
    pieces = List.generate(boardSize, (_) => List.filled(boardSize, null));

    // Place pieces in new positions
    final squareSize = size.x / boardSize;
    for (int i = 0; i < currentPieces.length; i++) {
      if (i < randomPositions.length) {
        final newRow = randomPositions[i].y.toInt();
        final newCol = randomPositions[i].x.toInt();

        // Update piece position
        currentPieces[i].position = Vector2(
          newCol * squareSize + squareSize / 2,
          newRow * squareSize + squareSize / 2,
        );

        // Update board state
        pieces[newRow][newCol] = currentPieces[i];
      }
    }
  }

  void initializeFromSession(CheckersSessionData session) {
    // Create a copy of the children list to avoid concurrent modification
    final piecesToRemove = [...children.whereType<CheckersPin>()];

    // Remove all existing pieces
    removeAll(piecesToRemove);

    // Clear pieces array
    pieces = List.generate(boardSize, (_) => List.filled(boardSize, null));

    // Add new pieces from session
    for (final piece in session.pieces) {
      final newPiece = CheckersPin(
        isBlack: piece.position == 2, // 2 = Down = Black
        position: Vector2(
            piece.col * (size.x / boardSize), piece.row * (size.y / boardSize)),
        dimensions: Vector2(size.x / boardSize * 0.8, size.y / boardSize * 0.8),
        spritePath: piece.position == 2
            ? 'assets/images/blackchecker.svg'
            : 'assets/images/whitechecker.svg',
      );

      pieces[piece.row][piece.col] = newPiece;
      add(newPiece);

      if (piece.isKing) {
        newPiece.promoteToKing();
      }
    }

    // Update game controller state
    game.updateGameState(
      isBlackTurn: session.isBlackTurn,
      orangeScore: session.orangeScore,
      blackScore: session.blackScore,
    );
  }
}
