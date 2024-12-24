import 'package:flutter/material.dart';
import 'package:marquis_v2/games/ludo/widgets/angled_border_with_strokes.dart';

class AngledBorderButton extends StatefulWidget {
  final Widget _child;
  final Color _backgroundColor, _designColor;
  final VoidCallback? _onTap;
  const AngledBorderButton(
      {required Widget child, VoidCallback? onTap, Color backgroundColor = Colors.cyan, Color designColor = Colors.black, super.key})
      : _child = child,
        _backgroundColor = backgroundColor,
        _designColor = designColor,
        _onTap = onTap;

  @override
  State<AngledBorderButton> createState() => _AngledBorderButtonState();
}

class _AngledBorderButtonState extends State<AngledBorderButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget._onTap,
      child: Container(
        decoration: ShapeDecoration(shape: AngledBorderWithStrokes(widget._designColor), color: widget._backgroundColor),
        alignment: Alignment.center,
        height: 52,
        width: double.infinity,
        child: widget._child,
      ),
    );
  }
}
