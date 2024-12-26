import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquis_v2/games/ludo/ludo_game_controller.dart';
import 'package:marquis_v2/games/ludo/ludo_session.dart';
import 'package:marquis_v2/games/ludo/models/ludo_session.dart';
import 'package:marquis_v2/games/ludo/screens/create_game_screen.dart';
import 'package:marquis_v2/games/ludo/widgets/pin_color_option.dart';
import 'package:marquis_v2/models/enums.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:marquis_v2/widgets/balance_appbar.dart';
import 'package:marquis_v2/widgets/error_dialog.dart';
import 'package:marquis_v2/widgets/ui_widgets.dart';

class LudoWelcomeScreen extends ConsumerStatefulWidget {
  const LudoWelcomeScreen({super.key, required this.game});
  final LudoGameController game;

  @override
  ConsumerState<LudoWelcomeScreen> createState() => _LudoWelcomeScreenState();
}

class _LudoWelcomeScreenState extends ConsumerState<LudoWelcomeScreen> {
  bool _isErrorVisible = false;
  String _errorMessage = "";

  void _showError(String error) {
    _errorMessage = error;
    setState(() {
      _isErrorVisible = true;
    });
    Future.delayed(const Duration(seconds: 3), _dismissError);
  }

  void _dismissError() {
    if (!_isErrorVisible) return;
    setState(() {
      _errorMessage = "";
      _isErrorVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    final user = ref.read(userProvider);
    if (user == null) {
      return const Center(child: Text("Not Logged In"));
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            double scaledHeight(double height) {
              return (height / 717) * constraints.maxHeight;
            }

            return SafeArea(
              child: Column(
                children: [
                  const BalanceAppBar(),
                  SizedBox(height: scaledHeight(8)),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      height: scaledHeight(290),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/ludo.png'),
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                          fit: BoxFit.cover,
                        ),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'LUDO',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [Shadow(blurRadius: 10.6, color: Color(0xFF00ECFF), offset: Offset(0, 0))],
                            ),
                          ),
                          Text('MENU', style: TextStyle(fontSize: 15, color: Colors.white, letterSpacing: 8)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 69, right: 35, top: scaledHeight(25), bottom: scaledHeight(25)),
                    child: Column(
                      children: [
                        if (user.sessionId != null) ...[
                          SizedBox(
                            height: scaledHeight(64),
                            child: FittedBox(
                              child: _MenuButton(
                                  icon: Icons.play_arrow,
                                  label: 'Resume Game',
                                  onTap: () async {
                                    try {
                                      widget.game.displayLoader();
                                      ref.read(appStateProvider.notifier).selectGameSessionId("ludo", user.sessionId);
                                      var session = ref.read(ludoSessionProvider);
                                      if (session == null) {
                                        await ref.read(ludoSessionProvider.notifier).getLudoSession();
                                        session = ref.read(ludoSessionProvider);
                                      }
                                      if (session == null) return;
                                      if (session.sessionUserStatus.where((e) => e.status == "ACTIVE").length == 4) {
                                        widget.game.playState = PlayState.playing;
                                      } else {
                                        widget.game.playState = PlayState.waiting;
                                      }
                                    } catch (e) {
                                      if (!context.mounted) return;
                                      showErrorDialog(e.toString(), context);
                                    } finally {
                                      widget.game.hideLoader();
                                    }
                                  }),
                            ),
                          ),
                          SizedBox(height: scaledHeight(20)),
                        ],
                        if (user.sessionId != null) ...[
                          SizedBox(
                            height: scaledHeight(64),
                            child: FittedBox(
                              child: _MenuButton(
                                  icon: Icons.exit_to_app,
                                  label: 'Exit Game',
                                  onTap: () async {
                                    try {
                                      // Show confirmation dialog
                                      final bool confirmExit = await showDialog(
                                        useRootNavigator: false,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Exit Game'),
                                            content: const Text('Are you sure you want to exit the current game?'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context).pop(false);
                                                },
                                              ),
                                              TextButton(
                                                child: const Text('Exit'),
                                                onPressed: () {
                                                  Navigator.of(context).pop(true);
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );

                                      // If user doesn't confirm, return early
                                      if (!confirmExit) return;
                                      widget.game.displayLoader();
                                      await ref.read(ludoSessionProvider.notifier).exitSession();
                                      setState(() {});
                                    } catch (e) {
                                      if (!context.mounted) return;
                                      showErrorDialog(e.toString(), context);
                                    } finally {
                                      widget.game.hideLoader();
                                    }
                                  }),
                            ),
                          ),
                          SizedBox(height: scaledHeight(20)),
                        ],
                        if (user.sessionId == null) ...[
                          SizedBox(
                            height: scaledHeight(64),
                            child: FittedBox(
                              child: _MenuButton(icon: Icons.add, label: 'Create Game', onTap: () => _createRoomDialog(ctx: context, game: widget.game)
                                  // onTap: () => widget.game.playState = PlayState.playing,
                                  ),
                            ),
                          ),
                          SizedBox(height: scaledHeight(20)),
                        ],
                        if (user.sessionId == null) ...[
                          SizedBox(
                            height: scaledHeight(64),
                            child: FittedBox(
                              child: _MenuButton(icon: Icons.group, label: 'Find Game', onTap: () => _findRoomDialog(ctx: context, game: widget.game)),
                            ),
                          ),
                          SizedBox(height: scaledHeight(20)),
                        ],
                        if (user.sessionId == null) ...[
                          SizedBox(
                            height: scaledHeight(64),
                            child: FittedBox(
                              child: _MenuButton(icon: Icons.casino, label: 'Join Game', onTap: () => _joinGameDialog(ctx: context, game: widget.game)),
                            ),
                          ),
                          SizedBox(height: scaledHeight(20)),
                        ],
                        SizedBox(
                          height: scaledHeight(64),
                          child: FittedBox(child: _MenuButton(icon: Icons.home, label: 'Back to Home', onTap: Navigator.of(context).pop)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        if (_isErrorVisible)
          Positioned(
            top: 23,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 244),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF4F2934), Color(0xFF843C4C), Color(0xFF0F0E13)]),
                boxShadow: const [BoxShadow(color: Color(0x40000000), blurRadius: 24, offset: Offset(0, 16))],
                border: Border.all(color: const Color(0xFF40474D)),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset("assets/svg/error_icon.svg"),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(_errorMessage, maxLines: 4, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14)),
                    ),
                  ),
                  GestureDetector(onTap: _dismissError, child: const Icon(Icons.close, size: 24, color: Colors.white)),
                ],
              ),
            ),
          ),
        ValueListenableBuilder(
          valueListenable: widget.game.loadingNotifier,
          builder: (context, value, child) {
            return Offstage(
              offstage: !value,
              child: SizedBox(height: widget.game.height, width: widget.game.width, child: ModalBarrier(color: Colors.black.withOpacity(0.6))),
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: widget.game.loadingNotifier,
          builder: (context, value, child) {
            return Offstage(offstage: !value, child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }

  Future<void> _joinGameDialog({required BuildContext ctx, required LudoGameController game}) {
    return showDialog(
      useRootNavigator: false,
      context: ctx,
      builder: (BuildContext context) {
        return _JoinGameDialog(game: widget.game, errorHandler: _showError);
      },
    );
  }

  Future<void> _findRoomDialog({required BuildContext ctx, required LudoGameController game}) {
    return showDialog(
      useRootNavigator: false,
      context: ctx,
      builder: (BuildContext context) {
        return _FindRoomDialog(game: game, errorHandler: _showError);
      },
    );
  }

  void _createRoomDialog({required BuildContext ctx, required LudoGameController game}) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateGameScreen(), settings: RouteSettings(arguments: game)));
  }
}

