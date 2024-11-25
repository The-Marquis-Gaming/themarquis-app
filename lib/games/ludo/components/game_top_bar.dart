import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquis_v2/games/ludo/ludo_game.dart';
import 'package:marquis_v2/providers/user.dart';

class GameTopBar extends StatelessWidget {
  final LudoGame game;

  const GameTopBar({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(48, 239, 253, 0.25),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          GestureDetector(
            onTap: () {
              if (game.playState == PlayState.welcome || 
                  game.playState == PlayState.waiting) {
                Navigator.of(context).pushReplacementNamed('/');
              } else {
                game.playState = PlayState.welcome;
              }
            },
            child: SvgPicture.asset('assets/images/Group 1171276336.svg')),
          // Back Button
         
          // STRK Balance
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
                    future: ref.read(userProvider.notifier).getTokenBalance(
                        "0x04718f5a0fc34cc1af16a1cdee98ffb20c31f5cd61d6ab07201858f4287c938d"),
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
                        ((snapshot.data! / BigInt.from(1e18))
                            .toStringAsFixed(8)
                            .replaceAll(RegExp(r'0+$'), '')
                            .replaceAll(RegExp(r'\.$'), '')),
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