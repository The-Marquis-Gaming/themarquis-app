import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquis_v2/games/ludo/ludo_game.dart';
import 'package:marquis_v2/games/ludo/ludo_session.dart';
import 'package:marquis_v2/games/ludo/models/ludo_session.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:marquis_v2/widgets/error_dialog.dart';

class LudoWelcomeScreen extends ConsumerStatefulWidget {
  const LudoWelcomeScreen({super.key, required this.game});
  final LudoGame game;

  @override
  ConsumerState<LudoWelcomeScreen> createState() => _LudoWelcomeScreenState();
}

class _LudoWelcomeScreenState extends ConsumerState<LudoWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    final deviceSize = MediaQuery.of(context).size;
    final user = ref.read(userProvider);
    // final ludoSession = ref.read(ludoSessionProvider.notifier);
    if (user == null) {
      return const Center(child: Text("Not Logged In"));
    }
    return Scaffold(
      backgroundColor: const Color(0xff0f1118),
      body: Transform.scale(
        scale: widget.game.height / deviceSize.height,
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: deviceSize.height * widget.game.width / widget.game.height,
          height: deviceSize.height,
          child: Center(
            child: Column(
              children: [
                Container(
                  width: deviceSize.height *
                      widget.game.width /
                      widget.game.height,
                  height: deviceSize.height * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/banner.png'),
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5),
                        BlendMode.darken,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 128,
                        ),
                        Text(
                          'LUDO',
                          style: TextStyle(
                            fontSize: 72,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.cyan,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'MENU',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            letterSpacing: 8,
                          ),
                        ),
                        SizedBox(height: 35),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (user.sessionId != null)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: _buildMenuButton(
                              icon: Icons.play_arrow,
                              text: 'Resume Game',
                              onTap: () async {
                                try {
                                  ref
                                      .read(appStateProvider.notifier)
                                      .selectGameSessionId(
                                          "ludo", user.sessionId);
                                  var session = ref.read(ludoSessionProvider);
                                  if (session == null) {
                                    await ref
                                        .read(ludoSessionProvider.notifier)
                                        .getLudoSession();
                                    session = ref.read(ludoSessionProvider);
                                  }
                                  if (session == null) return;
                                  if (session.sessionUserStatus
                                          .where((e) => e.status == "ACTIVE")
                                          .length ==
                                      4) {
                                    widget.game.playState = PlayState.playing;
                                  } else {
                                    widget.game.playState = PlayState.waiting;
                                  }
                                } catch (e) {
                                  if (!context.mounted) return;
                                  showErrorDialog(e.toString(), context);
                                }
                              }),
                        ),
                      if (user.sessionId != null)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: _buildMenuButton(
                              icon: Icons.exit_to_app,
                              text: 'Exit Game',
                              onTap: () async {
                                try {
                                  // Show confirmation dialog
                                  final bool confirmExit = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Exit Game'),
                                        content: const Text(
                                            'Are you sure you want to exit the current game?'),
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
                                  await ref
                                      .read(ludoSessionProvider.notifier)
                                      .exitSession();
                                  setState(() {});
                                } catch (e) {
                                  if (!context.mounted) return;
                                  showErrorDialog(e.toString(), context);
                                }
                              }),
                        ),
                      if (user.sessionId == null)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: _buildMenuButton(
                              icon: Icons.add,
                              text: 'Create Room',
                              onTap: () {
                                createRoomDialog(
                                  ctx: context,
                                  game: widget.game,
                                );
                              }),
                        ),
                      if (user.sessionId == null)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: _buildMenuButton(
                              icon: Icons.group,
                              text: 'Join Room',
                              onTap: () {
                                joinRoomDialog(
                                  ctx: context,
                                  game: widget.game,
                                );
                              }),
                        ),
                      if (user.sessionId == null)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: _buildMenuButton(
                              icon: Icons.casino,
                              text: 'Open Sessions',
                              onTap: () {
                                openSessionDialog(
                                  ctx: context,
                                  game: widget.game,
                                );
                              }),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
      {required IconData icon,
      required String text,
      required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none, // Allow children to be drawn outside the stack
        children: [
          Card(
            child: Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 96), // Space for the overlapping icon
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: -5, // Adjust this value to control how much it extends out
            top: -7, // Adjust this value to center vertically
            child: ClipOval(
              child: Container(
                width: 64,
                height: 64,
                color: Colors.grey.withOpacity(0.3),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future openSessionDialog({
    required BuildContext ctx,
    required LudoGame game,
  }) {
    return showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return OpenSessionDialog(
          game: widget.game,
        );
      },
    );
  }

  Future joinRoomDialog({
    required BuildContext ctx,
    required LudoGame game,
  }) {
    return showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return JoinRoomDialog(
          game: game,
        );
      },
    );
  }

  Future createRoomDialog({
    required BuildContext ctx,
    required LudoGame game,
  }) {
    return showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return CreateRoomDialog(game: game);
      },
    );
  }
}

