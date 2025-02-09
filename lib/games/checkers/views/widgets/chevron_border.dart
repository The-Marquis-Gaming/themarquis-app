import 'package:flutter/material.dart';

class ChevronBorder extends ShapeBorder {
  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    path.moveTo(rect.left, rect.top);
    path.lineTo(rect.right - 10, rect.top);
    path.lineTo(rect.right, rect.top + rect.height / 2);
    path.lineTo(rect.right - 10, rect.bottom);
    path.lineTo(rect.left, rect.bottom);
    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    path.moveTo(rect.left, rect.top);
    path.lineTo(rect.right - 12, rect.top);
    path.lineTo(rect.right, rect.top + rect.height / 2);
    path.lineTo(rect.right - 12, rect.bottom);
    path.lineTo(rect.left, rect.bottom);
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    path.moveTo(rect.right - 26, rect.top - rect.height * 0.03);
    path.lineTo(rect.right - 14, rect.top + rect.height / 2);
    path.lineTo(rect.right - 26, rect.bottom + rect.height * 0.03);
    path.moveTo(rect.right - 18, rect.top - rect.height * 0.03);
    path.lineTo(rect.right - 6, rect.top + rect.height / 2);
    path.lineTo(rect.right - 18, rect.bottom + rect.height * 0.03);
    final paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    paint.color = Color(0xff0f1118);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) => ChevronBorder();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;
}
