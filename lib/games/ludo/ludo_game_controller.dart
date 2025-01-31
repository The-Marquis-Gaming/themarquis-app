import 'dart:async' as dart_async;
import 'dart:async';
import 'dart:io';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquis_v2/games/ludo/components/board.dart';
import 'package:marquis_v2/games/ludo/components/destination.dart';
import 'package:marquis_v2/games/ludo/components/dice.dart';
import 'package:marquis_v2/games/ludo/components/dice_container.dart';
import 'package:marquis_v2/games/ludo/components/player_home.dart';
import 'package:marquis_v2/games/ludo/components/player_pin.dart';
import 'package:marquis_v2/games/ludo/config.dart';
import 'package:marquis_v2/games/ludo/ludo_session.dart';
import 'package:marquis_v2/games/ludo/models/ludo_session.dart';
import 'package:marquis_v2/models/enums.dart';
import 'package:marquis_v2/models/marquis_game.dart';
import 'package:marquis_v2/providers/user.dart';

class LudoGameController extends MarquisGameController {
  bool isInit = false;
  DiceContainer? diceContainer;
  Board? board;
  late TextComponent turnText;
  Destination? destination;
  final List<PlayerHome> playerHomes = [];
  final List<List<int>> playerPinLocations = [
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
  ];
  int _currentPlayer = 0;
  int _userIndex = -1;
  bool playerCanMove = false;
  final int totalPlayers = 4;
  int? winnerIndex;
  LudoSessionData? _sessionData;
  int pendingMoves = 0;
  bool isErrorMessage = false;
  dart_async.Timer? _messageTimer;
  Completer<void>? ludoSessionLoadingCompleter;

  set sessionData(LudoSessionData value) => _sessionData = value;

  LudoGameController()
      : super(
            camera: CameraComponent.withFixedResolution(
                width: kLudoGameWidth, height: kLudoGameHeight));

  int get currentPlayer => _currentPlayer;

  @override
  double get unitSize => size.x / 17;

  List<Color> get listOfColors =>
      _sessionData?.getListOfColors ??
      const [
        Color(0xffd04c2f),
        Color(0xff2fa9d0),
        Color(0xff2fd06f),
        Color(0xffb0d02f),
      ];
  int get userIndex => _userIndex;
  List<String> get playerNames => _sessionData!.sessionUserStatus
      .map((user) => user.email.split('@')[0])
      .toList();

  Dice get currentDice => diceContainer!.currentDice;
  Dice? getPlayerDice(int playerIndex) => playerHomes[playerIndex].playerDice;

  Future<List<int>> generateMove() async {
    try {
      final res = await ref.read(ludoSessionProvider.notifier).generateMove();
      return res;
    } catch (e) {
      await showGameMessage(message: e.toString(), backgroundColor: Colors.red);
      return [];
    }
  }

  Future<void> playMove(int index) async {
    try {
      diceContainer?.currentDice.state = DiceState.playingMove;
      await ref.read(ludoSessionProvider.notifier).playMove(index.toString());
    } catch (e) {
      diceContainer!.currentDice.state = DiceState.rolledDice;
      await showGameMessage(message: e.toString(), backgroundColor: Colors.red);
    }
  }

