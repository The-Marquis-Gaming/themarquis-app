import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:marquis_v2/games/ludo/ludo_game_controller.dart';

Map<int, List<double>> spriteLocationMap = {
  0: [1, 1, 2160, 2160], // x, y, w, h
  1: [2163, 1, 2160, 2160],
  3: [1, 2163, 2160, 2160],
  2: [2163, 2163, 2160, 2160],
};

class PlayerAvatar extends SpriteComponent with HasGameReference<LudoGameController> {
  PlayerAvatar(
    Vector2 position,
    int index,
  ) : super(
          position: position,
          sprite: Sprite(
            Flame.images.fromCache('avatar_spritesheet.png'),
            srcPosition: Vector2(spriteLocationMap[index]![0], spriteLocationMap[index]![1]),
            srcSize: Vector2(spriteLocationMap[index]![2], spriteLocationMap[index]![3]),
          ),
        );

  @override
  FutureOr<void> onLoad() {
    size = Vector2(game.unitSize * 2.75, game.unitSize * 2.75);
    return super.onLoad();
  }
}
