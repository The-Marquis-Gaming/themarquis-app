import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquis_v2/games/checkers/core/game/checkers_game_controller.dart';
import 'package:marquis_v2/games/checkers/core/utils/constants.dart';

class CheckersGameScreen extends ConsumerStatefulWidget {
  final CheckersGameController _game;
  const CheckersGameScreen(this._game, {super.key});

  @override
  ConsumerState<CheckersGameScreen> createState() => _CheckersGameScreenState();
}

class _CheckersGameScreenState extends ConsumerState<CheckersGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget._game.isTablet ? 80.0 : 20.0),
      child: AspectRatio(
        aspectRatio: widget._game.isTablet ? 0.75 : (kCheckersGameWidth / kCheckersGameHeight),
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(width: kCheckersGameWidth, height: kCheckersGameHeight),
          //  ValueListenableBuilder<PlayState>(
          //   valueListenable: widget._game.playStateNotifier,
          //   builder: (context, playState, _) {
          //     return RiverpodAwareGameWidget<CheckersGameController>(
          //       key: _gameWidgetKey,
          //       game: widget._game,
          //       overlayBuilderMap: {
          //         'gameUI': (context, game) => SafeArea(
          //               child: Transform.translate(
          //                 offset: Offset(widget._game.isTablet ? -40 : 0, widget._game.isTablet ? topBarOffset * 0.1 : topBarOffset),
          //                 child: Padding(
          //                   padding: EdgeInsets.all(widget._game.isTablet ? uiPadding * 1.2 : uiPadding * 0.3),
          //                   child: GestureDetector(
          //                     onTap: () => showDialog(
          //                       context: context,
          //                       useRootNavigator: false,
          //                       builder: (BuildContext context) {
          //                         return CheckersGameOutcomeDialog(widget._game, didUserWin: false);
          //                       },
          //                     ),
          //                     child: SizedBox(
          //                       width: widget._game.isTablet ? 60 : 60,
          //                       height: widget._game.isTablet ? 60 : 60,
          //                       child: Image.asset('assets/images/Group 1171276336.png', fit: BoxFit.cover),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //       },
          //       initialActiveOverlays: const ['gameUI'],
          //     );
          //   },
          // ),
          // ),
        ),
      ),
    );
  }
}