  @override
  Future<void> updatePlayState(PlayState value) async {
    if (playStateNotifier.value == value) return;
    if (value != PlayState.playing) {
      if (board != null) {
        add(board!);
        Future.microtask(() => remove(board!));
      }
      if (diceContainer != null) {
        add(diceContainer!);
        Future.microtask(() => remove(diceContainer!));
      }
      if (playerHomes.isNotEmpty) {
        addAll(playerHomes);
        Future.microtask(() => removeAll(playerHomes));
      }
      if (destination != null) {
        add(destination!);
        Future.microtask(() => remove(destination!));
      }
    }
    playStateNotifier.value = value;

    switch (value) {
      case PlayState.welcome:
      case PlayState.waiting:
        overlays.clear();
        overlays.add(value.name);
        break;
      case PlayState.playing:
        overlays.clear();
        if (_sessionData != null) await initGame();
        break;
      case PlayState.finished:
        overlays.clear();
        overlays.add(value.name);
        Future.microtask(
          () async {
            if (buildContext != null && buildContext!.mounted) {
              // Force rebuild of game over screen
              (buildContext! as Element).markNeedsBuild();

              if (playState == PlayState.finished) {
                if (buildContext != null && buildContext!.mounted) {
                  await showDialog(
                    context: buildContext!,
                    useRootNavigator: false,
                    barrierDismissible: false,
                    builder: (context) => GameOverDialog(
                      isWinning: _userIndex == winnerIndex,
                      playerName: playerNames[winnerIndex!],
                      tokenAddress: _sessionData!.playToken,
                      tokenAmount: _sessionData!.playAmount,
                    ),
                  );
                }
              }
            }
          },
        );

        break;
    }
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _sessionData = ref.read(ludoSessionProvider);
    overlays.clear();
    overlays.add(PlayState.welcome.name);
    playStateNotifier.value = PlayState.welcome;

    addToGameWidgetBuild(() {
      ref.listen(ludoSessionProvider, (prev, next) async {
        if (ludoSessionLoadingCompleter != null) {
          await ludoSessionLoadingCompleter!.future;
        }
        _handleLudoSessionUpdate(next);
      });
    });
  }

  Future<void> _handleLudoSessionUpdate(LudoSessionData? next) async {
    ludoSessionLoadingCompleter = Completer<void>();
    _sessionData = next;
    
    if (_sessionData != null) {
      // Remove the immediate play state update for FULL status
      // Let the timer handle the transition instead
      if (_sessionData!.message != null) {
        await showGameMessage(
          message: _sessionData!.message!,
          backgroundColor: Colors.red,
        );
        if (_sessionData!.message!.startsWith("EXITED")) {
          await ref
              .read(ludoSessionProvider.notifier)
              .clearData(refreshUser: true);
          await updatePlayState(PlayState.welcome);
          return;
        }
      }
      if (playState == PlayState.welcome) {
        await updatePlayState(PlayState.waiting);
      }
      // Update pin locations
      if (playState == PlayState.playing && isInit) {
        try {
          final prevPlayer = _currentPlayer;
          _currentPlayer = _sessionData!.nextPlayerIndex;
          playerCanMove = false;
          updateTurnText();

          if (_sessionData!.currentDiceValue != null) {
            int diceValue = _sessionData!.currentDiceValue!;
            await prepareNextPlayerDice(prevPlayer, diceValue);
          }
          if (_currentPlayer == _userIndex) {
            diceContainer?.currentDice.state = DiceState.active;
          } else {
            diceContainer?.currentDice.state = DiceState.inactive;
          }
          final movePinsCompleter = Completer<void>();
          for (final player in _sessionData!.sessionUserStatus) {
            final pinLocations = player.playerTokensPosition;
            final currentPinLocations = playerPinLocations[player.playerId];
            final playerHome = playerHomes[player.playerId];
            for (int i = 0; i < pinLocations.length; i++) {
              final pinLocation = int.parse(pinLocations[i]) +
                  (player.playerTokensCircled?[i] ?? false ? 52 : 0);
              if (player.playerWinningTokens[i] == true &&
                  currentPinLocations[i] != -1) {
                // Remove from board and add to destination
                playerPinLocations[player.playerId][i] = -1;
                final pin = board!.getPinWithIndex(player.playerId, i);
                await pin?.movePin(56);
                // board.remove(pin!);
                // await pin.removed;
                // destination.addPin(pin);
              } else if (player.playerWinningTokens[i] != true &&
                  currentPinLocations[i] != pinLocation) {
                if (currentPinLocations[i] == 0 && pinLocation != 0) {
                  // Remove from home and add to board
                  final pin = playerHome.removePin(i);

                  if (pin != null) {
                    if (!pin.isRemoved) {
                      await pin.removed;
                    }
                    await board!.addPin(pin,
                        location: pinLocation - player.playerId * 13 - 1);
                  }
                } else if (currentPinLocations[i] != 0 && pinLocation == 0) {
                  // Pin attacked
                  final pin = board!.getPinWithIndex(player.playerId, i);
                  movePinsCompleter.future.then((_) async {
                    await board!.attackPin(pin!);
                  });
                } else {
                  // Move pin
                  final pin = board!.getPinWithIndex(player.playerId, i);
                  await pin?.movePin(pinLocation - player.playerId * 13 - 1);
                }
                playerPinLocations[player.playerId][i] = pinLocation;
              }
            }
          }
          movePinsCompleter.complete();
        } catch (e) {
          await showGameMessage(
              message: e.toString(), backgroundColor: Colors.red);
        }
      }
    }
    ludoSessionLoadingCompleter?.complete();
    ludoSessionLoadingCompleter = null;
  }

