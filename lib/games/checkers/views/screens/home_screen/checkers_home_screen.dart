import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquis_v2/games/checkers/views/screens/create_game/checkers_create_game.dart';
import 'package:marquis_v2/games/checkers/views/screens/find_game/find_game_dialogue.dart';
import 'package:marquis_v2/games/checkers/views/screens/join_game/join_game_dialogue.dart';
import 'package:marquis_v2/games/checkers/views/widgets/checkers_menu_button_widget.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:marquis_v2/widgets/balance_appbar.dart';

class CheckersHomeScreen extends ConsumerStatefulWidget {
  const CheckersHomeScreen({super.key});

  @override
  ConsumerState<CheckersHomeScreen> createState() => CheckersHomeScreenState();
}

class CheckersHomeScreenState extends ConsumerState<CheckersHomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    final user = ref.read(userProvider);
    if (user == null) {
      return const Center(child: Text("Not Logged In"));
    }
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: SizedBox(),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            double scaledHeight(double height) {
              return (height / 717) * constraints.maxHeight;
            }

            return Column(
              children: [
                _topBar(context, scaledHeight),
                _checkerNavigationItems(scaledHeight, context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _checkerNavigationItems(
      double Function(double height) scaledHeight, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 69,
        right: 35,
        top: scaledHeight(15),
      
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: scaledHeight(64),
            child: FittedBox(
              child: CheckersMenuButtonWidget(
                icon: 'assets/svg/addIcon.svg',
                label: 'Create Game',
                onTap: () {
                  _createRoomDialog(ctx: context);
                },
              ),
            ),
          ),
          SizedBox(
            height: scaledHeight(20),
          ),
          SizedBox(
            height: scaledHeight(64),
            child: FittedBox(
              child: CheckersMenuButtonWidget(
                icon: 'assets/svg/threeFriend.svg',
                label: 'Find Game',
                onTap: () {
                  _findGameDialog(ctx: context);
                },
              ),
            ),
          ),
          SizedBox(
            height: scaledHeight(20),
          ),
          SizedBox(
            height: scaledHeight(64),
            child: FittedBox(
              child: CheckersMenuButtonWidget(
                icon: 'assets/svg/megCoin.svg',
                label: 'Join Game',
                onTap: () {
                  _joinGameDialog(ctx: context);
                },
              ),
            ),
          ),
          SizedBox(
            height: scaledHeight(20),
          ),
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

  void _createRoomDialog({required BuildContext ctx}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CheckersCreateGame(),
      ),
    );
  }
}

Future<void> _joinGameDialog({required BuildContext ctx}) {
  return showDialog(
    context: ctx,
    builder: (BuildContext context) {
      return CheckersJoinGameDialog();
    },
  );
}

Future<void> _findGameDialog({required BuildContext ctx}) {
  return showDialog(
    context: ctx,
    builder: (BuildContext context) {
      return CheckersFindRoomDialog();
    },
  );
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
