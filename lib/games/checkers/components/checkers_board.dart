import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquis_v2/games/checkers/components/checkers_pin.dart';
import 'package:marquis_v2/games/checkers/components/checkers_state.dart';
import 'package:marquis_v2/games/checkers/models/checkers_session.dart';
import 'package:flutter/foundation.dart';
import 'package:marquis_v2/models/enums.dart';
import 'dart:math' as math;

import '../checkers_game_controller.dart';

class MovePosition {
  final int row;
  final int col;
  final bool isCapture;

  MovePosition({
    required this.row,
    required this.col,
    this.isCapture = false,
  });
}

class CheckersBoard extends RectangleComponent
    with HasGameReference<CheckersGameController>, TapCallbacks {
  static const int boardSize = 8;
  late PictureInfo blackPinSprite;
  late PictureInfo whitePinSprite;

  // Track selected piece
  CheckersPin? selectedPiece;
  Vector2? selectedPosition;
  bool isProcessingMove = false;

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

    // Make the board square and fit within the screen
    final screenMinDimension = math.min(game.width, game.height);
    final boardSizeFloat = screenMinDimension *
        0.8; // Board takes up 80% of the smaller screen dimension

    // Set square size
    size = Vector2(boardSizeFloat, boardSizeFloat);

    // Center the board on screen
    position = Vector2((game.width - size.x) / 2, (game.height - size.y) / 2);

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

    // Initialize the board state with 8x8 grid
    pieces = List.generate(
      8, // Use constant boardSize (8) for the grid
      (row) => List.generate(8, (col) => null),
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

    // Highlight selected piece
    if (selectedPiece != null && selectedPosition != null) {
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(
          selectedPosition!.x * squareSize,
          selectedPosition!.y * squareSize,
          squareSize,
          squareSize,
        ),
        const Radius.circular(3),
      );

      canvas.drawRRect(
        rect,
        Paint()
          ..color = const Color.fromRGBO(
              255, 215, 0, 0.5) // Gold color for selected piece
          ..style = PaintingStyle.fill,
      );
    }

    // Highlight valid moves
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

        // Draw move indicator
        canvas.drawRRect(
          rect,
          Paint()
            ..color =
                const Color.fromRGBO(76, 175, 80, 0.5) // Green for valid moves
            ..style = PaintingStyle.fill,
        );

        // Draw a dot in the center of valid move squares
        final centerX = move.x * squareSize + squareSize / 2;
        final centerY = move.y * squareSize + squareSize / 2;
        canvas.drawCircle(
          Offset(centerX, centerY),
          squareSize * 0.15, // Size of the dot
          Paint()
            ..color = const Color.fromRGBO(
                76, 175, 80, 0.8) // Darker green for the dot
            ..style = PaintingStyle.fill,
        );
      }
    }

    // Draw loading overlay if processing move
    if (isProcessingMove) {
      canvas.drawRect(
        Rect.fromLTWH(0, 0, size.x, size.y),
        Paint()..color = const Color.fromRGBO(0, 0, 0, 0.3),
      );

      // Draw loading indicator
      final centerX = size.x / 2;
      final centerY = size.y / 2;
      final radius = size.x * 0.1;
      final paint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3;

      for (int i = 0; i < 8; i++) {
        final startAngle = (i * math.pi / 4) + (game.currentTime * 2);
        canvas.drawArc(
          Rect.fromCenter(
            center: Offset(centerX, centerY),
            width: radius,
            height: radius,
          ),
          startAngle,
          math.pi / 8,
          false,
          paint..color = Colors.white.withOpacity(1 - (i * 0.1)),
        );
      }
    }
  }

  @override
  bool onTapUp(TapUpEvent event) {
    if (isProcessingMove) return false;  // Ignore taps while processing move

    final position = event.localPosition;
    final row = (position.y / (size.y / boardSize)).floor();
    final col = (position.x / (size.x / boardSize)).floor();

    if (!isValidPosition(row, col)) return false;

    // If a piece is already selected
    if (selectedPiece != null && selectedPosition != null) {
      final fromRow = selectedPosition!.y.toInt();
      final fromCol = selectedPosition!.x.toInt();

      // Check if the tap is on a valid move position
      final validMoves = getValidMoves(fromRow, fromCol);
      final isMoveValid =
          validMoves.any((move) => move.row == row && move.col == col);

      if (isMoveValid) {
        // Start processing move
        isProcessingMove = true;
        
        // Clear selection immediately
        clearSelection();
        
        // Make the move through the provider
        makeNetworkMove(fromRow, fromCol, row, col).then((_) {
          isProcessingMove = false;
        }).catchError((error) {
          isProcessingMove = false;
          debugPrint('Error making move: $error');
        });
        
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

      // Show valid moves
      gameState.validMoves.clear();
      final validMoves = getValidMoves(row, col);
      for (final move in validMoves) {
        gameState.validMoves
            .add(Vector2(move.col.toDouble(), move.row.toDouble()));
      }

      return true;
    }

    return false;
  }

  bool isValidPosition(int row, int col) {
    return row >= 0 && row < boardSize && col >= 0 && col < boardSize;
  }

  List<Vector2> getValidMovesAsVector2(int row, int col) {
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
    // Clear existing pieces
    for (int row = 0; row < boardSize; row++) {
      for (int col = 0; col < boardSize; col++) {
        if (pieces[row][col] != null) {
          remove(pieces[row][col]!);
          pieces[row][col] = null;
        }
      }
    }

    // Calculate square size and piece size
    final squareSize = size.x / boardSize;
    final pieceSize = squareSize * 0.8;

    // Initialize standard checkers setup
    // Black pieces on top (rows 0-2), White pieces on bottom (rows 5-7)
    // Only on dark squares (where row + col is odd)
    for (int row = 0; row < boardSize; row++) {
      for (int col = 0; col < boardSize; col++) {
        if ((row + col) % 2 == 1) {
          // Only place pieces on dark squares
          bool shouldPlacePiece = false;
          bool isBlack = false;

          if (row < 3) {
            // Top three rows
            shouldPlacePiece = true;
            isBlack = true;
          } else if (row > 4) {
            // Bottom three rows
            shouldPlacePiece = true;
            isBlack = false;
          }

          if (shouldPlacePiece) {
            final piecePosition = Vector2(
              col * squareSize + (squareSize / 2),
              row * squareSize + (squareSize / 2),
            );

      final newPiece = CheckersPin(
              isBlack: isBlack,
              position: piecePosition,
              dimensions: Vector2.all(pieceSize),
              spritePath: isBlack
            ? 'assets/images/blackchecker.svg'
            : 'assets/images/whitechecker.svg',
      );

            pieces[row][col] = newPiece;
      add(newPiece);
          }
        }
      }
    }

    // Update game controller state
    game.updateGameState(
      isBlackTurn: session.isBlackTurn,
      orangeScore: session.orangeScore,
      blackScore: session.blackScore,
    );
  }

  bool isValidMove(int fromRow, int fromCol, int toRow, int toCol) {
    final piece = pieces[fromRow][fromCol];
    if (piece == null) return false;

    // Check if it's the player's turn
    final isBlackTurn = game.isBlackTurn;
    if (piece.isBlack != isBlackTurn) return false;

    // Calculate valid moves for the piece
    final validMoves = getValidMovesAsVector2(fromRow, fromCol);
    return validMoves.any((move) => move.y == toRow && move.x == toCol);
  }

  Future<void> makeNetworkMove(
      int fromRow, int fromCol, int toRow, int toCol) async {
    if (!isValidMove(fromRow, fromCol, toRow, toCol)) return;

    try {
      await game.makeMove(fromRow, fromCol, toRow, toCol);
      // The board will be updated through the websocket event
    } catch (e) {
      if (kDebugMode) print("Error moving piece: $e");
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Check for game over conditions
    if (game.checkGameOver()) {
      game.updatePlayState(PlayState.finished);
    }
  }

  List<MovePosition> getValidMoves(int row, int col) {
    final piece = pieces[row][col];
    if (piece == null) return [];

    final moves = <MovePosition>[];
    final directions = piece.isKing
        ? [
            [-1, -1],
            [-1, 1],
            [1, -1],
            [1, 1]
          ]
        : piece.isBlack
            ? [
                [1, -1],
                [1, 1]
              ]
            : [
                [-1, -1],
                [-1, 1]
              ];

    // Check normal moves
    for (final dir in directions) {
      final newRow = row + dir[0];
      final newCol = col + dir[1];
      if (_isValidPosition(newRow, newCol) && pieces[newRow][newCol] == null) {
        moves.add(MovePosition(row: newRow, col: newCol));
      }
    }

    // Check capture moves
    final captureMoves =
        _getCaptureMoves(row, col, piece.isBlack, piece.isKing);
    moves.addAll(captureMoves);

    return moves;
  }

  List<MovePosition> _getCaptureMoves(
      int row, int col, bool isBlack, bool isKing) {
    final moves = <MovePosition>[];
    final directions = isKing
        ? [
            [-1, -1],
            [-1, 1],
            [1, -1],
            [1, 1]
          ]
        : isBlack
            ? [
                [1, -1],
                [1, 1]
              ]
            : [
                [-1, -1],
                [-1, 1]
              ];

    for (final dir in directions) {
      final jumpRow = row + dir[0] * 2;
      final jumpCol = col + dir[1] * 2;
      final midRow = row + dir[0];
      final midCol = col + dir[1];

      if (_isValidPosition(jumpRow, jumpCol) &&
          pieces[jumpRow][jumpCol] == null &&
          pieces[midRow][midCol] != null &&
          pieces[midRow][midCol]!.isBlack != isBlack) {
        moves.add(MovePosition(row: jumpRow, col: jumpCol, isCapture: true));
      }
    }

    return moves;
  }

  bool _isValidPosition(int row, int col) {
    return row >= 0 && row < boardSize && col >= 0 && col < boardSize;
  }
}
