import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquis_v2/games/ludo/components/game_top_bar.dart';
import 'package:marquis_v2/games/ludo/config.dart';
import 'package:marquis_v2/games/ludo/ludo_game.dart';
import 'package:marquis_v2/games/ludo/ludo_session.dart';
import 'package:marquis_v2/games/ludo/screens/game_over_screen.dart';
import 'package:marquis_v2/games/ludo/screens/waiting_room/four_player_waiting_room_screen.dart';
import 'package:marquis_v2/games/ludo/screens/welcome_screen.dart';
import 'package:marquis_v2/router/route_path.dart';

void main() {
  runApp(const LudoGameApp());
}

class LudoGameAppPath extends AppRoutePath {
  final String? id;
  const LudoGameAppPath(this.id);
  @override
  String getRouteInformation() {
    return id == null ? '/game/ludo' : '/game/ludo/$id';
  }
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
    return Scaffold(
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
          child: _buildGameWidget(),
        ),
      ),
    );
  }

  Widget _buildGameWidget() {
    return ValueListenableBuilder<PlayState>(
      valueListenable: _game.playStateNotifier,
      builder: (context, playState, child) {
        if (playState == PlayState.playing) {
          return Column(
            children: [
              GameTopBar(
                game: _game,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 80.0, right: 80),
                  child: AspectRatio(
                    aspectRatio: 7 / 20,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: SizedBox(
                        width: gameWidth,
                        height: gameHeight,
                        child: _buildRiverpodGameWidget(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        if (playState == PlayState.finished) {
          return Padding(
            padding: const EdgeInsets.only(left: 80.0, right: 80),
            child: AspectRatio(
              aspectRatio: 7 / 20,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: SizedBox(
                  width: gameWidth,
                  height: gameHeight,
                  child: _buildRiverpodGameWidget(),
                ),
              ),
            ),
          );
        }
        return _buildRiverpodGameWidget();
      },
    );
  }

  Widget _buildRiverpodGameWidget() {
    return RiverpodAwareGameWidget<LudoGame>(
      key: _gameWidgetKey,
      game: _game,
      overlayBuilderMap: {
        PlayState.welcome.name: (context, game) =>
            LudoWelcomeScreen(game: game),
        PlayState.waiting.name: (context, game) =>
            FourPlayerWaitingRoomScreen(game: game),
        PlayState.finished.name: (context, game) => MatchResultsScreen(
              game: game,
              session: ref.read(ludoSessionProvider)!,
            ),
      },
    );
  }
}