  @override
  Future<void> initGame() async {
    if (!Platform.environment.containsKey('FLUTTER_TEST')) {
      await Flame.images.loadAll([
        'spritesheet.png',
        'avatar_spritesheet.png',
        'dice_interface.png',
        'active_button.png',
        'play.png',
        'dice_icon.png',
      ]);
    }

    camera.viewfinder.anchor = Anchor.topLeft;
    _userIndex = _sessionData!.sessionUserStatus.indexWhere(
        (user) => user.userId.toString() == ref.read(userProvider)?.id);
    _currentPlayer = _sessionData!.nextPlayerIndex;
    board = Board();
    await add(board!);
    final positions = [
      Vector2(center.x - unitSize * 6.25,
          center.y - unitSize * 6.25), // Top-left corner (Player 1)
      Vector2(center.x + unitSize * 2.25,
          center.y - unitSize * 6.25), // Top-right corner (Player 2)
      Vector2(center.x + unitSize * 2.25,
          center.y + unitSize * 2.25), // Bottom-right corner (Player 3)
      Vector2(center.x - unitSize * 6.25,
          center.y + unitSize * 2.25), // Bottom-left corner (Player 4)
    ];
    for (int i = 0; i < positions.length; i++) {
      playerHomes
          .add(PlayerHome(i, _sessionData!.sessionUserStatus[i], positions[i]));
      await add(playerHomes.last);
    }

    destination = Destination();
    await add(destination!);

    await createAndSetCurrentPlayerDice();

    turnText = TextComponent(
      text: '',
      position: Vector2(size.x / 2, size.y * 0.10),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: TextStyle(
          fontSize: unitSize * 1.2,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          shadows: [
            Shadow(
              color: _sessionData!.getListOfColors[_currentPlayer]
                  .withOpacity(0.8),
              offset: const Offset(0, 0),
              blurRadius: 20,
            ),
            Shadow(
              color: _sessionData!.getListOfColors[_currentPlayer]
                  .withOpacity(0.8),
              offset: const Offset(0, 0),
              blurRadius: 10,
            ),
          ],
        ),
      ),
    );
    await add(turnText);

    await mounted;

    for (var player in _sessionData!.sessionUserStatus) {
      final pinLocations = player.playerTokensPosition;
      final playerHome = playerHomes[player.playerId];
      for (int i = 0; i < pinLocations.length; i++) {
        var pinLocation = int.parse(pinLocations[i]) +
            (player.playerTokensCircled?[i] ?? false ? 52 : 0);

        if (player.playerWinningTokens[i] == true) {
          playerPinLocations[player.playerId][i] = -1;
          // playerHome.removePin(i);
          final pin = playerHome.removePin(i);
          // await pin.removed;
          if (pin != null) {
            destination!.addPin(pin);
          }
        } else if (pinLocation != 0 || player.playerTokensCircled?[i] == true) {
          final pin = playerHome.removePin(i);
          //  pin.removed;
          if (pin != null) {
            board!.addPin(pin,
                location: pinLocation - player.playerId * 13 - 1, isInit: true);
            playerPinLocations[player.playerId][i] = pinLocation;
          }
        }
      }
    }
    updateTurnText();
    isInit = true;
    // Add message container with text
    // final messageContainer = CustomRectangleComponent(
    //   position: Vector2(size.x / 2, size.y - 170),
    //   size: Vector2(500, 50),
    //   anchor: Anchor.center,
    //   color: const Color(0xFF1A3B44),
    //   borderRadius: 12,
    //   children: [
    //     SpriteComponent(
    //       sprite: Sprite(Flame.images.fromCache('dice_icon.png')),
    //       position: Vector2(100, 25), // Center horizontally and vertically
    //       size: Vector2(24, 24),
    //       anchor: Anchor.center,
    //     ),
    //     TextComponent(
    //       text: 'No tokens available to move. Roll a 6 to start!',
    //       position: Vector2(130, 25), // Position text next to centered icon
    //       anchor: Anchor.centerLeft,
    //       textRenderer: TextPaint(
    //         style: const TextStyle(
    //           color: Colors.white,
    //           fontSize: 14,
    //           fontWeight: FontWeight.w500,
    //         ),
    //       ),
    //     ),
    //   ],
    // );

