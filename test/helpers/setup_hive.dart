import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marquis_v2/games/ludo/models/ludo_session.dart';
import 'package:marquis_v2/models/app_state.dart';
import 'package:marquis_v2/models/user.dart';

/// Setup function to be called in setUpAll for all test files
Future<void> setupTests() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  // Mock path_provider
  const channel = MethodChannel('plugins.flutter.io/path_provider');
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
    if (methodCall.method == 'getTemporaryDirectory') {
      final directory = Directory.systemTemp.createTempSync();
      return directory.path;
    }
    return null;
  });

  // Initialize Hive with temp directory
  final tempDir = Directory.systemTemp.createTempSync();
  Hive.init(tempDir.path);
  if (!Hive.isAdapterRegistered(AppStateDataImplAdapter().typeId)) {
    Hive.registerAdapter(AppStateDataImplAdapter());
  }
  if (!Hive.isAdapterRegistered(UserDataImplAdapter().typeId)) {
    Hive.registerAdapter(UserDataImplAdapter());
  }
  if (!Hive.isAdapterRegistered(LudoSessionDataImplAdapter().typeId)) {
    Hive.registerAdapter(LudoSessionDataImplAdapter());
  }
  if (!Hive.isAdapterRegistered(LudoSessionUserStatusImplAdapter().typeId)) {
    Hive.registerAdapter(LudoSessionUserStatusImplAdapter());
  }
  await Hive.openBox<AppStateData>('appState');
  await Hive.openBox<UserData>('user');
  await Hive.openBox<LudoSessionData>('ludoSession');
}

/// Shared tearDown function for cleaning up after tests
Future<void> tearDownTests() async {
  await Hive.deleteFromDisk();
}
