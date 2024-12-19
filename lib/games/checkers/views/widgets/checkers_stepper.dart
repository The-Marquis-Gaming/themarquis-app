import 'package:flutter/material.dart';
import 'package:marquis_v2/games/checkers/core/utils/checkers_enum.dart';

class CheckersStepper extends StatelessWidget {
  final int _activeTab, _numberOfSteps;
  final GameMode? gameMode;
  const CheckersStepper(
      {required int activeTab,
      required int numberOfSteps,
      required this.gameMode,
      super.key})
      : _activeTab = activeTab,
        _numberOfSteps = numberOfSteps;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _numberOfSteps,
      itemBuilder: (context, index) {
        return Column(
          children: [
            if (index != 0)
              ...List.generate(
                (_activeTab == 1 && gameMode == GameMode.free)
                    ? 55
                    : (_activeTab == 1 && gameMode == GameMode.token)
                        ? 55
                        : 25,
                (index2) => Container(
                  width: 3,
                  height: 3,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(bottom: 4),
                ),
              ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 11,
              height: 11,
              decoration: BoxDecoration(
                color: index <= _activeTab
                    ? const Color(0xFFF3B46E)
                    : Color(0XFF242E39),
                shape: BoxShape.circle,
              ),
            ),
          ],
        );
      },
    );
  }
}
