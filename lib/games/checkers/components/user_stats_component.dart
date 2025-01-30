import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marquis_v2/games/checkers/providers/checkers_provider.dart';
import 'package:marquis_v2/providers/starknet.dart';

import '../checkers_game_controller.dart';

class UserStatsComponent extends PositionComponent
    with HasGameReference<CheckersGameController> {
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
      final scale = isTablet ? 1.2 : 1.0;

      // Adjust component sizes and positions for larger screens
      final baseSize = Vector2(80, 60) * scale;

      // Create sprites from loaded images
      final topAvatarSprite = Sprite(topAvatar);
      final bottomAvatarSprite = Sprite(bottomAvatar);
      final blackPieceComponentSprite = Sprite(blackPieceSprite);
      final whitePieceComponentSprite = Sprite(whitePieceSprite);
      final queenComponentSprite = Sprite(queenSprite);

      // Get initial session data
      final session = game.ref.read(checkersSessionProvider);
      final playerAddress = game.ref
          .read(starknetProvider)
          .signerAccount
          ?.accountAddress
          .toHexString();

      String topPlayerName = '...';
      String bottomPlayerName = '...';
      String topLostPieces = '0';
      String topWinPieces = '0';
      String topQueens = '0';
      String bottomLostPieces = '0';
      String bottomWinPieces = '0';
      String bottomQueens = '0';

      if (session != null) {
        final currentPlayerStatus = session.sessionUserStatus.firstWhere(
          (status) => status.userId == playerAddress,
          orElse: () => session.sessionUserStatus.first,
        );

        final opponentStatus = session.sessionUserStatus.firstWhere(
          (status) => status.userId != playerAddress,
          orElse: () => session.sessionUserStatus.last,
        );

        // Set player names
        if (currentPlayerStatus.position == "up") {
          topPlayerName = _truncateEmail(currentPlayerStatus.email);
          bottomPlayerName = _truncateEmail(opponentStatus.email);
        } else {
          topPlayerName = _truncateEmail(opponentStatus.email);
          bottomPlayerName = _truncateEmail(currentPlayerStatus.email);
        }

        // Set initial stats
        if (currentPlayerStatus.position == "up") {
          topLostPieces = (12 - session.orangeScore).toString();
          topWinPieces = session.orangeScore.toString();
          bottomLostPieces = (12 - session.blackScore).toString();
          bottomWinPieces = session.blackScore.toString();
        } else {
          topLostPieces = (12 - session.blackScore).toString();
          topWinPieces = session.blackScore.toString();
          bottomLostPieces = (12 - session.orangeScore).toString();
          bottomWinPieces = session.orangeScore.toString();
        }
      }

      // Top player stats sections with reduced spacing
      await _createStatsContainer(
        text: "LOST PIECES",
        value: topLostPieces,
        position: Vector2(20, 100),
        icon: blackPieceComponentSprite,
        containerSize: baseSize,
      );

      await _createStatsContainer(
        text: "WIN PIECES",
        value: topWinPieces,
        position: Vector2(120, 100),
        icon: blackPieceComponentSprite,
        containerSize: baseSize,
      );

      await _createStatsContainer(
        text: "QUEENS",
        value: topQueens,
        position: Vector2(235, 100),
        icon: queenComponentSprite,
        containerSize: baseSize,
      );

      // Top player name and avatar
      player1Name = TextComponent(
        text: topPlayerName,
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
        text: bottomPlayerName,
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
        value: bottomLostPieces,
        position: Vector2(105, game.height - 187),
        icon: whitePieceComponentSprite,
        containerSize: baseSize,
      );

      await _createStatsContainer(
        text: "WIN PIECES",
        value: bottomWinPieces,
        position: Vector2(220, game.height - 187),
        icon: whitePieceComponentSprite,
        containerSize: baseSize,
      );

      await _createStatsContainer(
        text: "QUEENS",
        value: bottomQueens,
        position: Vector2(
            isTablet ? game.width - 145 : game.width - 100, game.height - 187),
        icon: queenComponentSprite,
        containerSize: baseSize,
      );
    } catch (e) {
      if (kDebugMode) print('Error loading assets: $e');
      rethrow;
    }
  }

  String _truncateEmail(String email) {
    if (email.length <= 7) return email;
    return '${email.substring(0, 6)}...';
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
      if (lostPieces != null)
        _updateStatValue("LOST PIECES", lostPieces.toString(), false);
      if (winPieces != null)
        _updateStatValue("WIN PIECES", winPieces.toString(), false);
      if (queens != null) _updateStatValue("QUEENS", queens.toString(), false);
    } else {
      // Update bottom player stats
      if (lostPieces != null)
        _updateStatValue("LOST PIECES", lostPieces.toString(), true);
      if (winPieces != null)
        _updateStatValue("WIN PIECES", winPieces.toString(), true);
      if (queens != null) _updateStatValue("QUEENS", queens.toString(), true);
    }
  }

  void _updateStatValue(String statName, String newValue, bool isBottom) {
    // Find all text components
    final components = children.whereType<TextComponent>();

    // Find the value component for this stat
    final valueComponent = components.firstWhere(
      (component) {
        final isMatchingPosition = isBottom
            ? component.position.y > game.height / 2 // Bottom half
            : component.position.y < game.height / 2; // Top half

        // Check if this is a value component (not a label)
        final isValueComponent =
            component.position.y > (isBottom ? game.height - 187 : 100);

        // Match the horizontal position based on stat name
        final horizontalMatch = statName == "LOST PIECES"
            ? component.position.x < 150
            : statName == "WIN PIECES"
                ? component.position.x > 150 && component.position.x < 300
                : component.position.x > 300;

        return isMatchingPosition && isValueComponent && horizontalMatch;
      },
      orElse: () => TextComponent(text: '0'),
    );

    // Update the value
    if (valueComponent.text != newValue) {
      valueComponent.text = newValue;
    }
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