    // await add(messageContainer);
  }

  void updateTurnText() {
    final playerName = playerNames[_currentPlayer];
    turnText.text =
        _currentPlayer == _userIndex ? 'Your Turn' : "$playerName's Turn";
    turnText.textRenderer = TextPaint(
      style: TextStyle(
        fontSize: unitSize * 1.2,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: 'Orbitron',
        shadows: [
          Shadow(
            color: Color.fromRGBO(9, 138, 238, 1),
            offset: const Offset(0, 0),
            blurRadius: 10,
          ),
          Shadow(
            color:
                _sessionData!.getListOfColors[_currentPlayer].withOpacity(0.8),
            offset: const Offset(0, 0),
            blurRadius: 6,
          ),
        ],
      ),
    );
  }

  Future<void> rollDice() async {
    // if (kDebugMode) print("rollDice called, playerCanMove: $playerCanMove");
    if (playerCanMove) return;
    if (diceContainer!.currentDice.state == DiceState.rollingDice) return;

    // Show animated dice dialog
    if (buildContext?.mounted == true) {
      showDialog(
        context: buildContext!,
        barrierDismissible: false,
        useRootNavigator: false,
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          child:
              SizedBox(width: 120, height: 120, child: DiceAnimationWidget()),
        ),
      );
    }

    // if (kDebugMode) print("Rolling dice...");
    await diceContainer!.currentDice.roll();
    if (buildContext?.mounted == true) Navigator.of(buildContext!).pop();
    // if (kDebugMode) print("Dice rolled, value: ${diceContainer!.currentDice.value}");
    await prepareNextPlayerDice(
        _currentPlayer, diceContainer!.currentDice.value);

    if (diceContainer!.currentDice.value > 0 &&
        diceContainer!.currentDice.value < 7 &&
        buildContext?.mounted == true) {
      await showDialog(
        context: buildContext!,
        barrierDismissible: false,
        useRootNavigator: false,
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          child: SizedBox(
              width: 120,
              height: 120,
              child: DiceAnimationWidget(
                  dieFace: diceContainer!.currentDice.value)),
        ),
      );
    }

    List<PlayerPin> listOfPlayerPin = board!.getPlayerPinsOnBoard(_userIndex);
    List<PlayerPin> movablePins = [];

    for (PlayerPin pin in listOfPlayerPin) {
      if (pin.canMove) {
        movablePins.add(pin);
      }
    }

    // If there are no movable pins and the dice value is less than 6, show a snackbar
    if (movablePins.isEmpty) {
      final pinsAtHome = playerHomes[_userIndex].pinsAtHome;
      if (diceContainer!.currentDice.value < 6) {
        if (pinsAtHome.isNotEmpty) {
          await showGameMessage(
              message: "Can not move from Basement, try to get a 6!!");
          // If there are pins at home, play the first one (dummy move)
          await playMove(pinsAtHome[0]!.homeIndex);
          return;
        } else {
          await showGameMessage(message: "No pins to move!!");
          // If there are no pins at home, play the first pin on the board (dummy move)
          final pins = board!.getPlayerPinsOnBoard(_userIndex);
          await playMove(pins[0].homeIndex);
          return;
        }
      } else {
        // If the dice value is greater or equal to 6, play the first pin on the board or the only pin at home
        if (pinsAtHome.isEmpty) {
          await showGameMessage(message: "No pins to move!!");
          // If there are no pins at home, play the first pin on the board (dummy move)
          final pins = board!.getPlayerPinsOnBoard(_userIndex);
          await playMove(pins[0].homeIndex);
          return;
        } else if (pinsAtHome.length == 1) {
          // If there is only one pin at home, play it
          await playMove(pinsAtHome[0]!.homeIndex);
          return;
        }
      }
    }

    if ((movablePins.length == 1 && diceContainer!.currentDice.value < 6) ||
        (movablePins.length == 1 &&
            diceContainer!.currentDice.value > 6 &&
            playerHomes[_userIndex].pinsAtHome.isEmpty)) {
      // Automatically play move on the only movable pin
      await playMove(movablePins[0].homeIndex);
      return;
    }

    playerCanMove = true;
  }

  @override
  Color backgroundColor() => const Color(0xff0f1118);

  @override
  void onRemove() {
    _messageTimer?.cancel();
    super.onRemove();
  }

  Future<void> createAndSetCurrentPlayerDice() async {
    final newDice = Dice(
      size: Vector2(200, 80),
      position: Vector2(size.x / 2, size.y - 120),
      playerIndex: _currentPlayer,
      isCenterRoll: true,
    );
    if (_currentPlayer == _userIndex) {
      newDice.state = DiceState.active;
    } else {
      newDice.state = DiceState.inactive;
    }
    diceContainer = DiceContainer(
      position: Vector2(size.x / 2, size.y - 70),
      size: Vector2(200, 80),
      dice: newDice,
    );
    await add(diceContainer!);
  }

  Future<void> prepareNextPlayerDice(int playerIndex, int diceValue) async {
    final playerHome = playerHomes[playerIndex];
    await playerHome.setDiceValue(diceValue);
  }

  //Unused Method

  // Future<void> showDiceDialog() async {
  //   if (!buildContext!.mounted) return;

  //   showDialog(
  //     context: buildContext!,
  //     barrierDismissible: false,
  //     useRootNavigator: false,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         backgroundColor: Colors.transparent,
  //         child: SizedBox(width: 120, height: 120, child: GameWidget(game: this)),
  //       );
  //     },
  //   );

  //   // Roll the dice
  //   await rollDice();

  //   // Close dialog after roll animation
  //   if (buildContext!.mounted) {
  //     Navigator.of(buildContext!).pop();
  //   }
  // }

  Future<void> showGameMessage({
    required String message,
    Color backgroundColor = const Color(0xFF1A3B44),
    int durationSeconds = 3,
  }) async {
    // Remove existing message container
    children.whereType<CustomRectangleComponent>().forEach((container) {
      remove(container);
    });

    final messageContainer = CustomRectangleComponent(
      position: Vector2(size.x / 2, size.y - 170),
      size: Vector2(500, 50),
      anchor: Anchor.center,
      color: backgroundColor,
      borderRadius: 12,
      children: [
        SpriteComponent(
          sprite: Sprite(Flame.images.fromCache('dice_icon.png')),
          position: Vector2(100, 25),
          size: Vector2(24, 24),
          anchor: Anchor.center,
        ),
        TextBoxComponent(
          text: message,
          position: Vector2(130, 25),
          anchor: Anchor.centerLeft,
          boxConfig: TextBoxConfig(
            maxWidth:
                340, // Container width (500) - icon position (100) - icon width (24) - padding (36)
          ),
          textRenderer: TextPaint(
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Orbitron',
            ),
          ),
        ),
      ],
    );

    await add(messageContainer);

    if (durationSeconds > 0) {
      await Future.delayed(Duration(seconds: durationSeconds), () {
        if (contains(messageContainer)) remove(messageContainer);
      });
    }
  }
}

