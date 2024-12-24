import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquis_v2/games/ludo/components/player_pin.dart';
import 'package:marquis_v2/games/ludo/ludo_game_controller.dart';

final playerFirstTile = {
  0: Vector2(0, 0),
};

class Board extends RectangleComponent with HasGameReference<LudoGameController> {
  late PictureInfo centerSvgInfo;

  Board()
      : super(
          paint: Paint()..color = const Color(0xff0f1118),
        );
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    size = Vector2(game.width, game.height);

    final ByteData data = await rootBundle.load('assets/svg/center_board_box.svg');
    final String svgString = String.fromCharCodes(data.buffer.asUint8List());
    centerSvgInfo = await vg.loadPicture(SvgStringLoader(svgString), null);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    double dxStart = game.unitSize * 0.75;
    double dyStart = center.y - 1.5 * game.unitSize;
    List<int> coloredBox = [1, 7, 8, 9, 10, 11];
    List<int> starBox = [1];
    List<int> arrowBox = [6];
    for (var i = 0; i < 18; i++) {
      final x = dxStart + (i % 6) * game.unitSize;
      final y = dyStart + (i ~/ 6) * game.unitSize;
      final rrect = RRect.fromLTRBR(x, y, x + game.unitSize, y + game.unitSize, const Radius.circular(7.0));
      canvas.drawRRect(
        rrect,
        Paint()
          ..color = coloredBox.contains(i) ? game.listOfColors[0] : const Color(0xff606060)
          ..style = PaintingStyle.stroke
          ..strokeWidth = coloredBox.contains(i) ? 2.0 : 1.0,
      );

      if (starBox.contains(i)) {
        _drawStar(canvas, x + game.unitSize / 2, y + game.unitSize / 2, game.unitSize * 0.2, game.listOfColors[0]);
      }

      if (arrowBox.contains(i)) {
        _drawArrow(canvas, x + game.unitSize / 2, y + game.unitSize / 2, game.unitSize * 0.3, 0, game.listOfColors[0]);
      }
    }

    dxStart = center.x - 1.5 * game.unitSize;
    dyStart = center.y - 7.75 * game.unitSize;
    coloredBox = [4, 5, 7, 10, 13, 16];
    starBox = [5];
    arrowBox = [1];
    for (var i = 0; i < 18; i++) {
      final x = dxStart + (i % 3) * game.unitSize;
      final y = dyStart + (i ~/ 3) * game.unitSize;
      final rrect = RRect.fromLTRBR(x, y, x + game.unitSize, y + game.unitSize, const Radius.circular(7.0));

      canvas.drawRRect(
        rrect,
        Paint()
          ..color = coloredBox.contains(i) ? game.listOfColors[1] : const Color(0xff606060)
          ..style = PaintingStyle.stroke
          ..strokeWidth = coloredBox.contains(i) ? 2.0 : 1.0,
      );

      if (starBox.contains(i)) {
        _drawStar(canvas, x + game.unitSize / 2, y + game.unitSize / 2, game.unitSize * 0.2, game.listOfColors[1]);
      }

      if (arrowBox.contains(i)) {
        _drawArrow(canvas, x + game.unitSize / 2, y + game.unitSize / 2, game.unitSize * 0.3, pi / 2, game.listOfColors[1]);
      }
    }
    dxStart = center.x + 1.75 * game.unitSize;
    dyStart = center.y - 1.5 * game.unitSize;
    coloredBox = [6, 7, 8, 9, 10, 16];
    starBox = [16];
    arrowBox = [11];
    for (var i = 0; i < 18; i++) {
      final x = dxStart + (i % 6) * game.unitSize;
      final y = dyStart + (i ~/ 6) * game.unitSize;
      final rrect = RRect.fromLTRBR(x, y, x + game.unitSize, y + game.unitSize, const Radius.circular(7.0));
      canvas.drawRRect(
        rrect,
        Paint()
          ..color = coloredBox.contains(i) ? game.listOfColors[2] : const Color(0xff606060)
          ..style = PaintingStyle.stroke
          ..strokeWidth = coloredBox.contains(i) ? 2.0 : 1.0,
      );

      if (starBox.contains(i)) {
        _drawStar(canvas, x + game.unitSize / 2, y + game.unitSize / 2, game.unitSize * 0.2, game.listOfColors[2]);
      }

      if (arrowBox.contains(i)) {
        _drawArrow(canvas, x + game.unitSize / 2, y + game.unitSize / 2, game.unitSize * 0.3, pi, game.listOfColors[2]);
      }
    }

