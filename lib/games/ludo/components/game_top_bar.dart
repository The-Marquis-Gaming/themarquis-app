import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquis_v2/models/enums.dart';
import 'package:marquis_v2/models/marquis_game.dart';
import 'package:marquis_v2/providers/user.dart';

class GameTopBar extends StatelessWidget {
  final MarquisGameController game;

  const GameTopBar({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: game.playState == PlayState.finished ? Colors.black.withOpacity(0.3) : Color.fromRGBO(48, 239, 253, 0.25),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.translate(
            offset: Offset(-5, 4),
            child: GestureDetector(
              onTap: () async {
                if (game.playState == PlayState.waiting) {
                  Navigator.of(context).pushReplacementNamed('/');
                } else if (game.playState == PlayState.finished) {
                  await game.updatePlayState(PlayState.welcome);
                } else {
                  showDialog(
                    context: context,
                    useRootNavigator: false,
                    builder: (context) => AlertDialog(
                      title: Text('Leave Game?'),
                      content: Text('Are you sure you want to leave the game?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            game.updatePlayState(PlayState.welcome);
                          },
                          child: Text('Leave'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: SvgPicture.asset('assets/images/Group 1171276336.svg'),
            ),
          ),
          Consumer(
            builder: (context, ref, _) {
              return Row(
                children: [
                  SvgPicture.asset(
                    "assets/svg/STRK_logo.svg",
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  FutureBuilder<BigInt>(
                    future: ref.read(userProvider.notifier).getTokenBalance("0x04718f5a0fc34cc1af16a1cdee98ffb20c31f5cd61d6ab07201858f4287c938d"),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return Container();
                      }
                      return Text(
                        ((snapshot.data! / BigInt.from(1e18)).toStringAsFixed(8).replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '')),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