// Custom Rectangle Component with rounded corners
class CustomRectangleComponent extends PositionComponent {
  final Color color;
  final double borderRadius;

  CustomRectangleComponent({
    required Vector2 position,
    required Vector2 size,
    required this.color,
    required this.borderRadius,
    Anchor anchor = Anchor.topLeft,
    List<Component>? children,
  }) : super(
            position: position, size: size, anchor: anchor, children: children);

  @override
  void render(Canvas canvas) {
    final rrect =
        RRect.fromRectAndRadius(size.toRect(), Radius.circular(borderRadius));
    canvas.drawRRect(
      rrect,
      Paint()..color = color,
    );
    super.render(canvas);
  }
}

class DiceAnimationWidget extends StatefulWidget {
  final bool _playInfinitely;
  final int? _dieFace;

  const DiceAnimationWidget(
      {super.key,

      /// If `dieFace` is provided, the dice will call `Navigator.pop()` after 2 seconds
      int? dieFace})
      : _dieFace = dieFace,
        _playInfinitely = dieFace == null ? true : false;
  @override
  State<DiceAnimationWidget> createState() => _DiceAnimationWidgetState();
}

class _DiceAnimationWidgetState extends State<DiceAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late int currentDiceFace;
  final List<int> diceSequence = [1, 2, 3, 4, 5, 6];

  @override
  void initState() {
    super.initState();
    currentDiceFace = widget._dieFace ?? 1;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _controller.addListener(() {
      // Change dice face every ~166ms (1000ms / 6 faces)
      currentDiceFace = diceSequence[(_controller.value * 6).floor() % 6];
      // setState(() {});
    });

    if (widget._playInfinitely) {
      _controller.repeat();
    } else if (widget._dieFace != null) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) Navigator.of(context).pop();
      });
    } else {
      _controller.repeat();
      Future.delayed(const Duration(seconds: 2), () {
        _controller.stop();
        if (mounted) Navigator.of(context).pop();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Center(
          child: Image.asset('assets/images/dice_$currentDiceFace.png',
              width: 80, height: 80),
        );
      },
    );
  }
}

