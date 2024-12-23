import 'package:flutter/material.dart';

class VerticalStepper extends StatelessWidget {
  final int _activeTab, _numberOfSteps;
  final Color _activeColor;
  const VerticalStepper({required int activeTab, required int numberOfSteps, required Color activeColor, super.key})
      : _activeTab = activeTab,
        _numberOfSteps = numberOfSteps,
        _activeColor = activeColor;

  int get _numberOfBreaks {
    return _numberOfSteps == 2
        ? 30
        : _numberOfSteps == 3
            ? 15
            : 10;
  }

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
                _numberOfBreaks,
                (index2) => Container(
                  width: 3,
                  height: 3,
                  color: index <= _activeTab + 1 ? _activeColor : Colors.grey,
                  margin: const EdgeInsets.only(bottom: 4),
                ),
              ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 11,
              height: 11,
              decoration: BoxDecoration(
                color: index <= _activeTab ? _activeColor : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            if (index != _numberOfSteps - 1)
              ...List.generate(
                _numberOfBreaks,
                (index2) => Container(
                  width: 3,
                  height: 3,
                  color: index <= _activeTab ? _activeColor : Colors.grey,
                  margin: const EdgeInsets.only(bottom: 4),
                ),
              ),
          ],
        );
      },
    );
  }
}
