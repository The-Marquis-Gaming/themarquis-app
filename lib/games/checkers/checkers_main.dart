import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquis_v2/games/checkers/views/dialogs/game_outcome_dialog.dart';
import 'package:marquis_v2/games/checkers/views/screens/create_game/create_game_waiting_room.dart';
import 'package:marquis_v2/games/checkers/views/screens/game/checkers_game_screen.dart';
import 'package:marquis_v2/games/checkers/views/screens/home_screen/checkers_home_screen.dart';
import 'package:marquis_v2/games/checkers/views/screens/match_result/match_result_screen.dart';
import 'package:marquis_v2/models/enums.dart';
import 'package:marquis_v2/router/route_path.dart';

import 'core/game/checkers_game_controller.dart';
import 'core/utils/constants.dart';

class CheckersGameAppPath extends AppRoutePath {
  final String? id;
  const CheckersGameAppPath(this.id);
  @override
  String getRouteInformation() {
    return id == null ? '/game/checkers' : '/game/checkers/$id';
  }
}

class CheckersGameApp extends ConsumerStatefulWidget {
  const CheckersGameApp({super.key});

  @override
  ConsumerState<CheckersGameApp> createState() => _CheckersGameAppState();
}

class _CheckersGameAppState extends ConsumerState<CheckersGameApp> {
  final _game = CheckersGameController();
  final _gameWidgetKey = GlobalKey<RiverpodAwareGameWidgetState<CheckersGameController>>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff0f1118), Color(0xff1f2228)],
          ),
        ),
        child: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: _game.playStateNotifier,
            builder: (context, playState, child) {
              if (playState == PlayState.playing) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/game bg.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              useRootNavigator: false,
                              builder: (BuildContext context) {
                                return CheckersGameOutcomeDialog(_game, didUserWin: false);
                              },
                            );
                          },
                          child: Image.asset('assets/images/Group 1171276336.png', fit: BoxFit.cover, height: 60, width: 60),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 80.0, right: 80),
                            child: AspectRatio(
                              aspectRatio: 7 / 20,
                              child: FittedBox(
                                fit: BoxFit.fitHeight,
                                child: SizedBox(
                                  width: kCheckersGameWidth,
                                  height: kCheckersGameHeight,
                                  child: _buildRiverpodGameWidget(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return _buildRiverpodGameWidget();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRiverpodGameWidget() {
    return RiverpodAwareGameWidget<CheckersGameController>(
      key: _gameWidgetKey,
      game: _game,
      overlayBuilderMap: {
        PlayState.welcome.name: (context, game) => CheckersHomeScreen(game),
        PlayState.waiting.name: (context, game) => CheckersWaitingRoom(game, gameMode: GameMode.free),
        PlayState.playing.name: (context, game) => CheckersGameScreen(game),
        PlayState.finished.name: (context, game) => CheckersMatchResultScreen(game),
      },
    );
  }
}
