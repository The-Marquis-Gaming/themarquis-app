import 'package:flutter/material.dart';

class AnimatedSnackbar extends StatefulWidget {
  final String message;
  final String timeStamp;
  const AnimatedSnackbar({required this.message, required this.timeStamp, required Key key}) : super(key: key);

  @override
  State<AnimatedSnackbar> createState() => _AnimatedSnackbarState();
}

class _AnimatedSnackbarState extends State<AnimatedSnackbar> with TickerProviderStateMixin {
  late final AnimationController _slideController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  late final Animation<Offset> _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(_slideController);

  @override
  void initState() {
    super.initState();
    _slideController.forward();
    Future.delayed(const Duration(seconds: 3), () {
      if (_slideController.isDismissed || !mounted) return;
      _slideController.reverse();
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Offstage(
        offstage: _slideAnimation.isCompleted,
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.primaryDelta! > 0) _slideController.reverse();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    widget.message,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