    dxStart = center.x - 1.5 * game.unitSize;
    dyStart = center.y + 1.75 * game.unitSize;
    coloredBox = [1, 4, 7, 10, 12, 13];
    starBox = [12];
    arrowBox = [16];
    for (var i = 0; i < 18; i++) {
      final x = dxStart + (i % 3) * game.unitSize;
      final y = dyStart + (i ~/ 3) * game.unitSize;
      final rrect = RRect.fromLTRBR(x, y, x + game.unitSize, y + game.unitSize, const Radius.circular(7.0));
      canvas.drawRRect(
        rrect,
        Paint()
          ..color = coloredBox.contains(i) ? game.listOfColors[3] : const Color(0xff606060)
          ..style = PaintingStyle.stroke
          ..strokeWidth = coloredBox.contains(i) ? 2.0 : 1.0,
      );

      if (starBox.contains(i)) {
        _drawStar(canvas, x + game.unitSize / 2, y + game.unitSize / 2, game.unitSize * 0.2, game.listOfColors[3]);
      }

      if (arrowBox.contains(i)) {
        _drawArrow(canvas, x + game.unitSize / 2, y + game.unitSize / 2, game.unitSize * 0.3, -pi / 2, game.listOfColors[3]);
      }
    }

    // Draw center pattern
    canvas.save();
    canvas.translate(
      center.x - 1.5 * game.unitSize,
      center.y - 1.5 * game.unitSize,
    );

    // Draw the SVG
    // canvas.scale(
    //   (game.unitSize * 3) / centerSvgInfo.size.width,
    //   (game.unitSize * 3) / centerSvgInfo.size.height,
    // );
    // canvas.drawPicture(centerSvgInfo.picture);

