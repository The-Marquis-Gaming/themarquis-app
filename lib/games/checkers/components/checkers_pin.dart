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
    super.onLoad();
    final ByteData data = await rootBundle.load(spritePath);
    final String svgString = String.fromCharCodes(data.buffer.asUint8List());
    checkerSprite = await vg.loadPicture(SvgStringLoader(svgString), null);
  }

  @override
  void render(Canvas canvas) {
    canvas.save();
    canvas.translate(position.x, position.y);
    canvas.scale(
      size.x / checkerSprite.size.width,
      size.y / checkerSprite.size.height,
    );
    canvas.drawPicture(checkerSprite.picture);
    canvas.restore();
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