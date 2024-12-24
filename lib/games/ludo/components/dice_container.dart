import 'package:flame/components.dart';
import 'package:marquis_v2/games/ludo/components/dice.dart';
import 'package:marquis_v2/games/ludo/ludo_game_controller.dart';

class DiceContainer extends PositionComponent with HasGameReference<LudoGameController> {
  Dice currentDice;

  DiceContainer({
    required Vector2 position,
    required Vector2 size,
    required Dice dice,
  })  : currentDice = dice,
        super(
          position: position,
          size: size,
          anchor: Anchor.center,
        ) {
    add(currentDice..position = size / 2);
  }

  Dice replaceDice(Dice dice) {
    remove(currentDice);
    final previousDice = currentDice;
    currentDice = dice;
    currentDice.position = size / 2;
    add(currentDice);
    return previousDice;
  }
}
