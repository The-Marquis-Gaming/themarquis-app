
// ignore_for_file: unnecessary_null_comparison

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquis_v2/games/checkers/core/components/checkers_board.dart';
import 'package:marquis_v2/games/checkers/core/components/user_stats_component.dart';
import 'package:marquis_v2/games/checkers/core/models/game_state_model.dart';
import 'package:marquis_v2/games/checkers/core/utils/constants.dart';
import 'package:marquis_v2/games/checkers/presentation/state/providers/game_state_provider.dart';
import 'package:marquis_v2/models/enums.dart';
import 'package:marquis_v2/models/marquis_game.dart';

final checkersGameControllerProvider = Provider.autoDispose((ref) {
  return CheckersGameController();
});

class CheckersGameController extends MarquisGameController {
  bool isInit = false;
  CheckersBoard? board;
  late UserStatsComponent userStats;
  int currentPlayer = 0;
  int userIndex = -1;
  bool playerCanMove = false;
  int winnerIndex = -1;
  bool isErrorMessage = false;
  BigInt? _sessionId;
  BigInt? get sessionId => _sessionId;

  CheckersGameController()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: kCheckersGameWidth,
            height: kCheckersGameHeight,
          ),
        );

  @override
  double get unitSize => isTablet ? size.x / 10 : size.x / 15.3;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    overlays.clear();
    overlays.add(PlayState.welcome.name);
    playStateNotifier.value = PlayState.welcome;
  }

  void updateStats({
    required int playerIndex,
    int? lostPieces,
    int? winPieces,
    int? queens,
  }) {
    userStats.updateStats(
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
    userStats = UserStatsComponent()..position = Vector2(0, 20);
    await add(userStats);

    final boardSizeMultiplier = isTablet ? 22 : 13;
    final boardSize = unitSize * boardSizeMultiplier;
    final tabletOffset = isTablet ? -width * 0.12 : 0.0;
    final horizontalOffset = (width - boardSize) / 2 + tabletOffset;
    final verticalOffset = (height - boardSize) / 2;

    board = CheckersBoard()
      ..size = Vector2.all(boardSize)
      ..position = Vector2(horizontalOffset, verticalOffset);
    await add(board!);
  }

  @override
  Future<void> updatePlayState(PlayState value) async {
    overlays.clear();

    if (value == PlayState.waiting && hasRef) {
      await _createGame();
    } else if (value == PlayState.playing) {
      await initGame();
    } else if (board != null) {
      remove(userStats);
      remove(board!);
      board = null;
    }

    overlays.add(value.name);
    playStateNotifier.value = value;
  }

  Future<void> _createGame() async {
    if (!hasRef) return;

    try {
      final gameState = ref.read(gameStateProvider.notifier);
      await gameState.createLobby();
      void handleStateChange(GameState? previous, GameState next) {
        _sessionId = next.sessionId;
        if (next.error != null) {
          isErrorMessage = true;
        }
      }
      ref.listen(gameStateProvider, handleStateChange);
      final currentState = ref.read(gameStateProvider);
      handleStateChange(null, currentState);
    } catch (e) {
      isErrorMessage = true;
      print('Failed to create game: $e');
    }
  }

  Future<void> joinGame(BigInt sessionId) async {
    if (!hasRef) return;

    try {
      final gameState = ref.read(gameStateProvider.notifier);
      await gameState.joinLobby(sessionId);
      _sessionId = sessionId;
    } catch (e) {
      isErrorMessage = true;
      print('Failed to join game: $e');
    }
  }

  String getDisplaySessionId() {
    return _sessionId?.toString().substring(0, 4).toUpperCase() ?? 'A028';
  }

  @override
  void onRemove() {
    super.onRemove();
  }

  bool get hasRef => ref != null;
}
