import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:marquis_v2/models/enums.dart';

abstract class MarquisGameController extends FlameGame with TapCallbacks, RiverpodGameMixin {
  MarquisGameController({super.camera, super.children, super.world});

  final playStateNotifier = ValueNotifier(PlayState.welcome);
  final _loadingNotifier = ValueNotifier(false);

  PlayState get playState => playStateNotifier.value;
  double get width => size.x;
  double get height => size.y;
  double get unitSize;
  Vector2 get center => size / 2;
  bool get isTablet => width / height > 0.7;
  ValueNotifier<bool> get loadingNotifier => _loadingNotifier;

  Future<void> updatePlayState(PlayState value) async => playStateNotifier.value = value;

  void displayLoader() => _loadingNotifier.value = true;

  void hideLoader() => _loadingNotifier.value = false;

  Future<void> initGame();
}