    canvas.restore();
  }

  int convertToGlobalIndex(int playerIndex, int positionIndex) {
    //relative to player 1
    switch (playerIndex) {
      case 0:
        return positionIndex;
      case 1:
        return (positionIndex + 13) % 52;
      case 2:
        return (positionIndex + 26) % 52;
      case 3:
        return (positionIndex + 39) % 52;
      default:
        return 0;
    }
  }

  List<PlayerPin> getPinsAtPosition(int playerIndex, int positionIndex) {
    final List<PlayerPin> results = [];
    for (var pin in children.whereType<PlayerPin>()) {
      if (convertToGlobalIndex(pin.playerIndex, pin.currentPosIndex) == convertToGlobalIndex(playerIndex, positionIndex)) {
        results.add(pin);
      }
    }
    return results;
  }

  PlayerPin? getPinWithIndex(int playerIndex, int pinIndex) {
    for (var pin in children.whereType<PlayerPin>()) {
      if (pin.playerIndex == playerIndex && pin.homeIndex == pinIndex) {
        return pin;
      }
    }
    return null;
  }

  List<PlayerPin> getPlayerPinsOnBoard(int playerIndex) {
    final List<PlayerPin> results = [];
    for (var pin in children.whereType<PlayerPin>()) {
      if (pin.playerIndex == playerIndex) {
        results.add(pin);
      }
    }
    return results;
  }

  Future<void> attackPin(PlayerPin pin) async {
    pin.currentPosIndex = -1;
    final playerHome = game.playerHomes[pin.playerIndex];
    remove(pin);
    await pin.removed;
    await playerHome.returnPin(pin);
  }

  Future<void> addPin(PlayerPin pin, {int location = 0, isInit = false}) async {
    await add(pin
      ..onTap = (event, pin) {
        if ((pin.currentPosIndex >= 0 || game.currentDice.values.length > 1) && (pin.currentPosIndex + game.currentDice.value <= 56)) {
          return true;
        }
        return false;
      });
    if (kDebugMode) print("moving pin");
    await pin.movePin(location, maxDuration: isInit ? 2 : 7);
  }

  Map<String, List<PlayerPin>> overlappingPins = {};

  void updateOverlappingPins() {
    overlappingPins.clear();
    for (var pin in children.whereType<PlayerPin>()) {
      String key = '${pin.playerIndex}-${pin.currentPosIndex}';
      if (!overlappingPins.containsKey(key)) {
        overlappingPins[key] = [];
      }
      overlappingPins[key]!.add(pin);
    }

    for (var pins in overlappingPins.values) {
      if (pins.length > 1) {
        for (var pin in pins) {
          pin.badgeCount = pins.length;
        }
      } else if (pins.length == 1) {
        pins[0].badgeCount = 1;
      }
    }
  }

  // @override
  // void update(double dt) {
  //   super.update(dt);
  //   updateOverlappingPins();
  // }

  void _drawStar(Canvas canvas, double x, double y, double size, Color color) {
    final path = Path();
    final angle = (2 * pi) / 5;
    final halfAngle = angle / 2;

    for (int i = 0; i < 5; i++) {
      final distance = size;
      final currAngle = (i * angle) - pi / 2;
      final innerDistance = size / 2;

      if (i == 0) {
        path.moveTo(
          x + cos(currAngle) * distance,
          y + sin(currAngle) * distance,
        );
      } else {
        path.lineTo(
          x + cos(currAngle) * distance,
          y + sin(currAngle) * distance,
        );
      }

      path.lineTo(
        x + cos(currAngle + halfAngle) * innerDistance,
        y + sin(currAngle + halfAngle) * innerDistance,
      );
    }
    path.close();

    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }

  void _drawArrow(Canvas canvas, double x, double y, double size, double rotation, Color color) {
    canvas.save();
    canvas.translate(x, y);
    canvas.rotate(rotation);

    final textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(Icons.arrow_forward_ios.codePoint),
        style: TextStyle(
          fontSize: size,
          color: color,
          fontFamily: Icons.arrow_forward_ios.fontFamily,
          package: Icons.arrow_forward_ios.fontPackage,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(-textPainter.width / 2, -textPainter.height / 2),
    );

    canvas.restore();
  }

  bool onTapUp(TapUpEvent event) {
    // Only show invalid move message when it's not the player's turn
    if (game.currentPlayer != game.userIndex) {
      showInvalidMoveMessage();
    }
    return true;
  }

  void showInvalidMoveMessage() async {
    // Remove existing messages
    final existingMessages = game.children.whereType<CustomRectangleComponent>().toList();
    for (final message in existingMessages) {
      game.remove(message);
    }

    // Show invalid move message
    final messageContainer = CustomRectangleComponent(
      position: Vector2(game.size.x / 2, game.size.y - 170),
      size: Vector2(500, 50),
      anchor: Anchor.center,
      color: const Color(0xFFFF4D4D),
      borderRadius: 12,
      children: [
        SpriteComponent(
          sprite: Sprite(game.images.fromCache('subway_error.png')),
          position: Vector2(100, 25),
          size: Vector2(24, 24),
          anchor: Anchor.center,
        ),
        TextComponent(
          text: 'Invalid move! You cannot place a pin here',
          position: Vector2(130, 25),
          anchor: Anchor.centerLeft,
          textRenderer: TextPaint(
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );

    game.add(messageContainer);

    // After 2 seconds, remove invalid message and restore original
    await Future.delayed(const Duration(seconds: 2));
    game.remove(messageContainer);

    // Only show original message if it's still not player's turn
    if (game.currentPlayer != game.userIndex) {
      final originalMessage = CustomRectangleComponent(
        position: Vector2(game.size.x / 2, game.size.y - 170),
        size: Vector2(500, 50),
        anchor: Anchor.center,
        color: const Color(0xFF1A3B44),
        borderRadius: 12,
        children: [
          SpriteComponent(
            sprite: Sprite(game.images.fromCache('dice_icon.png')),
            position: Vector2(100, 25),
            size: Vector2(24, 24),
            anchor: Anchor.center,
          ),
          TextComponent(
            text: 'No tokens available to move. Roll a 6 to start!',
            position: Vector2(130, 25),
            anchor: Anchor.centerLeft,
            textRenderer: TextPaint(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );

      game.add(originalMessage);
    }
  }
}
