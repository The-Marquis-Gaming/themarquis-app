import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart';
import 'dart:math' as math;

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

      if (kDebugMode) {
        print(
            'Loaded ${isBlack ? "black" : "white"} piece sprite at position $position with size $size');
      }
    } catch (e) {
      debugPrint('Error loading sprite: $e');
    }
  }

  @override
  void render(Canvas canvas) {
    try {
      if (checkerSprite.picture.approximateBytesUsed.isNegative) return;

      canvas.save();

      // Calculate the scale to fit the piece within its bounds
      final scale = math.min(size.x / checkerSprite.size.width,
          size.y / checkerSprite.size.height);

      // Center the piece in its square
      canvas.translate(size.x / 2, size.y / 2);
      canvas.scale(scale);

      // Center the sprite
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