class _MenuButton extends StatelessWidget {
  final String _label;
  final VoidCallback _onTap;
  final IconData _icon;
  const _MenuButton({required String label, required IconData icon, required VoidCallback onTap})
      : _label = label,
        _onTap = onTap,
        _icon = icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Stack(
        clipBehavior: Clip.none, // Allow children to be drawn outside the stack
        alignment: Alignment.center,
        children: [
          Container(
            width: 268,
            height: 53,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(colors: [Color(0xFF0E272F), Color(0xFF0F1118)], stops: [0.6, 1]),
            ),
            padding: const EdgeInsets.only(left: 55),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_label, style: const TextStyle(color: Colors.white, fontSize: 12)),
                Container(color: const Color(0xFF00ECFF), height: 2, width: 28),
              ],
            ),
          ),
          Positioned(
            left: -38,
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF00ECff), width: 3),
                shape: BoxShape.circle,
                color: const Color(0xFF0E272F),
              ),
              child: Icon(_icon, color: Colors.white, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}

class _FindRoomDialog extends ConsumerStatefulWidget {
  const _FindRoomDialog({required this.game, this.roomId, required this.errorHandler, bool fromJoinGame = false}) : _fromJoinGame = fromJoinGame;

  final LudoGameController game;
  final String? roomId;
  final bool _fromJoinGame;
  final void Function(String) errorHandler;

