import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquis_v2/games/ludo/config.dart';
import 'package:marquis_v2/games/ludo/ludo_game.dart';
import 'package:marquis_v2/games/ludo/ludo_session.dart';
import 'package:marquis_v2/games/ludo/screens/game_over_screen.dart';
import 'package:marquis_v2/games/ludo/screens/welcome_screen.dart';
import 'package:marquis_v2/games/ludo/screens/waiting_room_screen.dart';

void main() {
  runApp(const LudoGameApp());
}

class LudoGameApp extends ConsumerStatefulWidget {
  // Modify this line
  const LudoGameApp({super.key});

  @override // Add from here...
  ConsumerState<LudoGameApp> createState() => _LudoGameAppState();
}

class _LudoGameAppState extends ConsumerState<LudoGameApp> {
  final LudoGame _game = LudoGame();
  final GlobalKey<RiverpodAwareGameWidgetState<LudoGame>> _gameWidgetKey =
      GlobalKey<RiverpodAwareGameWidgetState<LudoGame>>();

  @override
  Widget build(BuildContext context) {
    // ref.watch(ludoSessionProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ludo"),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff0f1118),
              Color(0xff1f2228),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                // Modify from here...
                children: [
                  // ScoreCard(score: game.score),
                  Expanded(
                    child: FittedBox(
                      child: SizedBox(
                        width: gameWidth,
                        height: gameHeight,
                        child: RiverpodAwareGameWidget<LudoGame>(
                          key: _gameWidgetKey,
                          game: _game,
                          overlayBuilderMap: {
                            PlayState.welcome.name: (context, game) =>
                                LudoWelcomeScreen(game: game),
                            // const OverlayScreen(
                            //   title: 'Welcome',
                            //   subtitle: 'Please join a session',
                            // ),
                            PlayState.waiting.name: (context, game) =>
                                WaitingRoomScreen(
                                  game: game,
                                ),
                            PlayState.finished.name: (context, game) =>
                                MatchResultsScreen(game: game),
                            'error': (context, game) => Container()
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ), // To here.
            ),
          ),
        ),
      ),
    );
  }
}
