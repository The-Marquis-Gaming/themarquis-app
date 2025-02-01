import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marquis_v2/games/ludo/ludo_game_controller.dart';

enum DiceState {
  inactive,
  // preparing,
  active,
  rollingDice,
  rolledDice,
  playingMove,
}

class Dice extends PositionComponent
    with TapCallbacks, HasGameReference<LudoGameController> {
  List<int> _values = [1];
  DiceState _state = DiceState.inactive;
  SpriteSheet? diceSpriteSheet;
  List<Sprite?> _currentSprites = [];
  double _emphasisAngle = 0;
  final int playerIndex;
  final bool isCenterRoll;

  final Random random = Random();

  late Sprite rollActiveSprite;
  late Sprite rollInactiveSprite;

  int get value => _values.fold(0, (sum, value) => sum + value);
  List<int> get values => _values;
  set values(List<int> newValues) {
    _values = newValues;
    _currentSprites = values
        .map((value) => diceSpriteSheet!.getSprite(0, min(value - 1, 5)))
        .toList();
    update(0);
  }

  void setValue(int value) {
    print(" reach here ! value: $value");
    _values = [
      ...List.filled(value ~/ 6, 6),
      if (value % 6 != 0) value % 6,
    ];
    print(" reach here ! _values: $_values");
    _currentSprites = _values
        .map((value) => diceSpriteSheet!.getSprite(0, min(value - 1, 5)))
        .toList();
    update(0);
  }

  DiceState get state => _state;
  set state(DiceState newState) {
    _state = newState;
    update(0);
  }

  Dice({
    required Vector2 size,
    required Vector2 position,
    required this.playerIndex,
    this.isCenterRoll = false,
  }) : super(
          size: size,
          position: position,
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    diceSpriteSheet = SpriteSheet(
      image: game.images.fromCache('dice_interface.png'),
      srcSize: Vector2(267, 267),
    );
    _currentSprites = [diceSpriteSheet!.getSprite(0, 0)];

    rollActiveSprite = Sprite(Flame.images.fromCache('active_button.png'));
    rollInactiveSprite = Sprite(Flame.images.fromCache('play.png'));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_state == DiceState.active) {
      _emphasisAngle += dt * 5; // Adjust speed as needed
      if (_emphasisAngle > 2 * pi) {
        _emphasisAngle -= 2 * pi;
      }
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    if (isCenterRoll) {
      if (_state == DiceState.active) {
        rollActiveSprite.render(
          canvas,
          position: Vector2.zero(),
          size: size,
        );
      } else {
        rollInactiveSprite.render(
          canvas,
          position: Vector2.zero(),
          size: size,
        );
      }
    } else {
      final borderPaint = Paint()
        ..color = game.listOfColors[playerIndex]
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      canvas.drawRect(size.toRect(), borderPaint);

      if (_currentSprites.isNotEmpty) {
        final containerSize = size.x; // Assuming square container
        final diceSize = Vector2.all(
            containerSize * 0.8); // Make dice slightly smaller than container
        final maxOffset =
            containerSize * 0.25; // Maximum offset for stacking effect

        // Render dice from first to last, with last one on top
        for (int i = 0; i < _currentSprites.length; i++) {
          final sprite = _currentSprites[i];
          // Calculate offset for stacking effect, scaled to container size
          final offset = Vector2(-maxOffset * (_currentSprites.length - 1 - i),
              -maxOffset * (_currentSprites.length - 1 - i));

          sprite?.render(
            canvas,
            position: offset,
            size: diceSize,
          );
        }
      }
    }

    switch (_state) {
      case DiceState.inactive:
      case DiceState.active:
      case DiceState.rolledDice:
        // _renderDice(canvas); // Comment out dice rendering
        break;
      case DiceState.rollingDice:
        _renderLoadingIndicator(canvas);
        break;
      case DiceState.playingMove:
        // case DiceState.preparing:
        // _renderDice(canvas); // Comment out dice rendering
        _renderLoadingIndicator(canvas);
        break;
    }

    _renderStateIndicator(canvas);
  }

  void _renderLoadingIndicator(Canvas canvas) {
    final center = Offset(size.x / 2, size.y / 2);
    final radius = min(size.x, size.y) / 4;
    final paint = Paint()
      ..color = Colors.cyan
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final sweepAngle =
        2 * pi * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      paint,
    );
  }

  void _renderStateIndicator(Canvas canvas) {
    final indicatorPaint = Paint()..style = PaintingStyle.fill;

    switch (_state) {
      case DiceState.inactive:
        indicatorPaint.color = Colors.red;
        break;
      case DiceState.active:
        // case DiceState.preparing:
        indicatorPaint.color = Colors.green;
        break;
      case DiceState.rollingDice:
        indicatorPaint.color = Colors.yellow;
        break;
      case DiceState.rolledDice:
        indicatorPaint.color = Colors.orange;
        break;
      case DiceState.playingMove:
        indicatorPaint.color = Colors.blue;
        break;
    }

    canvas.drawCircle(
        Offset(size.x * 0.9, size.y * 0.1), size.x / 20, indicatorPaint);
  }

  Future<void> roll() async {
    state = DiceState.rollingDice;
    try {
      final moveResults = await game.generateMove();
      _values = moveResults;
      _currentSprites = _values
          .map((value) => diceSpriteSheet!.getSprite(0, min(value - 1, 5)))
          .toList();
      state = DiceState.rolledDice;
    } catch (e) {
      if (kDebugMode) print(e);
      state = DiceState.active;
    }
  }

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    if (kDebugMode) print("Dice tapped, current state: $_state");

    if (_state == DiceState.active) {
      if (kDebugMode) print("Calling game.rollDice()");
      game.rollDice();
    }
  }

  void setInactive() {
    state = DiceState.inactive;
  }

  void setActive() {
    state = DiceState.active;
  }

  void setRolledDice() {
    state = DiceState.rolledDice;
  }

  void setPlayingMove() {
    state = DiceState.playingMove;
  }
}
