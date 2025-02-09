import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquis_v2/games/checkers/checkers_game_controller.dart';
import 'package:marquis_v2/games/checkers/models/checkers_session.dart';
import 'package:marquis_v2/games/checkers/providers/checkers_provider.dart';
import 'package:marquis_v2/games/checkers/views/screens/create_game/checkers_create_game.dart';
import 'package:marquis_v2/games/checkers/views/screens/find_game/find_game_dialogue.dart';
import 'package:marquis_v2/games/checkers/views/screens/join_game/join_game_dialogue.dart';
import 'package:marquis_v2/games/checkers/views/widgets/checkers_menu_button_widget.dart';
import 'package:marquis_v2/games/checkers/views/widgets/chevron_border.dart';
import 'package:marquis_v2/games/checkers/views/widgets/divider_shape.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:marquis_v2/widgets/balance_appbar.dart';
import 'package:marquis_v2/models/enums.dart';
import 'package:marquis_v2/providers/starknet.dart';

class CheckersHomeScreen extends ConsumerStatefulWidget {
  const CheckersHomeScreen({
    super.key,
    required this.gameController,
  });

  final CheckersGameController gameController;

  @override
  ConsumerState<CheckersHomeScreen> createState() => CheckersHomeScreenState();
}

class CheckersHomeScreenState extends ConsumerState<CheckersHomeScreen> {
  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    try {
      final session = ref.read(checkersSessionProvider);
      if (session != null) {
        // Verify if the session is still valid by querying it
        final updatedSession = await ref
            .read(checkersSessionProvider.notifier)
            .findSession(int.parse(session.id));

        if (updatedSession == null) {
          // Session no longer exists, clear it
          await ref.read(checkersSessionProvider.notifier).clearData();
        }
      } else {
        // No session in provider, check if user has an active session
        final sessionId =
            await ref.read(starknetProvider.notifier).getSessionId();
        print("sessionId: $sessionId");
        if (sessionId != null) {
          // Found an active session, try to load it
          final foundSession = await ref
              .read(checkersSessionProvider.notifier)
              .findSession(sessionId.toInt());

          if (foundSession != null) {
            // Valid session found, subscribe to updates
            await ref
                .read(checkersSessionProvider.notifier)
                .subscribeToSession(sessionId.toString());
          }
        }
      }
    } catch (e) {
      // If there's any error, clear the session to be safe
      await ref.read(checkersSessionProvider.notifier).clearData();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    final user = ref.read(userProvider);
    final session = ref.watch(checkersSessionProvider);

    if (user == null) {
      Future.microtask(() {
        if (mounted) {
          Navigator.of(context).pop();
        }
      });
      return const Center(child: Text("Not Logged In"));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        double scaledHeight(double height) {
          return (height / 717) * constraints.maxHeight;
        }

        return Column(
          children: [
            _topBar(context, scaledHeight),
            if (session != null)
              // Show only Resume Game and Back to Home when in a session
              Expanded(
                  child:
                      _sessionNavigationItems(scaledHeight, context, session))
            else
              // Show regular menu items when not in a session
              Expanded(child: _checkerNavigationItems(scaledHeight, context)),
          ],
        );
      },
    );
  }

  Widget _sessionNavigationItems(
    double Function(double height) scaledHeight,
    BuildContext context,
    CheckersSessionData session,
  ) {
    return Container(
      padding: EdgeInsets.only(left: 69, right: 35, top: scaledHeight(15)),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: scaledHeight(64),
            child: FittedBox(
              child: CheckersMenuButtonWidget(
                icon: 'assets/svg/addIcon.svg',
                label: 'Resume Game',
                onTap: () => _resumeGame(context, session),
              ),
            ),
          ),
          SizedBox(height: scaledHeight(20)),
          SizedBox(
            height: scaledHeight(64),
            child: FittedBox(
              child: CheckersMenuButtonWidget(
                icon: 'assets/svg/home.svg',
                label: 'Back to Home',
                onTap: () async {
                  await ref.read(checkersSessionProvider.notifier).clearData();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkerNavigationItems(
      double Function(double height) scaledHeight, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 69, right: 35, top: scaledHeight(15)),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: scaledHeight(64),
            child: FittedBox(
              child: CheckersMenuButtonWidget(
                icon: 'assets/svg/addIcon.svg',
                label: 'Create Game',
                onTap: () => _createRoomDialog(ctx: context),
              ),
            ),
          ),
          SizedBox(height: scaledHeight(20)),
          SizedBox(
            height: scaledHeight(64),
            child: FittedBox(
              child: CheckersMenuButtonWidget(
                icon: 'assets/svg/threeFriend.svg',
                label: 'Find Game',
                onTap: () => _findGameDialog(ctx: context),
              ),
            ),
          ),
          SizedBox(height: scaledHeight(20)),
          SizedBox(
            height: scaledHeight(64),
            child: FittedBox(
              child: CheckersMenuButtonWidget(
                icon: 'assets/svg/megCoin.svg',
                label: 'Join Game',
                onTap: () => _showJoinGameDialog(),
              ),
            ),
          ),
          SizedBox(height: scaledHeight(20)),
          SizedBox(
            height: scaledHeight(64),
            child: FittedBox(
              child: CheckersMenuButtonWidget(
                icon: 'assets/svg/home.svg',
                label: 'Back to Home',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _resumeGame(
      BuildContext context, CheckersSessionData session) async {
    final playersJoined = session.sessionUserStatus
        .where((element) => element.status == 'PLAYING')
        .length;

    if (playersJoined >= 2) {
      // If session is full, go to game
      await widget.gameController.updatePlayState(PlayState.playing);
    } else {
      // If session is not full, go to waiting room
      await widget.gameController.updatePlayState(PlayState.waiting);
    }
  }

  void _showCreateGame(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CheckersCreateGame(widget.gameController),
    );
  }

  void _showJoinGameDialog() {
    showDialog(
      context: context,
      builder: (context) => CheckersJoinGameDialog(
        gameController: widget.gameController,
      ),
    );
  }

  Future<void> _createRoomDialog({required BuildContext ctx}) {
    return showDialog(
      context: ctx,
      builder: (BuildContext context) =>
          CheckersCreateGame(widget.gameController),
    );
  }

  Future<void> _findGameDialog({required BuildContext ctx}) {
    return showDialog(
      context: ctx,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return CheckersFindRoomDialog();
      },
    );
  }
}

Widget _topBar(
  BuildContext ctx,
  double Function(double height) scaledHeight,
) {
  return Column(
    children: [
      const BalanceAppBar(),
      Container(
        width: double.infinity,
        height: scaledHeight(260),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/checkersHome.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );
}
