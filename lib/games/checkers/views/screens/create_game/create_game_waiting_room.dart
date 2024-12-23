import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquis_v2/games/checkers/core/utils/checkers_enum.dart';
import 'package:marquis_v2/games/ludo/components/string_validation.dart';

class CreateGameWaitingRoom extends StatelessWidget {
  final int activeTab;
  final GameMode? gameMode;

  const CreateGameWaitingRoom({super.key, required this.activeTab, required this.gameMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(height: 129),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Room ID', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  SizedBox(height: 6),
                  Container(
                    height: 30,
                    width: 97,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/waitingRoomID.png')),
                    ),
                    child: Center(
                      child: const Text('A028', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),
            if (activeTab == 3 && gameMode == GameMode.token)
              Padding(
                padding: const EdgeInsets.only(top: 32, right: 70, left: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Play Amount',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFF3B46E)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/svg/starknet.svg'),
                                Text(
                                  '100',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          'Total Prize',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFF3B46E)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/svg/starknet.svg'),
                                Text('100', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 28,
                width: 110,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF3B46E)),
                  gradient: RadialGradient(colors: [Colors.transparent, const Color(0xFFF3B46E).withOpacity(0.9)], radius: 1.7),
                ),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: 130,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFF3B46E).withOpacity(0.6), Colors.transparent, Color(0xFFF3B46E).withOpacity(0.6)],
                      stops: [0.05, 0.4, 1],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text('Players', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white)),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(right: 45), child: const Divider(thickness: 2, color: Color(0xFFF3B46E), height: 2)),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(right: 40, bottom: (activeTab == 3 && gameMode == GameMode.token) ? 100 : 160),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('VYCHUACOBO'.truncate(5), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      SizedBox(height: 4),
                      Container(
                        height: 72,
                        width: 72,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xFFF3B46E)),
                        child: Center(child: Image.asset('assets/images/jason.png', width: 91, height: 91)),
                      ),
                    ],
                  ),
                  const Text('VS', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                  Column(
                    children: [
                      Text('????'.truncate(5), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      SizedBox(height: 4),
                      Container(
                        height: 72,
                        width: 72,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Color(0xFFF3B46E), width: 1)),
                        child: Center(child: SvgPicture.asset('assets/svg/userCheckers.svg', width: 41, height: 41)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
