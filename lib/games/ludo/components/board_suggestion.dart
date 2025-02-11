import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:marquis_v2/games/ludo/ludo_game_controller.dart';
import 'package:marquis_v2/games/ludo/models/ai_suggestion.dart';

class BoardSuggestion extends PositionComponent
    with HasGameReference<LudoGameController> {
  final AISuggestion suggestion;
  late Paint _paint;
  late TextComponent _textComponent;
  bool _isVisible = false;

  BoardSuggestion({
    required this.suggestion,
    required Vector2 position,
    required Vector2 size,
  }) : super(position: position, size: size) {
    _paint = Paint()
      ..color = Colors.yellow.withOpacity(0.3)
      ..style = PaintingStyle.fill;
  }

  @override
  Future<void> onLoad() async {
    _textComponent = TextComponent(
      text: '${suggestion.recommendation.steps}',
      position: size / 2,
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: TextStyle(
          color: Colors.black,
          fontSize: game.unitSize * 0.8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    add(_textComponent);
  }

  @override
  void render(Canvas canvas) {
    if (!_isVisible) return;
    canvas.drawCircle(
      Offset(size.x / 2, size.y / 2),
      size.x / 2,
      _paint,
    );
    super.render(canvas);
  }

  void show() {
    _isVisible = true;
  }

  void hide() {
    _isVisible = false;
  }
}
