import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:marquis_v2/env.dart';
import 'package:marquis_v2/models/app_state.dart';
import 'package:marquis_v2/models/user.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'app_state_test.mocks.dart';

@GenerateMocks([Box, http.Client])
void main() {
  late ProviderContainer container;
  late MockBox<AppStateData> mockBox;
  late MockBox<UserData> userMockBox;
  late MockClient mockClient;
  late String? baseUrl;
  setUp(() {
    mockBox = MockBox<AppStateData>();
    userMockBox = MockBox<UserData>();
    mockClient = MockClient();
    container = ProviderContainer(
      overrides: [
        appStateProvider.overrideWith(
          () {
            final appState = AppState(hiveBox: mockBox, httpClient: mockClient);
            return appState;
          },
        ),
        userProvider.overrideWith(
          () {
            final user = User(hiveBox: userMockBox);
            return user;
          },
        ),
      ],
    );
    baseUrl = environment['build'] == 'DEBUG' ? environment['apiUrlDebug'] : environment['apiUrl'];
    final initialState = AppStateData(navigatorIndex: 0);
    when(mockBox.get('appState', defaultValue: anyNamed('defaultValue'))).thenReturn(initialState);
  });

  tearDown(() {
    container.dispose();
  });

  test('changeNavigatorIndex updates state and saves to Hive', () {
    final appState = container.read(appStateProvider.notifier);
    appState.changeNavigatorIndex(1);
    final updatedState = container.read(appStateProvider);
    expect(updatedState.navigatorIndex, 1);
    verify(mockBox.put('appState', updatedState)).called(1);
  });

  test('changeTheme updates state and saves to Hive', () {
    final appState = container.read(appStateProvider.notifier);

    appState.changeTheme('light');
    var updatedState = container.read(appStateProvider);
    expect(updatedState.theme, 'light');
    verify(mockBox.put('appState', updatedState)).called(1);

    appState.changeTheme('dark');
    updatedState = container.read(appStateProvider);
    expect(updatedState.theme, 'dark');
    verify(mockBox.put('appState', updatedState)).called(1);
  });

  test('selectGame updates state and saves to Hive', () {
    final appState = container.read(appStateProvider.notifier);

    appState.selectGame('game1');
    final updatedState = container.read(appStateProvider);
    expect(updatedState.selectedGame, 'game1');
    verify(mockBox.put('appState', updatedState)).called(1);
  });

  test('toggleBalanceVisibility updates state and saves to Hive', () {
    final appState = container.read(appStateProvider.notifier);

    appState.toggleBalanceVisibility();
    final updatedState = container.read(appStateProvider);
    expect(updatedState.isBalanceVisible, true);
    verify(mockBox.put('isBalanceVisible', updatedState)).called(1);
  });

  test('login makes a POST request and handles response', () async {
    final appState = container.read(appStateProvider.notifier);
    final url = Uri.parse('$baseUrl/auth/signin');

    when(mockClient.post(url, body: anyNamed('body'), headers: anyNamed('headers'))).thenAnswer((_) async => http.Response('{}', 200));

    await appState.login('test@example.com');

    verify(mockClient.post(url, body: anyNamed('body'), headers: anyNamed('headers'))).called(1);
  });

  test('signup makes a POST request and handles response', () async {
    final appState = container.read(appStateProvider.notifier);
    final url = Uri.parse('$baseUrl/auth/signup');
    when(mockClient.post(url, body: anyNamed('body'), headers: anyNamed('headers'))).thenAnswer((_) async => http.Response('{}', 200));

    await appState.signup('test@example.com', 'referralCode');

    verify(mockClient.post(url, body: anyNamed('body'), headers: anyNamed('headers'))).called(1);
  });

  test('logout resets state and cancels timers', () async {
    final appState = container.read(appStateProvider.notifier);

    await appState.logout();

    final updatedState = container.read(appStateProvider);
    expect(updatedState.navigatorIndex, 0);
    expect(updatedState.accessToken, null);
    expect(updatedState.refreshToken, null);
    expect(updatedState.selectedGame, null);
    expect(updatedState.selectedGameSessionId, null);
    expect(updatedState.autoLoginResult, false);
    verify(mockBox.put('appState', updatedState)).called(1);
  });
}