  @override
  ConsumerState<_FindRoomDialog> createState() => _FindRoomDialogState();
}

class _FindRoomDialogState extends ConsumerState<_FindRoomDialog> {
  final _roomIdController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _roomIdController.text = widget.roomId ?? "";
  }

  Future<void> searchRoom() async {
    setState(() {
      _isLoading = true;
    });
    try {
      FocusScope.of(context).unfocus();
      final ludoSession = await getLudoSessionFromId(_roomIdController.text);
      if (ludoSession == null) {
        if (!mounted) return;
        showErrorDialog("Room not found", context);
        return;
      }
      if (!mounted) return;
      final res = await showDialog(
          useRootNavigator: false,
          context: context,
          builder: (c) {
            return _FindGameChooseColorDialog(roomId: _roomIdController.text, selectedSession: ludoSession, game: widget.game);
          });
      if (res == true) {
        if (!mounted) return;
        Navigator.of(context).pop(true);
        widget.game.playState = PlayState.waiting;
      }
    } catch (e) {
      if (!mounted) return;
      if (e is HttpException) {
        widget.errorHandler(e.message);
        return;
      }
      widget.errorHandler(e.toString());
      showErrorDialog(e.toString(), context);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(textTheme: GoogleFonts.montserratTextTheme()),
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        backgroundColor: const Color(0xFF21262B),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Find Game',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Room ID",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 41,
                  child: TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                      hintText: "Please enter room ID",
                      hintStyle: const TextStyle(color: Color(0xFF8B8B8B), fontSize: 14, fontWeight: FontWeight.w400),
                      fillColor: const Color(0xFF363D43),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                    controller: _roomIdController,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          if (widget._fromJoinGame) {
                            Navigator.of(context).pop();
                            showDialog(
                                context: context,
                                useRootNavigator: false,
                                builder: (context) => _JoinGameDialog(game: widget.game, errorHandler: widget.errorHandler));

                            return;
                          }
                          Navigator.of(context).pop();
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          foregroundColor: const Color(0xFF00ECFF),
                          side: const BorderSide(color: Color(0xFF00ECFF)),
                        ),
                        child: const Text("Cancel"),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: searchRoom,
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          foregroundColor: Colors.black,
                          backgroundColor: const Color(0xFF00ECFF),
                        ),
                        child: _isLoading ? const CircularProgressIndicator() : const Text("Confirm"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _JoinGameDialog extends ConsumerStatefulWidget {
  const _JoinGameDialog({required this.game, required this.errorHandler});

  final LudoGameController game;
  final void Function(String) errorHandler;

  @override
  ConsumerState<_JoinGameDialog> createState() => _JoinGameDialogState();
}

class _JoinGameDialogState extends ConsumerState<_JoinGameDialog> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(textTheme: GoogleFonts.montserratTextTheme()),
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: const Color(0xFF21262B),
        clipBehavior: Clip.antiAlias,
        child: FutureBuilder<List<LudoSessionData>>(future: () async {
          final rooms = await ref.read(ludoSessionProvider.notifier).getOpenSessions();
          return rooms;
        }(), builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              width: 100,
              height: 100,
              child: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.80,
            height: MediaQuery.of(context).size.height * 0.70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: const EdgeInsets.all(0),
                      onPressed: Navigator.of(context).pop,
                      icon: const Icon(Icons.cancel_outlined, color: Colors.white, size: 22),
                    ),
                  ),
                  const Text('Join Game', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          ...snapshot.data!.map(
                            (sessionData) =>
                                _OpenSessionRoomCard(game: widget.game, sessionData: sessionData, context: context, errorHandler: widget.errorHandler),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _OpenSessionRoomCard extends StatelessWidget {
  const _OpenSessionRoomCard({required this.game, required this.sessionData, required this.context, required this.errorHandler});

  final LudoGameController game;
  final LudoSessionData sessionData;
  final BuildContext context;
  final void Function(String) errorHandler;

  @override
  Widget build(BuildContext context) {
    final colors = sessionData.getListOfColors;
    final roomName = sessionData.id;
    final noOfPlayers = sessionData.sessionUserStatus.map((e) => e.status == "ACTIVE" ? 1 : 0).reduce((value, element) => value + element);
    final roomColor = sessionData.playAmount == '0'
        ? const Color(0xFF00ECFF)
        : sessionData.playToken == "0x04718f5a0fc34cc1af16a1cdee98ffb20c31f5cd61d6ab07201858f4287c938d"
            ? const Color(0xFF0077FF)
            : sessionData.playToken == "0x049d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7"
                ? const Color(0xFF7531F4)
                : const Color.fromARGB(255, 144, 50, 50);

    return Theme(
      data: Theme.of(context).copyWith(textTheme: GoogleFonts.orbitronTextTheme()),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(color: const Color(0x94181B25), border: Border.all(color: const Color(0xFF2E2E2E)), borderRadius: BorderRadius.circular(4)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("ROOM $roomName", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white)),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Consumer(
                        builder: (context, ref, child) {
                          return FutureBuilder(
                            future: ref.read(userProvider.notifier).getSupportedTokens(),
                            builder: (context, snapshot) {
                              final supportedTokens = <String, String>{};
                              if (snapshot.hasData) {
                                for (var item in snapshot.data!) {
                                  supportedTokens.addAll({item["tokenAddress"]!: item["tokenName"]!});
                                }
                              }
                              final roomStake = sessionData.playAmount == '0'
                                  ? "Free"
                                  : "${(double.parse(sessionData.playAmount) / 1e18).toStringAsFixed(5)} ${supportedTokens[sessionData.playToken]}";
                              return Container(
                                decoration: BoxDecoration(border: Border.all(color: roomColor), borderRadius: BorderRadius.circular(30)),
                                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                child: Text(roomStake, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white)),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Text("$noOfPlayers/4 Players", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF979797))),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //four avatar
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < noOfPlayers; i++) _PlayerAvatarCard(index: i, size: 37, color: colors[i]),
                    for (int i = 0; i < 4 - noOfPlayers; i++) const _PlayerEmptyCard(size: 37),
                  ],
                ),
                //join button
                noOfPlayers == 4
                    ? const SizedBox(
                        child: Text("FULL"),
                      )
                    : TextButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            useRootNavigator: false,
                            builder: (BuildContext context) {
                              return _FindRoomDialog(game: game, roomId: roomName, errorHandler: errorHandler, fromJoinGame: true);
                            },
                          );
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Container(
                          decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 236, 255), borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                          child: const Text(
                            "JOIN",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black, // Text color
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PlayerEmptyCard extends StatelessWidget {
  const _PlayerEmptyCard({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: size, // Width of the displayed sprite
        height: size, // Height of the displayed sprite
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 8),
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
        ),
        child: Center(child: SvgPicture.asset("assets/svg/empty_player_avatar.svg")),
      ),
    );
  }
}

class _PlayerAvatarCard extends StatelessWidget {
  const _PlayerAvatarCard({required this.index, required this.size, required this.color});

  final int index;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color, // Background color
          borderRadius: BorderRadius.circular(size / 8), // Rounded corners with radius 24
        ),
        child: FittedBox(
          fit: BoxFit.fill,
          child: ClipRect(
            child: Align(
              alignment: index == 1
                  ? Alignment.topLeft
                  : index == 2
                      ? Alignment.topRight
                      : index == 3
                          ? Alignment.bottomLeft
                          : Alignment.bottomRight,
              // widthFactor: 2160 / 4324,
              // heightFactor: 2160 / 4324,
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: Image.asset(
                'assets/images/avatar_spritesheet.png', // Path to your spritesheet
                width: 4324, // Full width of the sprite sheet
                height: 4324, // Full height of the sprite sheet
                fit: BoxFit.none, // Ensure no scaling occurs
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ColorChoosingCard extends StatefulWidget {
  const _ColorChoosingCard({required void Function(String) onColorPicked, List<String> takenColors = const []})
      : _onColorPicked = onColorPicked,
        _takenColors = takenColors;
  final void Function(String) _onColorPicked;
  final List<String> _takenColors;

  @override
  State<_ColorChoosingCard> createState() => _ColorChoosingCardState();
}

class _ColorChoosingCardState extends State<_ColorChoosingCard> {
  final colors = ["red", "blue", "green", "yellow"];
  late final List<String> _takenColors;
  int _pickedColorIndex = 0;

  @override
  void initState() {
    _takenColors = widget._takenColors;
    if (kDebugMode) print("Taken Colors: $_takenColors");
    _pickedColorIndex = colors.indexWhere((color) => !_takenColors.contains(color));
    Future.delayed(Duration.zero, () => widget._onColorPicked(colors[_pickedColorIndex]));
    super.initState();
  }

  String _getColorBackground(int index) {
    switch (index) {
      case 0:
        return "red_bg";
      case 1:
        return "blue_bg";

      case 2:
        return "green_bg";
      case 3:
        return "yellow_bg";
      default:
        return "blue_bg";
    }
  }

  String _getColorChess(int index) {
    switch (index) {
      case 0:
        return "red_chess";

      case 1:
        return "blue_chess";

      case 2:
        return "green_chess";
      case 3:
        return "yellow_chess";
      default:
        return "blue_chess";
    }
  }

  Widget _buildCornerBorder({double? top, double? left, double? right, double? bottom}) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          border: Border(
            top: top != null ? const BorderSide(width: 2, color: Colors.white) : BorderSide.none,
            left: left != null ? const BorderSide(width: 2, color: Colors.white) : BorderSide.none,
            right: right != null ? const BorderSide(width: 2, color: Colors.white) : BorderSide.none,
            bottom: bottom != null ? const BorderSide(width: 2, color: Colors.white) : BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...colors.map(
          (color) => GestureDetector(
            onTap: () {
              if (_takenColors.contains(color)) {
                return;
              }
              setState(() {
                _pickedColorIndex = colors.indexOf(color);
                widget._onColorPicked(color);
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Opacity(
                opacity: _pickedColorIndex == colors.indexOf(color) ? 1 : 0.6,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 52,
                      height: 52,
                      child: SvgPicture.asset(
                        "assets/svg/chess-and-bg/${_getColorBackground(colors.indexOf(color))}.svg",
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        "assets/svg/chess-and-bg/${_getColorChess(colors.indexOf(color))}.svg",
                      ),
                    ),
                    if (_pickedColorIndex == colors.indexOf(color)) _buildCornerBorder(top: 0, left: 0),
                    if (_pickedColorIndex == colors.indexOf(color)) _buildCornerBorder(top: 0, right: 0),
                    if (_pickedColorIndex == colors.indexOf(color)) _buildCornerBorder(bottom: 0, left: 0),
                    if (_pickedColorIndex == colors.indexOf(color)) _buildCornerBorder(bottom: 0, right: 0),
                    if (_takenColors.contains(color))
                      SizedBox(
                        width: 52,
                        height: 52,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(200),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FindGameChooseColorDialog extends ConsumerStatefulWidget {
  const _FindGameChooseColorDialog({required this.roomId, required this.selectedSession, required this.game});
  final String roomId;
  final LudoSessionData selectedSession;
  final LudoGameController game;

  @override
  ConsumerState<_FindGameChooseColorDialog> createState() => _FindGameChooseColorDialogState();
}

class _FindGameChooseColorDialogState extends ConsumerState<_FindGameChooseColorDialog> {
  String _selectedColor = "";
  bool isLoading = false;
  // BigInt? _tokenBalance;
  // final BigInt _sliderValue = BigInt.from(0);
  // List<Map<String, String>>? _supportedTokens;

  late final colors = widget.selectedSession.getListOfColors;
  late final roomName = widget.selectedSession.id;
  late final noOfPlayers = widget.selectedSession.sessionUserStatus.map((e) => e.status == "ACTIVE" ? 1 : 0).reduce((value, element) => value + element);
  late final roomColor = widget.selectedSession.playAmount == '0'
      ? const Color(0xFF00ECFF)
      : widget.selectedSession.playToken == "0x04718f5a0fc34cc1af16a1cdee98ffb20c31f5cd61d6ab07201858f4287c938d"
          ? const Color(0xFF0077FF)
          : widget.selectedSession.playToken == "0x049d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7"
              ? const Color(0xFF7531F4)
              : const Color(0xFF404040);

  void _selectColor(String color) {
    setState(() {
      _selectedColor = color;
    });
  }

  Future<void> joinGame() async {
    try {
      setState(() {
        isLoading = true;
      });
      if (_selectedColor == "") {
        showErrorDialog("Please select a color", context);
        return;
      }
      final color = _selectedColor.split("/").last.split(".").first.split("_").first;
      await ref.read(ludoSessionProvider.notifier).joinSession(widget.roomId, color);
      if (mounted) Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;
      showErrorDialog(e.toString(), context);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: const Color(0xFF21262B),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(onPressed: Navigator.of(context).pop, icon: const Icon(Icons.cancel_outlined, color: Colors.white)),
            ),
            const Text('Room Found!', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0x94181B25),
                border: Border.all(color: const Color(0xFF2E2E2E)),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("ROOM $roomName", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white)),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(border: Border.all(color: roomColor), borderRadius: BorderRadius.circular(30)),
                                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                child: FutureBuilder(
                                    future: ref.read(userProvider.notifier).getSupportedTokens(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return Text("");
                                      } else {
                                        final roomStake = widget.selectedSession.playAmount == '0'
                                            ? "Free"
                                            : "${(((double.tryParse(widget.selectedSession.playAmount)) ?? 0) / 1e18).toStringAsFixed(7)}"
                                                "${snapshot.data!.firstWhere((e) => e["tokenAddress"] == widget.selectedSession.playToken)["tokenName"]}";
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
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text("$noOfPlayers/4 Players", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF979797))),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < noOfPlayers; i++) _PlayerAvatarCard(index: i, size: 55, color: colors[i]),
                      if (!widget.selectedSession.notAvailableColors.contains('green')) ...[
                        SizedBox.square(
                          dimension: 55,
                          child: PinColorOption(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF005C30), Color(0x730C3823), Color(0xFF005C30)],
                            ),
                            svgPath: 'assets/svg/chess-and-bg/green_chess.svg',
                            selectedPinColor: _selectedColor,
                            onTap: _selectColor,
                          ),
                        ),
                        horizontalSpace(8),
                      ],
                      if (!widget.selectedSession.notAvailableColors.contains('blue')) ...[
                        SizedBox.square(
                          dimension: 55,
                          child: PinColorOption(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xC700CEDB), Color(0x73145559), Color(0x9E00CEDB)],
                            ),
                            svgPath: 'assets/svg/chess-and-bg/blue_chess.svg',
                            selectedPinColor: _selectedColor,
                            onTap: _selectColor,
                          ),
                        ),
                        horizontalSpace(8),
                      ],
                      if (!widget.selectedSession.notAvailableColors.contains('red')) ...[
                        SizedBox.square(
                          dimension: 55,
                          child: PinColorOption(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xC7DB0000), Color(0x73591414), Color(0x9EDB0000)],
                            ),
                            svgPath: 'assets/svg/chess-and-bg/red_chess.svg',
                            selectedPinColor: _selectedColor,
                            onTap: _selectColor,
                          ),
                        ),
                        horizontalSpace(8),
                      ],
                      if (!widget.selectedSession.notAvailableColors.contains('yellow')) ...[
                        SizedBox.square(
                          dimension: 55,
                          child: PinColorOption(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xC7DBD200), Color(0x73595214), Color(0x9EDBD200)],
                            ),
                            svgPath: 'assets/svg/chess-and-bg/yellow_chess.svg',
                            selectedPinColor: _selectedColor,
                            onTap: _selectColor,
                          ),
                        ),
                        horizontalSpace(8),
                      ],
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: Navigator.of(context).pop,
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          foregroundColor: const Color(0xFF00ECFF),
                          side: const BorderSide(color: Color(0xFF00ECFF))),
                      child: const Text("Back"),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: noOfPlayers == 4 ? null : joinGame,
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        foregroundColor: Colors.black,
                        backgroundColor: const Color(0xFF00ECFF),
                        disabledBackgroundColor: const Color(0xFF00ECFF).withOpacity(0.5),
                      ),
                      child: isLoading ? const CircularProgressIndicator() : const Text("Join"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
