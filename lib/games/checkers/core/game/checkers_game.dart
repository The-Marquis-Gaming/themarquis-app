import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:marquis_v2/games/checkers/core/components/checkers_board.dart';
import 'package:marquis_v2/games/checkers/core/components/user_stats_component.dart';
import 'package:marquis_v2/games/checkers/core/utils/constants.dart';

enum CheckersPlayState { welcome, waiting, playing, finished }

class CheckersGame extends FlameGame with RiverpodGameMixin {
  bool isInit = false;
  late CheckersBoard? board;
  late UserStatsComponent userStats;
  int currentPlayer = 0;
  int userIndex = -1;
  bool playerCanMove = false;
  int winnerIndex = -1;
  bool isErrorMessage = false;

  final playStateNotifier = ValueNotifier<CheckersPlayState>(CheckersPlayState.playing);

  CheckersGame()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  double get width => size.x;
  double get height => size.y;
  double get unitSize => isTablet ? size.x / 10 : size.x / 15.3;
  Vector2 get center => size / 2;

  bool get isTablet => width / height > 0.7;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    camera.viewfinder.anchor = Anchor.center;
    
    userStats = UserStatsComponent()
      ..position = Vector2(0, 20);
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
} 