class JoinRoomDialog extends ConsumerStatefulWidget {
  const JoinRoomDialog({super.key, required this.game, this.roomId});

  final LudoGame game;
  final String? roomId;

  @override
  ConsumerState<JoinRoomDialog> createState() => _JoinRoomDialogState();
}

class _JoinRoomDialogState extends ConsumerState<JoinRoomDialog> {
  final _roomIdController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _roomIdController.text = widget.roomId ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 0, 236, 255), // Cyan border color
            width: 1, // Border thickness
          ),
          borderRadius: BorderRadius.circular(
              12), // Ensure the border follows the shape of the dialog
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.80,
          height: MediaQuery.of(context).size.height * 0.50 < 280
              ? 280
              : MediaQuery.of(context).size.height * 0.50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    const Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          'JOIN ROOM',
                          style: TextStyle(
                            color: Color.fromARGB(
                              255,
                              0,
                              236,
                              255,
                            ), // Cyan border color
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      label: Text("Room ID"),
                      // errorText: _emailError,
                    ),
                    controller: _roomIdController,
                  ),
                ),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () async {
                            //session = room
                            setState(() {
                              _isLoading = true;
                            });
                            try {
                              final ludoSession = await getLudoSessionFromId(
                                  _roomIdController.text);
                              if (ludoSession == null) {
                                if (!context.mounted) return;
                                showErrorDialog("Room not found", context);
                                return;
                              }
                              if (!context.mounted) return;
                              final res = await showDialog(
                                  context: context,
                                  builder: (c) {
                                    return JoinRoomChooseColorDialog(
                                      roomId: _roomIdController.text,
                                      selectedSession: ludoSession,
                                    );
                                  });
                              if (res == true) {
                                if (!context.mounted) return;
                                Navigator.of(context).pop(true);
                                widget.game.playState = PlayState.waiting;
                              }
                            } catch (e) {
                              if (!context.mounted) return;
                              showErrorDialog(e.toString(), context);
                            }
                            setState(() {
                              _isLoading = false;
                            });
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 0, 236, 255),
                                width: 1.2,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 42.0,
                            ),
                            child: const Text(
                              "Confirm",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
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

class OpenSessionDialog extends ConsumerStatefulWidget {
  const OpenSessionDialog({super.key, required this.game});

  final LudoGame game;

  @override
  ConsumerState<OpenSessionDialog> createState() => _OpenSessionDialogState();
}

class _OpenSessionDialogState extends ConsumerState<OpenSessionDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: FutureBuilder<List<LudoSessionData>>(future: () async {
        final rooms =
            await ref.read(ludoSessionProvider.notifier).getOpenSessions();
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
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  const Color.fromARGB(255, 0, 236, 255), // Cyan border color
              width: 1, // Border thickness
            ),
            borderRadius: BorderRadius.circular(
                12), // Ensure the border follows the shape of the dialog
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.80,
            height: MediaQuery.of(context).size.height * 0.70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      const Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            'OPEN SESSION',
                            style: TextStyle(
                              color: Color.fromARGB(
                                255,
                                0,
                                236,
                                255,
                              ),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            visualDensity: VisualDensity.compact,
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.cancel_outlined,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          ...snapshot.data!.map(
                            (sessionData) => openSessionRoomCard(
                              sessionData: sessionData,
                              context: context,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget openSessionRoomCard({
    required LudoSessionData sessionData,
    required BuildContext context,
  }) {
    final colors = sessionData.getListOfColors;
    final roomName = sessionData.id;
    final noOfPlayers = sessionData.sessionUserStatus
        .map((e) => e.status == "ACTIVE" ? 1 : 0)
        .reduce((value, element) => value + element);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ROOM $roomName",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Text(
                "$noOfPlayers/4 Players",
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //four avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < noOfPlayers; i++)
                    playerAvatarCard(
                      index: i,
                      size: 37,
                      color: colors[i],
                    ),
                  for (int i = 0; i < 4 - noOfPlayers; i++)
                    playerEmptyCard(
                      size: 37,
                    ),
                ],
              ),
              //join button
              noOfPlayers == 4
                  ? const SizedBox(
                      child: Text("FULL"),
                    )
                  : TextButton(
                      onPressed: () async {
                        final res = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return JoinRoomDialog(
                              game: widget.game,
                              roomId: roomName,
                            );
                          },
                        );
                        if (res == true) {
                          if (!context.mounted) return;
                          Navigator.of(context).pop();
                        }
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets
                            .zero, // Remove the default padding from TextButton
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 0, 236, 255), // Background color
                          borderRadius:
                              BorderRadius.circular(8), // Rounded edges
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 25.0,
                        ), // Padding inside the button
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
    );
  }

  Widget playerAvatarCard({
    required int index,
    required double size,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
      ),
      child: Container(
        width: size, // Width of the displayed sprite
        height: size, // Height of the displayed sprite
        decoration: BoxDecoration(
          color: color, // Background color
          borderRadius:
              BorderRadius.circular(size / 8), // Rounded corners with radius 24
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

  Widget playerEmptyCard({
    required double size,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
      ),
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
        child: const Center(
          child: Text(
            "?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class CreateRoomDialog extends ConsumerStatefulWidget {
  const CreateRoomDialog({super.key, required this.game});

  final LudoGame game;

  @override
  ConsumerState<CreateRoomDialog> createState() => _CreateRoomDialogState();
}

class _CreateRoomDialogState extends ConsumerState<CreateRoomDialog> {
  BigInt _sliderValue = BigInt.from(0);
  BigInt? _tokenBalance;
  String _selectedTokenAddress = '';
  final _tokenAmountController = TextEditingController();
  List<Map<String, String>>? _supportedTokens;
  String? _selectedColor; // To keep track of the selected color
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: FutureBuilder(
          future: _supportedTokens == null
              ? () async {
                  _supportedTokens = await ref
                      .read(userProvider.notifier)
                      .getSupportedTokens();
                }()
              : null,
          builder: (context, snapshot) {
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
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(
                      255, 0, 236, 255), // Cyan border color
                  width: 1, // Border thickness
                ),
                borderRadius: BorderRadius.circular(
                    12), // Ensure the border follows the shape of the dialog
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                height: MediaQuery.of(context).size.height * 0.50 < 450
                    ? 450
                    : MediaQuery.of(context).size.height * 0.50,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          const Expanded(
                            flex: 3,
                            child: Center(
                              child: Text(
                                'CREATE ROOM',
                                style: TextStyle(
                                  color: Color.fromARGB(
                                    255,
                                    0,
                                    236,
                                    255,
                                  ), // Cyan border color
                                  fontSize: 18,

                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                visualDensity: VisualDensity.compact,
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      const Text(
                        "Please Select Your Color",
                        style: TextStyle(
                          color: Color.fromARGB(
                            255,
                            0,
                            236,
                            255,
                          ), // Cyan border color
                          fontSize: 12, fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      StatefulBuilder(
                        builder: (ctx, stste) {
                          return Column(
                            children: [
                              ColorChoosingCard(
                                onColorPicked: (color) {
                                  setState(() {
                                    _selectedColor = color;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: DropdownButtonFormField<String>(
                                      isExpanded: true,
                                      decoration: const InputDecoration(
                                        labelText: 'Token',
                                      ),
                                      items: [
                                        ...?_supportedTokens,
                                        {
                                          "tokenAddress":
                                              "0x0000000000000000000000000000000000000000000000000000000000000000",
                                          "tokenName": "No Token",
                                        },
                                      ].map((Map<String, String> value) {
                                        return DropdownMenuItem<String>(
                                          value: value['tokenAddress']!,
                                          child: Text(value['tokenName']!),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        stste(() {
                                          _selectedTokenAddress = newValue!;
                                          _tokenBalance = null;
                                        });
                                      },
                                    ),
                                  ),
                                  if (_selectedTokenAddress !=
                                      "0x0000000000000000000000000000000000000000000000000000000000000000")
                                    const SizedBox(width: 16),
                                  if (_selectedTokenAddress !=
                                      "0x0000000000000000000000000000000000000000000000000000000000000000")
                                    Expanded(
                                      flex: 3,
                                      child: TextField(
                                        decoration: const InputDecoration(
                                          labelText: 'Token Amount',
                                        ),
                                        controller: _tokenAmountController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d*$')),
                                          TextInputFormatter.withFunction(
                                              (oldValue, newValue) {
                                            if (newValue.text.isEmpty) {
                                              return newValue;
                                            }
                                            double? value =
                                                double.tryParse(newValue.text);
                                            if (value != null &&
                                                _tokenBalance != null &&
                                                value <=
                                                    _tokenBalance!.toDouble() /
                                                        1e18) {
                                              return newValue;
                                            }
                                            return oldValue;
                                          }),
                                        ],
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            stste(() {
                                              _sliderValue = BigInt.from(
                                                  double.parse(value) * 1e18);
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                ],
                              ),
                              if (_selectedTokenAddress !=
                                      "0x0000000000000000000000000000000000000000000000000000000000000000" &&
                                  _selectedTokenAddress != "")
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FutureBuilder(
                                    future: _tokenBalance != null
                                        ? null
                                        : () async {
                                            if (_selectedTokenAddress ==
                                                "0x0000000000000000000000000000000000000000000000000000000000000000") {
                                              _sliderValue = BigInt.from(0);
                                              _tokenBalance = BigInt.from(0);
                                              return;
                                            }
                                            final res = await ref
                                                .read(userProvider.notifier)
                                                .getTokenBalance(
                                                    _selectedTokenAddress);
                                            _sliderValue = BigInt.from(0);
                                            _tokenBalance = res;
                                          }(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const CircularProgressIndicator();
                                      }
                                      if (snapshot.hasError) {
                                        return Text(snapshot.error.toString());
                                      }
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Select amount:',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Slider(
                                            min: 0.0,
                                            max: _tokenBalance!
                                                .toDouble(), // Convert int to double
                                            divisions: 100,
                                            label: (_sliderValue.toDouble() /
                                                    1e18)
                                                .toStringAsFixed(8)
                                                .replaceAll(RegExp(r'0+$'), '')
                                                .replaceAll(RegExp(r'\.$'), ''),
                                            value: _sliderValue.toDouble(),
                                            onChanged: (double value) {
                                              stste(() {
                                                _sliderValue =
                                                    BigInt.from(value);
                                                _tokenAmountController.text =
                                                    (_sliderValue.toDouble() /
                                                            1e18)
                                                        .toStringAsFixed(8)
                                                        .replaceAll(
                                                            RegExp(r'0+$'), '')
                                                        .replaceAll(
                                                            RegExp(r'\.$'), '');
                                              });
                                            },
                                          ),
                                          Text(
                                            'Max: ${(_tokenBalance!.toDouble() / 1e18).toStringAsFixed(8).replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '')}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      _isLoading
                          ? const CircularProgressIndicator()
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                onPressed: () async {
                                  print(
                                      "${(_sliderValue.toDouble() / 1e18).toStringAsFixed(8).replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '')}   ${_tokenAmountController.text}   $_selectedTokenAddress");
                                  try {
                                    if (_selectedColor == null) {
                                      showErrorDialog(
                                          "Please select a color", context);
                                      return;
                                    }
                                    if (_selectedTokenAddress == "") {
                                      showErrorDialog(
                                          "Please select a token", context);
                                      return;
                                    }
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    await ref
                                        .read(ludoSessionProvider.notifier)
                                        .createSession(
                                          _sliderValue.toString(),
                                          _selectedColor!,
                                          _selectedTokenAddress,
                                        );
                                  } catch (e) {
                                    if (!context.mounted) return;
                                    showErrorDialog(e.toString(), context);
                                  }
                                  setState(() {
                                    _isLoading = false;
                                  });

                                  if (!context.mounted) return;
                                  Navigator.of(context).pop();

                                  widget.game.playState = PlayState.waiting;
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 0, 236, 255),
                                      width: 1.2,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 42.0,
                                  ),
                                  child: const Text(
                                    "Create",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class ColorChoosingCard extends StatefulWidget {
  const ColorChoosingCard(
      {super.key, required this.onColorPicked, this.takenColors = const []});
  final Function(String) onColorPicked;
  final List<String> takenColors;

  @override
  State<ColorChoosingCard> createState() => _ColorChoosingCardState();
}

class _ColorChoosingCardState extends State<ColorChoosingCard> {
  final colors = ["red", "blue", "green", "yellow"];
  late final List<String> _takenColors;
  int _pickedColorIndex = 0;

  @override
  void initState() {
    _takenColors = widget.takenColors;
    print("Taken Colors: $_takenColors");
    _pickedColorIndex =
        colors.indexWhere((color) => !_takenColors.contains(color));
    Future.delayed(
        Duration.zero, () => widget.onColorPicked(colors[_pickedColorIndex]));
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

  Widget _buildCornerBorder(
      {double? top, double? left, double? right, double? bottom}) {
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
            top: top != null
                ? const BorderSide(width: 2, color: Colors.white)
                : BorderSide.none,
            left: left != null
                ? const BorderSide(width: 2, color: Colors.white)
                : BorderSide.none,
            right: right != null
                ? const BorderSide(width: 2, color: Colors.white)
                : BorderSide.none,
            bottom: bottom != null
                ? const BorderSide(width: 2, color: Colors.white)
                : BorderSide.none,
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
                widget.onColorPicked(color);
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
                    if (_pickedColorIndex == colors.indexOf(color))
                      _buildCornerBorder(top: 0, left: 0),
                    if (_pickedColorIndex == colors.indexOf(color))
                      _buildCornerBorder(top: 0, right: 0),
                    if (_pickedColorIndex == colors.indexOf(color))
                      _buildCornerBorder(bottom: 0, left: 0),
                    if (_pickedColorIndex == colors.indexOf(color))
                      _buildCornerBorder(bottom: 0, right: 0),
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

class JoinRoomChooseColorDialog extends ConsumerStatefulWidget {
  const JoinRoomChooseColorDialog(
      {super.key, required this.roomId, required this.selectedSession});
  final String roomId;
  final LudoSessionData selectedSession;

  @override
  ConsumerState<JoinRoomChooseColorDialog> createState() =>
      _JoinRoomChooseColorDialogState();
}

class _JoinRoomChooseColorDialogState
    extends ConsumerState<JoinRoomChooseColorDialog> {
  String _selectedColor = "";
  bool _isLoading = false;
  BigInt? _tokenBalance;
  BigInt _sliderValue = BigInt.from(0);
  List<Map<String, String>>? _supportedTokens;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 0, 236, 255), // Cyan border color
            width: 1, // Border thickness
          ),
          borderRadius: BorderRadius.circular(
              12), // Ensure the border follows the shape of the dialog
        ),
        width: MediaQuery.of(context).size.width * 0.80,
        height: MediaQuery.of(context).size.height * 0.50 < 280
            ? 280
            : MediaQuery.of(context).size.height * 0.50,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      'JOIN ROOM ${widget.roomId}',
                      style: const TextStyle(
                        color: Color.fromARGB(
                          255,
                          0,
                          236,
                          255,
                        ), // Cyan border color
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.cancel_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ColorChoosingCard(
                onColorPicked: (color) {
                  setState(() {
                    _selectedColor = color;
                  });
                },
                takenColors: widget.selectedSession.notAvailableColors,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                  future: _supportedTokens == null
                      ? () async {
                          _supportedTokens = await ref
                              .read(userProvider.notifier)
                              .getSupportedTokens();
                          _supportedTokens!.add({
                            "tokenAddress":
                                "0x0000000000000000000000000000000000000000000000000000000000000000",
                            "tokenName": "No Token",
                          });
                        }()
                      : null,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _supportedTokens?.firstWhere((e) =>
                                      e["tokenAddress"] ==
                                      widget.selectedSession
                                          .playToken)["tokenName"] ??
                                  "",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          if (widget.selectedSession.playToken !=
                              "0x0000000000000000000000000000000000000000000000000000000000000000")
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                (double.parse(
                                            widget.selectedSession.playAmount) /
                                        1e18)
                                    .toStringAsFixed(8)
                                    .replaceAll(RegExp(r'0+$'), '')
                                    .replaceAll(RegExp(r'\.$'), ''),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
            ),
            if (widget.selectedSession.playToken !=
                "0x0000000000000000000000000000000000000000000000000000000000000000")
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: _tokenBalance != null
                      ? null
                      : () async {
                          final res = await ref
                              .read(userProvider.notifier)
                              .getTokenBalance(
                                  widget.selectedSession.playToken);
                          _sliderValue =
                              BigInt.parse(widget.selectedSession.playAmount);
                          _tokenBalance = res;
                        }(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Slider(
                          min: 0.0,
                          max: _tokenBalance!
                              .toDouble(), // Convert int to double
                          divisions: 100,
                          label: (_sliderValue.toDouble() / 1e18)
                              .toStringAsFixed(8)
                              .replaceAll(RegExp(r'0+$'), '')
                              .replaceAll(RegExp(r'\.$'), ''),
                          value: _sliderValue.toDouble(),
                          onChanged: (_) {},
                        ),
                        Text(
                          'Max: ${(_tokenBalance!.toDouble() / 1e18).toStringAsFixed(8).replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '')}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            _isLoading
                ? const CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () async {
                        try {
                          setState(() {
                            _isLoading = true;
                          });
                          if (_selectedColor == "") {
                            showErrorDialog("Please select a color", context);
                            return;
                          }
                          await ref
                              .read(ludoSessionProvider.notifier)
                              .joinSession(
                                widget.roomId,
                                _selectedColor,
                              );
                          if (!context.mounted) return;
                          Navigator.of(context).pop(true);
                        } catch (e) {
                          if (!context.mounted) return;
                          showErrorDialog(e.toString(), context);
                        }
                        setState(() {
                          _isLoading = false;
                        });
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        // Remove the default splash effect
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 0, 236, 255),
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(6),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.pink,
                          //     spreadRadius: -4,
                          //     blurRadius: 10,
                          //   ),
                          // ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 42.0,
                        ),
                        child: const Text(
                          "Join Session",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
