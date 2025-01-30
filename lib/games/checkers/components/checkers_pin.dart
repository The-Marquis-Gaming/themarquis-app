import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckersPin extends PositionComponent {
  final bool isBlack;
  final String spritePath;
  bool isKing = false;
  late PictureInfo checkerSprite;
  late PictureInfo kingSprite;

  CheckersPin({
    required this.isBlack,
    required super.position,
    required Vector2 dimensions,
    required this.spritePath,
  }) : super(
          size: dimensions,
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    try {
      // Load the appropriate sprite based on the piece color
      final ByteData data = await rootBundle.load(spritePath);
      final String svgString = String.fromCharCodes(data.buffer.asUint8List());
      checkerSprite = await vg.loadPicture(SvgStringLoader(svgString), null);

      // Debug log
      debugPrint(
          'Loaded ${isBlack ? "black" : "white"} piece sprite from $spritePath at position $position');
    } catch (e) {
      debugPrint('Error loading sprite: $e');
    }
  }

  @override
  void render(Canvas canvas) {
    try {
      canvas.save();

      // Scale the sprite to fit the piece size while maintaining aspect ratio
      final scale = size.x / checkerSprite.size.width;

      // Center the piece
      canvas.translate(position.x, position.y);
      canvas.scale(scale);

      // Center the sprite within the piece
      canvas.translate(
        -checkerSprite.size.width / 2,
        -checkerSprite.size.height / 2,
      );

      canvas.drawPicture(checkerSprite.picture);
      canvas.restore();
    } catch (e) {
      debugPrint('Error rendering piece: $e');
    }
  }

  void promoteToKing() {
    isKing = true;
    // You'll need to add king piece sprites and handle the visual change
  }

  bool canMove(int newRow, int currentRow) {
    if (isKing) return true;
    return isBlack ? newRow > currentRow : newRow < currentRow;
  }
}
