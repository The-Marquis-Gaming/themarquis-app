import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../core/game/checkers_game_controller.dart';

class UserStatsComponent extends PositionComponent with HasGameReference<CheckersGameController> {
  late TextComponent player1Name;
  late TextComponent player2Name;
  late SpriteComponent player1Avatar;
  late SpriteComponent player2Avatar;

  @override
  Future<void> onLoad() async {
    try {
      // Load sprites with proper error handling
      final topAvatar = await Flame.images.load('Frame 2085661553.png');
      final bottomAvatar = await Flame.images.load('Frame 2085661554.png');
      final blackPieceSprite = await Flame.images.load('blackchecker.png');
      final whitePieceSprite = await Flame.images.load('whitechecker.png');
      final queenSprite = await Flame.images.load('queen.png');

      // Calculate scaling based on screen size
      final isTablet = game.width / game.height > 0.7;
      final scale = isTablet ? 1.2 : 1.0; // Increase size by 20% for tablets

      // Adjust component sizes and positions for larger screens
      final baseSize = Vector2(80, 60) * scale;
      // final spacing = isTablet ? 24.0 : 20.0;
      // final fontSize = isTablet ? 18.0 : 14.0;

      // Create sprites from loaded images
      final topAvatarSprite = Sprite(topAvatar);
      final bottomAvatarSprite = Sprite(bottomAvatar);
      final blackPieceComponentSprite = Sprite(blackPieceSprite);
      final whitePieceComponentSprite = Sprite(whitePieceSprite);
      final queenComponentSprite = Sprite(queenSprite);

      // Top player stats sections with reduced spacing
      await _createStatsContainer(
        text: "LOST PIECES",
        value: "10",
        position: Vector2(20, 100),
        icon: blackPieceComponentSprite,
        containerSize: baseSize,
      );

      await _createStatsContainer(
        text: "WIN PIECES",
        value: "9",
        position: Vector2(120, 100),
        icon: blackPieceComponentSprite,
        containerSize: baseSize,
      );

      await _createStatsContainer(
        text: "QUEENS",
        value: "2",
        position: Vector2(235, 100),
        icon: queenComponentSprite,
        containerSize: baseSize,
      );

      // Top player name and avatar
      player1Name = TextComponent(
        text: 'VYCHU...',
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
      player1Name.position = Vector2(isTablet ? 400 : 360, 75);
      await add(player1Name);

      player1Avatar = SpriteComponent(
        sprite: topAvatarSprite,
        position: Vector2(isTablet ? game.width - 125 : game.width - 85, 100),
        size: Vector2(60, 60),
      );
      await add(player1Avatar);

      // Bottom player name and avatar (starting from left)
      player2Name = TextComponent(
        text: 'SOOBIN...',
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
      player2Name.position = Vector2(20, game.height - 210);
      await add(player2Name);

      player2Avatar = SpriteComponent(
        sprite: bottomAvatarSprite,
        position: Vector2(20, game.height - 187),
        size: Vector2(60, 60),
      );
      await add(player2Avatar);

      // Bottom player stats sections with reduced spacing (following avatar)
      await _createStatsContainer(
        text: "LOST PIECES",
        value: "2",
        position: Vector2(105, game.height - 187),
        icon: whitePieceComponentSprite,
        containerSize: baseSize,
      );

      await _createStatsContainer(
        text: "WIN PIECES",
        value: "1",
        position: Vector2(220, game.height - 187),
        icon: whitePieceComponentSprite,
        containerSize: baseSize,
      );

      await _createStatsContainer(
        text: "QUEENS",
        value: "0",
        position: Vector2(isTablet ? game.width - 145 : game.width - 100, game.height - 187),
        icon: queenComponentSprite,
        containerSize: baseSize,
      );
    } catch (e) {
      if (kDebugMode) print('Error loading assets: $e');
      rethrow;
    }
  }

  Future<void> _createStatsContainer({
    required String text,
    required String value,
    required Vector2 position,
    required Sprite icon,
    required Vector2 containerSize,
  }) async {
    // Stats label ABOVE container
    final label = TextComponent(
      text: text,
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
    label.position = position + Vector2(5, -20); // Position above container
    await add(label);

    // Container background
    final container = RectangleComponent(
      position: position,
      size: containerSize,
      paint: Paint()..color = const Color(0xFF442916).withOpacity(0.5),
    );
    await add(container);

    // Stats value and icon inside container
    final valueComponent = TextComponent(
      text: value,
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    valueComponent.position = position + Vector2(10, 20);
    await add(valueComponent);

    final iconComponent = SpriteComponent(
      sprite: icon,
      position: position + Vector2(45, 20),
      size: Vector2(15, 15),
    );
    await add(iconComponent);
  }

  void updateStats({
    required int playerIndex,
    int? lostPieces,
    int? winPieces,
    int? queens,
  }) {
    if (playerIndex == 0) {
      // Update top player stats
      if (lostPieces != null) _updateStatValue("LOST PIECES", lostPieces.toString(), false);
      if (winPieces != null) _updateStatValue("WIN PIECES", winPieces.toString(), false);
      if (queens != null) _updateStatValue("QUEENS", queens.toString(), false);
    } else {
      // Update bottom player stats
      if (lostPieces != null) _updateStatValue("LOST PIECES", lostPieces.toString(), true);
      if (winPieces != null) _updateStatValue("WIN PIECES", winPieces.toString(), true);
      if (queens != null) _updateStatValue("QUEENS", queens.toString(), true);
    }
  }

  void _updateStatValue(String statName, String newValue, bool isBottom) {
    // Implementation to update the specific stat text component
    // You'll need to store references to these text components when creating them
  }

  void updateRandomStats() {
    // Generate random stats for both players
    final random = Random();
    updateStats(
      playerIndex: 0,
      lostPieces: random.nextInt(12),
      winPieces: random.nextInt(12),
      queens: random.nextInt(4),
    );
    updateStats(
      playerIndex: 1,
      lostPieces: random.nextInt(12),
      winPieces: random.nextInt(12),
      queens: random.nextInt(4),
    );
  }
}
