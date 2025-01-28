import 'package:flutter/material.dart';

class DividerShape extends ShapeBorder {
  final Color color;

  const DividerShape(this.color);
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    path.moveTo(rect.left, rect.top);
    path.lineTo(rect.left + 10, rect.bottom);
    path.lineTo(rect.left + rect.width / 2, rect.bottom);
    path.lineTo(rect.left + (rect.width / 2) + 10, rect.top);
    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    path.moveTo(rect.left, rect.top);
    path.lineTo(rect.left + 10, rect.bottom);
    path.lineTo(rect.left + rect.width / 2, rect.bottom);
    path.lineTo(rect.left + (rect.width / 2) + 10, rect.top);
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    final paint = Paint();
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;
    paint.color = color;
    path.moveTo(rect.left, rect.top);
    path.lineTo(rect.right, rect.top);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) => DividerShape(color);
}
