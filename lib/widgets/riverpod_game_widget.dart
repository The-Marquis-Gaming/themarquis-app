import 'package:flame/game.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodGameWidget<T extends FlameGame> extends ConsumerStatefulWidget {
  final T game;
  final Map<String, Widget Function(BuildContext, T)>? overlayBuilderMap;

  const RiverpodGameWidget({
    super.key,
    required this.game,
    this.overlayBuilderMap,
  });

  @override
  ConsumerState<RiverpodGameWidget<T>> createState() =>
      RiverpodGameWidgetState<T>();
}

class RiverpodGameWidgetState<T extends FlameGame>
    extends ConsumerState<RiverpodGameWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return GameWidget(
      key: widget.key,
      game: widget.game,
      overlayBuilderMap: widget.overlayBuilderMap,
    );
  }
}
