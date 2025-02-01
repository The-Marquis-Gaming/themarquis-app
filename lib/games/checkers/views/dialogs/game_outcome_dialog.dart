import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marquis_v2/games/checkers/core/game/checkers_game_controller.dart';
import 'package:marquis_v2/models/enums.dart';
import 'package:marquis_v2/widgets/ui_widgets.dart';

class CheckersGameOutcomeDialog extends StatefulWidget {
  final CheckersGameController _game;
  const CheckersGameOutcomeDialog(this._game,
      {super.key, required this.didUserWin});

  final bool didUserWin;

  @override
  State<CheckersGameOutcomeDialog> createState() =>
      _CheckersGameOutcomeDialogState();
}

class _CheckersGameOutcomeDialogState extends State<CheckersGameOutcomeDialog> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () => Navigator.of(context).pop,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
      Dialog(
        backgroundColor: const Color(0xFF1E1E1E),
        insetPadding: EdgeInsets.symmetric(horizontal: 64),
        child: Stack(children: [
          Container(
            height: widget.didUserWin ? 255 : 270,
            width: widget._game.isTablet ? 350 : double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(21.0),
                    bottomRight: Radius.circular(21.0)),
                border: Border(
                    bottom: BorderSide(width: 5, color: Color(0xFF4F5E7C)))),
            padding: const EdgeInsets.all(16),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -90,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    widget.didUserWin
                        ? 'assets/svg/win_header.svg'
                        : 'assets/svg/lose_header.svg',
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  child: widget.didUserWin
                      ? RewardDetailsWidget(widget._game)
                      : WinnerDetailsWidget(widget._game),
                ),
              ],
            ),
          ),
        ]),
      ),
    ]);
  }
}

class RewardDetailsWidget extends StatelessWidget {
  final CheckersGameController _game;
  const RewardDetailsWidget(this._game, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.shortestSide >= 600;
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: isTablet ? 100 : 70.0),
                  child: Text(
                    'REWARD',
                    style: TextStyle(
                        fontFamily: "Orbitron",
                        color: Color(0xFFF3B46E),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                verticalSpace(10),
                Padding(
                  padding: EdgeInsets.only(left: isTablet ? 100 : 70.0),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/svg/STRK_logo.svg", width: 19),
                      horizontalSpace(4),
                      Text(
                        '400',
                        style: TextStyle(
                            fontFamily: "Orbitron",
                            color: Color(0xFFFFE500),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                verticalSpace(10),
                Padding(
                  padding: EdgeInsets.only(left: isTablet ? 100 : 70.0),
                  child: Row(
                    children: [
                      Image.asset('assets/images/member.png'),
                      horizontalSpace(4),
                      Text(
                        '400 EXP',
                        style: TextStyle(
                            fontFamily: "Orbitron",
                            color: Color(0xFF00ECFF),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                verticalSpace(30),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    await _game.updatePlayState(PlayState.finished);
                  },
                  child: Container(
                    height: 43,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3B46E),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Ok',
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WinnerDetailsWidget extends StatelessWidget {
  final CheckersGameController _game;
  const WinnerDetailsWidget(this._game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Winner',
          style: TextStyle(
              fontFamily: "Orbitron",
              color: Color(0xFFF3B46E),
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        verticalSpace(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xFFF3B46E)),
                  child: Center(
                      child: Image.asset('assets/images/jason.png',
                          width: 91, height: 91)),
                ),
                verticalSpace(4.0),
                SizedBox(
                  width: 61,
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    'WINNER',
                    style: TextStyle(
                        fontFamily: "Orbitron",
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            horizontalSpace(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svg/STRK_logo.svg", width: 19),
                    horizontalSpace(4),
                    Text(
                      '400',
                      style: TextStyle(
                          fontFamily: "Orbitron",
                          color: Color(0xFFFFE500),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                verticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/member.png'),
                    horizontalSpace(4),
                    Text(
                      '400 EXP',
                      style: TextStyle(
                          fontFamily: "Orbitron",
                          color: Color(0xFF00ECFF),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        verticalSpace(10),
        GestureDetector(
          onTap: () async {
            Navigator.pop(context);
            await _game.updatePlayState(PlayState.finished);
          },
          child: Container(
            height: 43,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xFFF3B46E),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                'Ok',
                style: TextStyle(
                    fontFamily: "Montserrat",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
