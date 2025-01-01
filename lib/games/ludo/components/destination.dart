import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:marquis_v2/games/ludo/components/player_pin.dart';
import 'package:marquis_v2/games/ludo/ludo_game_controller.dart';
import 'package:marquis_v2/models/enums.dart';

class Destination extends PositionComponent with HasGameReference<LudoGameController> {
  Destination() : super(anchor: Anchor.center);

  late Map<int, List<BarComponent>> _bars;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    size = Vector2(game.unitSize * 2.5, game.unitSize * 2.5);
    position = game.size / 2;

    _bars = {
      0: [
        BarComponent(
          playerIndex: 0,
          position: Vector2(0.1875 * game.unitSize, 1.25 * game.unitSize),
          size: Vector2(0.125 * game.unitSize, 1.8 * game.unitSize),
        ),
        BarComponent(
          playerIndex: 0,
          position: Vector2(0.4375 * game.unitSize, 1.25 * game.unitSize),
          size: Vector2(0.125 * game.unitSize, 1.4 * game.unitSize),
        ),
        BarComponent(
          playerIndex: 0,
          position: Vector2(0.6875 * game.unitSize, 1.25 * game.unitSize),
          size: Vector2(0.125 * game.unitSize, 1 * game.unitSize),
        ),
        BarComponent(
          playerIndex: 0,
          position: Vector2(0.9375 * game.unitSize, 1.25 * game.unitSize),
          size: Vector2(0.125 * game.unitSize, 0.5 * game.unitSize),
        ),
      ],
      1: [
        BarComponent(
          playerIndex: 1,
          position: Vector2(1.25 * game.unitSize, 0.1875 * game.unitSize),
          size: Vector2(1.8 * game.unitSize, 0.125 * game.unitSize),
        ),
        BarComponent(
          playerIndex: 1,
          position: Vector2(1.25 * game.unitSize, 0.4375 * game.unitSize),
          size: Vector2(1.4 * game.unitSize, 0.125 * game.unitSize),
        ),
        BarComponent(
          playerIndex: 1,
          position: Vector2(1.25 * game.unitSize, 0.6875 * game.unitSize),
          size: Vector2(1 * game.unitSize, 0.125 * game.unitSize),
        ),
        BarComponent(
          playerIndex: 1,
          position: Vector2(1.25 * game.unitSize, 0.9375 * game.unitSize),
          size: Vector2(0.5 * game.unitSize, 0.125 * game.unitSize),
        ),
      ],
      3: [
        BarComponent(
          playerIndex: 3,
          position: Vector2(1.25 * game.unitSize, 2.3125 * game.unitSize),
          size: Vector2(1.8 * game.unitSize, 0.125 * game.unitSize),
        ),
        BarComponent(
          playerIndex: 3,
          position: Vector2(1.25 * game.unitSize, 2.0625 * game.unitSize),
          size: Vector2(1.4 * game.unitSize, 0.125 * game.unitSize),
        ),
        BarComponent(
          playerIndex: 3,
          position: Vector2(1.25 * game.unitSize, 1.8125 * game.unitSize),
          size: Vector2(1 * game.unitSize, 0.125 * game.unitSize),
        ),
        BarComponent(
          playerIndex: 3,
          position: Vector2(1.25 * game.unitSize, 1.5625 * game.unitSize),
          size: Vector2(0.5 * game.unitSize, 0.125 * game.unitSize),
        ),
      ],
      2: [
        BarComponent(
          playerIndex: 2,
          position: Vector2(2.3125 * game.unitSize, 1.25 * game.unitSize),
          size: Vector2(0.125 * game.unitSize, 1.8 * game.unitSize),
        ),
        BarComponent(
          playerIndex: 2,
          position: Vector2(2.0625 * game.unitSize, 1.25 * game.unitSize),
          size: Vector2(0.125 * game.unitSize, 1.4 * game.unitSize),
        ),
        BarComponent(
          playerIndex: 2,
          position: Vector2(1.8125 * game.unitSize, 1.25 * game.unitSize),
          size: Vector2(0.125 * game.unitSize, 1 * game.unitSize),
        ),
        BarComponent(
          playerIndex: 2,
          position: Vector2(1.5625 * game.unitSize, 1.25 * game.unitSize),
          size: Vector2(0.125 * game.unitSize, 0.5 * game.unitSize),
        ),
      ]
    };
    for (var bars in _bars.values) {
      for (var bar in bars) {
        add(bar);
      }
    }
  }

  final Map<int, List<PlayerPin>> _players = {0: [], 1: [], 2: [], 3: []};

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRRect(
        RRect.fromLTRBR(0, 0, game.unitSize * 2.5, game.unitSize * 2.5, const Radius.circular(6.0)),
        Paint()
          ..color = const Color(0xff4c4c4c)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2);
  }

  void addPin(PlayerPin pin) {
    final index = (_players[pin.playerIndex]!..add(pin)).length - 1;
    _bars[pin.playerIndex]![index].lightUp();
    if (index == 3) {
      // Show winner announcement before changing game state
      game.showGameMessage(message: 'The Winner is ${game.playerNames[pin.playerIndex]}!', durationSeconds: 5);

      // Delay the game over screen
      Future.delayed(const Duration(seconds: 5), () async {
        await game.updatePlayState(PlayState.finished);
        game.winnerIndex = pin.playerIndex;
      });
    }
  }
}

class BarComponent extends PositionComponent with HasPaint, HasGameReference<LudoGameController> {
  final int playerIndex;
  BarComponent({
    required this.playerIndex,
    required Vector2 position,
    required Vector2 size,
  }) : super(position: position, size: size, anchor: Anchor.center) {
    paint = Paint()..color = const Color(0xff3a3a3a);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRRect(RRect.fromRectAndRadius(size.toRect(), const Radius.circular(5)), paint);
  }

  void lightUp() {
    add(
      ColorEffect(
        game.listOfColors[playerIndex],
        EffectController(
          duration: 1,
        ),
      ),
    );
  }
}
