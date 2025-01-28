import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marquis_v2/games/checkers/components/user_stats_component.dart';
import 'package:marquis_v2/games/checkers/providers/checkers_provider.dart';
import 'package:marquis_v2/games/checkers/utils/constants.dart';
import 'package:marquis_v2/models/enums.dart';
import 'package:marquis_v2/models/marquis_game.dart';
import 'package:marquis_v2/games/checkers/components/checkers_board.dart';
import 'package:marquis_v2/games/checkers/models/checkers_session.dart';

class CheckersGameController extends MarquisGameController {
  bool isInit = false;
  CheckersBoard? board;
  UserStatsComponent? userStats;
  int currentPlayer = 0;
  int userIndex = -1;
  bool playerCanMove = false;
  int winnerIndex = -1;
  bool isErrorMessage = false;

  // Update getters to use null-safe access
  bool get isBlackTurn =>
      ref.watch(checkersSessionProvider)?.isBlackTurn ?? true;
  int get blackScore => ref.watch(checkersSessionProvider)?.blackScore ?? 12;
  int get whiteScore => ref.watch(checkersSessionProvider)?.whiteScore ?? 12;

  // Add setter for isBlackTurn
  set isBlackTurn(bool value) {
    if (ref.read(checkersSessionProvider) != null) {
      ref.read(checkersSessionProvider.notifier).updateTurn(value);
    }
  }

  CheckersGameController()
      : super(
            camera: CameraComponent.withFixedResolution(
                width: kCheckersGameWidth, height: kCheckersGameHeight));

  @override
  double get unitSize => isTablet ? size.x / 10 : size.x / 15.3;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    overlays.clear();
    overlays.add(PlayState.welcome.name);
    playStateNotifier.value = PlayState.welcome;

    // Initialize userStats here
    userStats = UserStatsComponent()..position = Vector2(0, 20);
    await add(userStats!);

    // Initialize the board
    board = CheckersBoard();
    await add(board!);
  }

  void updateStats({
    required int playerIndex,
    int? lostPieces,
    int? winPieces,
    int? queens,
  }) {
    userStats?.updateStats(
      playerIndex: playerIndex,
      lostPieces: lostPieces,
      winPieces: winPieces,
      queens: queens,
    );
  }

  @override
  Color backgroundColor() => Colors.transparent;

  @override
  Future<void> initGame() async {
    camera.viewfinder.anchor = Anchor.center;

    // Remove userStats initialization from here since it's done in onLoad
    if (userStats == null) {
      userStats = UserStatsComponent()..position = Vector2(0, 20);
      await add(userStats!);
    }

    final boardSizeMultiplier = isTablet ? 22 : 13;
    final boardSize = unitSize * boardSizeMultiplier;

    final tabletOffset = isTablet ? -width * 0.12 : 0.0;
    final horizontalOffset = (width - boardSize) / 2 + tabletOffset;
    final verticalOffset = (height - boardSize) / 2;

    board = CheckersBoard()
      ..size = Vector2.all(boardSize)
      ..position = Vector2(horizontalOffset, verticalOffset);

    await add(board!);

    // Subscribe to session updates
    final sessionId = ref.read(checkersSessionProvider)?.id;
    if (sessionId != null) {
      await ref
          .read(checkersSessionProvider.notifier)
          .subscribeToSession(sessionId);
    }

    // Initialize board with provider state
    final session = ref.read(checkersSessionProvider);
    if (session != null) {
      board?.initializeFromSession(session);
    }
  }

  @override
  Future<void> updatePlayState(PlayState value) async {
    overlays.clear();
    if (value == PlayState.playing) {
      await initGame();
    } else if (board != null) {
      if (userStats != null) {
        remove(userStats!);
        userStats = null;
      }
      remove(board!);
      board = null;
    }
    overlays.add(value.name);
    playStateNotifier.value = value;
  }

  // Check if the game is over
  bool checkGameOver() {
    final session = ref.read(checkersSessionProvider);
    return session?.isGameOver ?? false;
  }

  Future<void> makeMove(int fromRow, int fromCol, int toRow, int toCol) async {
    final checkersPiece = board?.pieces[fromRow][fromCol];
    if (checkersPiece != null) {
      try {
        // Convert CheckersPin to CheckersPiece
        final piece = CheckersPiece(
          sessionId: int.parse(ref.read(checkersSessionProvider)?.id ?? "0"),
          row: fromRow,
          col: fromCol,
          player: checkersPiece.isBlack ? "2" : "1", // 2 for black, 1 for white
          position:
              checkersPiece.isBlack ? 2 : 1, // 2 for Down/Black, 1 for Up/White
          isKing: checkersPiece.isKing,
          isAlive: true,
        );

        await ref.read(checkersSessionProvider.notifier).movePiece(
              piece: piece,
              targetRow: toRow,
              targetCol: toCol,
            );
      } catch (e) {
        if (kDebugMode) print("Error making move: $e");
      }
    }
  }
}
