import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquis_v2/games/checkers/checkers_game_controller.dart';
import 'package:marquis_v2/games/checkers/providers/checkers_provider.dart';
import 'package:marquis_v2/games/checkers/utils/constants.dart';
import 'package:marquis_v2/games/checkers/views/dialogs/game_outcome_dialog.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:marquis_v2/models/enums.dart';

class CheckersGameScreen extends ConsumerStatefulWidget {
  final CheckersGameController _game;
  const CheckersGameScreen(this._game, {super.key});

  @override
  ConsumerState<CheckersGameScreen> createState() => _CheckersGameScreenState();
}

class _CheckersGameScreenState extends ConsumerState<CheckersGameScreen> {
  final _gameWidgetKey =
      GlobalKey<RiverpodAwareGameWidgetState<CheckersGameController>>();

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(checkersSessionProvider);

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: widget._game.isTablet ? 80.0 : 20.0),
      child: AspectRatio(
        aspectRatio: widget._game.isTablet
            ? 0.75
            : (kCheckersGameWidth / kCheckersGameHeight),
        child: session == null
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  // Game Board
                  RiverpodAwareGameWidget<CheckersGameController>(
                    key: _gameWidgetKey,
                    game: widget._game,
                    overlayBuilderMap: {
                      'gameUI': (context, game) => _buildGameUI(context, game),
                    },
                    initialActiveOverlays: const ['gameUI'],
                  ),

                  // Turn Indicator
                  Positioned(
                    top: 20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          session.isBlackTurn ? "Black's Turn" : "White's Turn",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Score Display
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildScoreCard("Black", session.blackScore.toInt()),
                        _buildScoreCard("White", session.whiteScore.toInt()),
                      ],
                    ),
                  ),

                  // Loading Indicator
                  if (widget._game.board?.isProcessingMove ?? false)
                    Container(
                      color: Colors.black.withOpacity(0.3),
                      child: const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFFF3B46E)),
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  }

  Widget _buildGameUI(BuildContext context, CheckersGameController game) {
    return SafeArea(
      child: Transform.translate(
        offset: Offset(
          widget._game.isTablet ? -40 : 0,
          widget._game.isTablet ? topBarOffset * 0.1 : topBarOffset,
        ),
        child: Padding(
          padding: EdgeInsets.all(
            widget._game.isTablet ? uiPadding * 1.2 : uiPadding * 0.3,
          ),
          child: GestureDetector(
            onTap: () => widget._game.updatePlayState(PlayState.welcome),
            child: SizedBox(
              width: widget._game.isTablet ? 60 : 60,
              height: widget._game.isTablet ? 60 : 60,
              child: Image.asset(
                'assets/images/Group 1171276336.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreCard(String player, int score) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            player,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            score.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _showGameOutcomeDialog(BuildContext context) {
    final session = ref.read(checkersSessionProvider);
    // Only show dialog if game is over
    if (session != null && session.isGameOver) {
      showDialog(
        context: context,
        useRootNavigator: false,
        builder: (BuildContext context) {
          final isBlackWinner =
              (session.blackScore ?? 0) > (session.whiteScore ?? 0);
          return CheckersGameOutcomeDialog(
            widget._game,
            didUserWin: isBlackWinner,
          );
        },
      );
    }
  }
}
