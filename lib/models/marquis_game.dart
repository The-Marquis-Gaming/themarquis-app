import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:marquis_v2/models/enums.dart';

abstract class MarquisGameController extends FlameGame with TapCallbacks, RiverpodGameMixin {
  MarquisGameController({super.camera, super.children, super.world});

  final ValueNotifier<PlayState> playStateNotifier = ValueNotifier(PlayState.welcome);

  PlayState get playState => playStateNotifier.value;
  double get width => size.x;
  double get height => size.y;
  double get unitSize;
  Vector2 get center => size / 2;
  bool get isTablet => width / height > 0.7;

  set playState(PlayState value) => playStateNotifier.value = value;

  Future<void> initGame();
}
