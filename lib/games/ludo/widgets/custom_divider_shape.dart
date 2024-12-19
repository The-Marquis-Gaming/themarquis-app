import 'package:flutter/material.dart';

class CustomDividerShape extends ShapeBorder {
  final Color color;
  final bool isReversed;

  const CustomDividerShape({
    required this.color,
    this.isReversed = false,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _createDividerPath(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _createDividerPath(rect);
  }

  Path _createDividerPath(Rect rect) {
    final path = Path();

    if (isReversed) {
      // Reversed (opposite) shape
      path.moveTo(rect.right, rect.bottom);
      path.lineTo(rect.right + 10, rect.top - 0.3);
      path.lineTo(rect.left + rect.width / 2 - 10, rect.top);
      path.lineTo(rect.left + rect.width / 2, rect.bottom);

    } else {
      // Original shape
      path.moveTo(rect.left, rect.top);
      path.lineTo(rect.left + 10, rect.bottom);
      path.lineTo(rect.left + rect.width / 2, rect.bottom);
      path.lineTo(rect.left + (rect.width / 2) + 10, rect.top);
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    final paint = Paint();
    paint.strokeWidth = 1;
    paint.style = PaintingStyle.stroke;
    paint.color = color;
    path.moveTo(rect.left, rect.top);
    path.lineTo(rect.right, rect.top);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) => CustomDividerShape(
    color: color,
    isReversed: isReversed,
  );
}