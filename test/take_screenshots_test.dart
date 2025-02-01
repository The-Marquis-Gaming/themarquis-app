@Tags(['golden_test'])

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:marquis_v2/games/ludo/ludo_session.dart';
import 'package:marquis_v2/games/ludo/ludo_session_test.dart';
import 'package:marquis_v2/main.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/providers/app_state_test.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:marquis_v2/providers/user_test.dart';

import 'helpers/setup_hive.dart';

final testDevices = [
  const Device(
    name: "Screen_IpadPro13Inch",
    size: Size(2064 / 2, 2752 / 2),
    textScale: 1,
    devicePixelRatio: 2,
  ),
  const Device(
    name: "Screen_Iphone6Inch9",
    size: Size(1320 / 2, 2868 / 2),
    textScale: 1,
    devicePixelRatio: 2,
  ),
  const Device(
    name: "Screen_Android",
    size: Size(369, 656),
    textScale: 1,
    devicePixelRatio: 1,
  ),
  const Device(
    name: "Screen_AndroidTablet7Inch",
    size: Size(603, 1072),
    textScale: 1,
    devicePixelRatio: 1,
  ),
  const Device(
    name: "Screen_AndroidTablet10Inch",
    size: Size(1080 / 2, 1920 / 2),
    textScale: 1,
    devicePixelRatio: 2,
  ),
];

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await loadAppFonts();
    await setupTests();
  });
  testGoldens(
    'take_screenshots_test',
    (tester) async {
      final appStateTest = AppStateTest();
      final ludoSessionTest = LudoSessionTest();
      final userTest = UserTest();

      final widget = ProviderScope(overrides: [
        appStateProvider.overrideWith(() => appStateTest),
        ludoSessionProvider.overrideWith(() => ludoSessionTest),
        userProvider.overrideWith(() => userTest),
      ], child: const MyApp());

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await multiScreenGolden(
        tester,
        "Home",
        customPump: (WidgetTester tester) async {
          await tester.pump(const Duration(seconds: 2));
        },
        devices: testDevices,
      );

      await appStateTest.login("test@test.com");
      userTest.setUser();
      await multiScreenGolden(
        tester,
        "Home_Login",
        customPump: (WidgetTester tester) async {
          await tester.pump(const Duration(seconds: 2));
        },
        devices: testDevices,
      );

      appStateTest.selectGame("ludo");
      await multiScreenGolden(
        tester,
        "Ludo_Menu",
        customPump: (WidgetTester tester) async {
          await tester.pump(const Duration(seconds: 2));
        },
        devices: testDevices,
      );

      ludoSessionTest.createSession("0", "red", "0");
      userTest.setSessionId("testSessionId");

      await multiScreenGolden(
        tester,
        "Ludo_Waiting_Room",
        customPump: (WidgetTester tester) async {
          await tester.pump(const Duration(seconds: 2));
        },
        devices: testDevices,
      );

      expect(find.byKey(const ValueKey("StartGameButton")), findsOne);
      await tester.tap(find.byKey(const ValueKey("StartGameButton")));

      await tester.runAsync(() async {
        await Future.delayed(const Duration(seconds: 5));
      });

      await multiScreenGolden(
        tester,
        "Ludo_Game",
        customPump: (WidgetTester tester) async {
          await tester.pump(const Duration(seconds: 2));
        },
        devices: testDevices,
      );
    },
  );
}