class GameOverDialog extends ConsumerStatefulWidget {
  const GameOverDialog({
    super.key,
    required this.isWinning,
    required this.tokenAddress,
    required this.tokenAmount,
    required this.playerName,
  });
  final bool isWinning;
  final String playerName;
  final String tokenAddress;
  final String tokenAmount;
  @override
  ConsumerState<GameOverDialog> createState() => _GameOverDialogState();
}

class _GameOverDialogState extends ConsumerState<GameOverDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Main Dialog Container
          Container(
            margin: const EdgeInsets.only(top: 40),
            width: 180,
            decoration: BoxDecoration(
              color: Color.fromRGBO(26, 32, 45, 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 60),
                Text(
                  widget.isWinning ? 'REWARD' : 'WINNER',
                  style: const TextStyle(
                    color: Color(0xFF00ECFF),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //show player profile image, if winner not current user
                    if (!widget.isWinning)
                      Column(
                        children: [
                          Image.asset('assets/images/jason.png'),
                          Text(widget.playerName),
                        ],
                      ),
                    //show token amount and token address
                    Column(
                      children: [
                        if (widget.tokenAmount != '0')
                          FutureBuilder(
                              future: ref
                                  .read(userProvider.notifier)
                                  .getSupportedTokens(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text("");
                                } else {
                                  final roomStake =
                                      "${(((double.tryParse(widget.tokenAmount)) ?? 0) / 1e18 * (widget.isWinning ? 4 : -1)).toStringAsFixed(7).replaceAll(RegExp(r'0*$'), '')}"
                                      "${snapshot.data!.firstWhere((e) => e["tokenAddress"] == widget.tokenAddress)["tokenName"]}";
                                  return Text(
                                    roomStake,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                }
                              }),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/会员.svg',
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              '400 EXP',
                              style: TextStyle(
                                color: Color(0xFF00ECFF),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset('assets/images/ok_btn.svg'),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          // Header Image positioned on top
          Positioned(
            top: -20,
            child: Image.asset(
              widget.isWinning
                  ? 'assets/images/header-win.png'
                  : 'assets/images/header-lose.png',
              height: 100,
              width: 300,
            ),
          ),
        ],
      ),
    );
  }
}