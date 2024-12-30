import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:marquis_v2/env.dart';
import 'package:marquis_v2/models/app_state.dart';
import 'package:marquis_v2/models/user.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_test.mocks.dart';

@GenerateMocks([Box, Client])
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
        appStateProvider.overrideWith(() => AppState(hiveBox: mockBox, httpClient: mockClient)),
        userProvider.overrideWith(() => User(hiveBox: userMockBox, httpClient: mockClient)),
      ],
    );
    baseUrl = environment['build'] == 'DEBUG' ? environment['apiUrlDebug'] : environment['apiUrl'];
    when(mockBox.get('appState', defaultValue: anyNamed('defaultValue'))).thenReturn(AppStateData(navigatorIndex: 0));
    when(userMockBox.get('user', defaultValue: anyNamed('defaultValue'))).thenReturn(null);
  });

  group('User Provider Tests', () {
    test('getUser fetches and stores user data', () async {
      final time = DateTime.now();
      final response = {
        'user': {
          'id': '1',
          'email': 'test@example.com',
          'role': 'user',
          'status': 'active',
          'points': 100,
          'referred_by': '2',
          'referral_id': 0,
          'wallet_id': 0,
          'profile_image_url': 'http://example.com/image.png',
          'created_at': time.millisecondsSinceEpoch ~/ 1000,
          'updated_at': time.millisecondsSinceEpoch ~/ 1000,
        },
        'referral_code': 'refcode123',
        'account_address': '0x123',
        'session_id': 'session123',
      };

      when(mockClient.get(Uri.parse("$baseUrl/user/info"), headers: anyNamed('headers'))).thenAnswer((_) async => Response(jsonEncode(response), 200));
      when(userMockBox.put('user', any)).thenAnswer((_) async => Future.value());

      await container.read(userProvider.notifier).getUser();

      verify(userMockBox.put('user', any)).called(1);
      expect(container.read(userProvider)!.email, equals('test@example.com'));
      expect(container.read(userProvider.notifier), isNotNull);
    });

    test('clearData clears user data', () async {
      final time = DateTime.now();
      final response = {
        'user': {
          'id': '1',
          'email': 'test@example.com',
          'role': 'user',
          'status': 'active',
          'points': 100,
          'referred_by': '2',
          'referral_id': 0,
          'wallet_id': 0,
          'profile_image_url': 'http://example.com/image.png',
          'created_at': time.millisecondsSinceEpoch ~/ 1000,
          'updated_at': time.millisecondsSinceEpoch ~/ 1000,
        },
        'referral_code': 'refcode123',
        'account_address': '0x123',
        'session_id': 'session123',
      };

      when(userMockBox.delete('user')).thenAnswer((_) async => Future.value());
      when(mockClient.get(Uri.parse("$baseUrl/user/info"), headers: anyNamed('headers'))).thenAnswer((_) async => Response(jsonEncode(response), 200));
      when(userMockBox.put('user', any)).thenAnswer((_) async => Future.value());

      // Fetching user data is required to test deleting it
      await container.read(userProvider.notifier).getUser();

      expect(container.read(userProvider)?.email, equals('test@example.com'));

      await container.read(userProvider.notifier).clearData();

      verify(userMockBox.delete('user')).called(1);

      expect(container.read(userProvider), isNull);
    });

    test('getSupportedTokens fetches supported tokens', () async {
      final response = [
        {'address': '0x123', 'name': 'Token1'},
        {'address': '0x456', 'name': 'Token2'},
      ];

      when(mockClient.get(Uri.parse("$baseUrl/game/supported-tokens"), headers: anyNamed('headers')))
          .thenAnswer((_) async => Response(jsonEncode(response), 200));

      final tokens = await container.read(userProvider.notifier).getSupportedTokens();

      expect(tokens.length, equals(2));
      expect(tokens[0]['tokenAddress'], equals('0x123'));
      expect(tokens[0]['tokenName'], equals('Token1'));
    });

    test('getTokenBalance fetches 0 when state is null', () async {
      final balance = await container.read(userProvider.notifier).getTokenBalance('0x123');

      expect(balance, equals(BigInt.from(0)));
    });

    test('getTokenBalance fetches token amount in wallet', () async {
      final balanceResponse = {'balance': '1000'};
      final time = DateTime.now();
      final userResponse = {
        'user': {
          'id': '1',
          'email': 'test@example.com',
          'role': 'user',
          'status': 'active',
          'points': 100,
          'referred_by': '2',
          'referral_id': 0,
          'wallet_id': 0,
          'profile_image_url': 'http://example.com/image.png',
          'created_at': time.millisecondsSinceEpoch ~/ 1000,
          'updated_at': time.millisecondsSinceEpoch ~/ 1000,
        },
        'referral_code': 'refcode123',
        'account_address': '0x123',
        'session_id': 'session123',
      };

      when(mockClient.get(Uri.parse("$baseUrl/user/info"), headers: anyNamed('headers'))).thenAnswer((_) async => Response(jsonEncode(userResponse), 200));
      when(userMockBox.put('user', any)).thenAnswer((_) async => Future.value());
      when(mockClient.get(Uri.parse('$baseUrl/game/token/balance/0x123/0x123'), headers: anyNamed('headers'))).thenAnswer(
        (_) async => Response(jsonEncode(balanceResponse), 200),
      );

      //Providing dummy user to test getTokenBalance
      await container.read(userProvider.notifier).getUser();

      final balance = await container.read(userProvider.notifier).getTokenBalance('0x123');

      expect(balance, equals(BigInt.from(1000)));
    });
  });
}
