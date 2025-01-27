import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:marquis_v2/env.dart';
import 'package:marquis_v2/games/ludo/ludo_session.dart';
import 'package:marquis_v2/games/ludo/models/ludo_session.dart';
import 'package:marquis_v2/models/app_state.dart';
import 'package:marquis_v2/models/user.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'ludo_session_test.mocks.dart';

@GenerateMocks([Client, Box])
void main() {
  late MockClient mockClient;
  late MockBox<LudoSessionData> ludoMockBox;
  late MockBox<AppStateData> appMockBox;
  late MockBox<UserData> userMockBox;
  late ProviderContainer container;
  late String? baseUrl;
  final sessionId = 'new_session_id';

  setUp(
    () {
      mockClient = MockClient();
      ludoMockBox = MockBox();
      appMockBox = MockBox();
      userMockBox = MockBox();
      container = ProviderContainer(overrides: [
        appStateProvider.overrideWith(() => AppState(httpClient: mockClient, hiveBox: appMockBox)),
        userProvider.overrideWith(() => User(httpClient: mockClient, hiveBox: userMockBox)),
        ludoSessionProvider.overrideWith(() => LudoSession(httpClient: mockClient, hiveBox: ludoMockBox)),
      ]);
      final response1 = Response(
        jsonEncode({
          'session_id': sessionId,
          'account_address': "account_address",
          'referral_code': 'referral_code',
          'user': {
            'id': "0",
            'email': 'email',
            'role': 'role',
            'status': 'status',
            'points': 0,
            'referred_by': 'referred_by',
            'referral_id': 0,
            'wallet_id': 0,
            'profile_image_url': 'profile_image_url',
            'created_at': 1633024800,
            'updated_at': 1633024800,
          },
        }),
        200,
      );
      final response2 = Response(
        jsonEncode(
          {
            'status': 'status',
            'next_player': 'next_player',
            'nonce': 'nonce',
            'color': 'color',
            'play_amount': 'play_amount',
            'play_token': 'play_token',
            'next_player_id': 1,
            'created_at': 1633024800,
            'session_user_status': [
              {
                'player_tokens_position': [],
                'player_winning_tokens': [],
                'player_tokens_circled': [],
                'player_id': 0,
                'user_id': 0,
                'email': 'email',
                'role': 'role',
                'status': 'status',
                'points': 0,
                'color': 'color'
              },
            ],
          },
        ),
        200,
      );
      baseUrl = environment['build'] == 'DEBUG' ? environment['apiUrlDebug'] : environment['apiUrl'];
      when(appMockBox.get('appState', defaultValue: anyNamed('defaultValue'))).thenReturn(AppStateData());
      when(ludoMockBox.get('ludoSession', defaultValue: anyNamed('defaultValue'))).thenReturn(
        LudoSessionData(
          id: "id",
          status: "status",
          nextPlayer: "nextPlayer",
          nonce: "nonce",
          color: "color",
          playAmount: "playAmount",
          playToken: "playToken",
          sessionUserStatus: [],
          nextPlayerId: 0,
          creator: "creator",
          createdAt: DateTime.now(),
          currentDiceValue: 2,
          playMoveFailed: false,
        ),
      );
      when(mockClient.get(Uri.parse('$baseUrl/user/info'), headers: anyNamed('headers'))).thenAnswer((_) async => response1);
      when(mockClient.get(Uri.parse("$baseUrl/game/session/$sessionId"), headers: anyNamed('headers'))).thenAnswer((_) async => response2);
    },
  );

  group('LudoSession', () {
    test('joinSession joins an existing session', () async {
      final color = '1';
      final response1 = Response(jsonEncode({'id': sessionId}), 201);

      when(mockClient.post(Uri.parse('$baseUrl/session/join'), body: jsonEncode({'session_id': sessionId, 'user_color': color}), headers: anyNamed('headers')))
          .thenAnswer((_) async => response1);

      await container.read(ludoSessionProvider.notifier).joinSession(sessionId, color);

      verify(mockClient.post(Uri.parse('$baseUrl/session/join'),
              body: jsonEncode({'session_id': sessionId, 'user_color': color}), headers: anyNamed('headers')))
          .called(1);
      verify(mockClient.get(Uri.parse("$baseUrl/game/session/$sessionId"), headers: anyNamed('headers'))).called(1);
      verify(mockClient.get(Uri.parse('$baseUrl/user/info'), headers: anyNamed('headers'))).called(1);
      expect(container.read(ludoSessionProvider)?.id, sessionId);
    });

    test('createSession creates a new session', () async {
      final amount = '100';
      final color = '1';
      final tokenAddress = 'token_address';
      final requiredPlayers = '4';
      final response1 = Response(jsonEncode({'id': sessionId}), 201);
      
      when(mockClient.post(Uri.parse('$baseUrl/session/create'),
          body: jsonEncode({
            'amount': amount,
            'user_creator_color': color,
            'token_address': tokenAddress,
            'required_players': requiredPlayers,
          }), 
          headers: anyNamed('headers')))
        .thenAnswer((_) async => response1);

      await container.read(ludoSessionProvider.notifier).createSession(
        amount, 
        color, 
        tokenAddress,
        requiredPlayers,
      );

      verify(mockClient.post(any, body: anyNamed('body'), headers: anyNamed('headers'))).called(1);
      verify(mockClient.get(Uri.parse("$baseUrl/game/session/$sessionId"), headers: anyNamed('headers'))).called(1);
      verify(mockClient.get(Uri.parse('$baseUrl/user/info'), headers: anyNamed('headers'))).called(1);

      expect(container.read(ludoSessionProvider)?.id, sessionId);
    });

    test(
      'exitSession clears ludo session state',
      () async {
        final response = Response(jsonEncode({'message': 'success'}), 201);

        when(mockClient.post(Uri.parse('$baseUrl/session/exit-game'), body: anyNamed('body'), headers: anyNamed('headers'))).thenAnswer((_) async => response);

        when(userMockBox.get('user', defaultValue: anyNamed('defaultValue'))).thenReturn(
          UserData(
            id: "id",
            email: "email",
            role: "role",
            status: "status",
            points: 0,
            referredBy: "referredBy",
            referralId: 0,
            walletId: 0,
            profileImageUrl: "profileImageUrl",
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            referralCode: "referralCode",
            accountAddress: "accountAddress",
            sessionId: sessionId,
          ),
        );

        await container.read(ludoSessionProvider.notifier).exitSession();

        verify(mockClient.post(Uri.parse('$baseUrl/session/exit-game'), body: anyNamed('body'), headers: anyNamed('headers'))).called(1);
        verify(mockClient.get(Uri.parse('$baseUrl/user/info'), headers: anyNamed('headers'))).called(1);

        expect(container.read(ludoSessionProvider), isNull);
      },
    );
    test(
      'exitSession terminates if sessionId is null',
      () async {
        final response = Response(jsonEncode({'message': 'success'}), 201);

        when(mockClient.post(Uri.parse('$baseUrl/session/exit-game'), body: anyNamed('body'), headers: anyNamed('headers'))).thenAnswer((_) async => response);

        when(userMockBox.get('user', defaultValue: anyNamed('defaultValue'))).thenReturn(null);

        await container.read(ludoSessionProvider.notifier).exitSession();

        verifyNoMoreInteractions(mockClient);
      },
    );
    test('closeSession', () async {
      final response = Response(jsonEncode({'message': 'success'}), 201);

      when(mockClient.post(Uri.parse('$baseUrl/session/close'), body: jsonEncode({'session_id': null}), headers: anyNamed('headers')))
          .thenAnswer((_) async => response);

      await container.read(ludoSessionProvider.notifier).closeSession(sessionId);

      verify(mockClient.post(Uri.parse('$baseUrl/session/close'), body: jsonEncode({'session_id': null}), headers: anyNamed('headers'))).called(1);
      verify(mockClient.get(Uri.parse('$baseUrl/user/info'), headers: anyNamed('headers'))).called(1);
    });

    test('getLudoSessionFromId returns LudoSessionData on success', () async {
      final result = await container.read(ludoSessionProvider.notifier).getLudoSessionFromId(sessionId);

      verify(mockClient.get(Uri.parse("$baseUrl/game/session/$sessionId"), headers: anyNamed('headers'))).called(1);

      expect(result, isA<LudoSessionData>());
      expect(result?.id, sessionId);
    });

    test('getTransactions returns list of transactions on success', () async {
      final id = 'test_id';
      final response = Response(
          jsonEncode([
            {'transaction': 'test'}
          ]),
          200);

      when(mockClient.get(Uri.parse('$baseUrl/game/session/$id/transactions'), headers: anyNamed('headers'))).thenAnswer((_) async => response);

      final result = await container.read(ludoSessionProvider.notifier).getTransactions(id);

      verify(mockClient.get(Uri.parse('$baseUrl/game/session/$id/transactions'), headers: anyNamed('headers'))).called(1);

      expect(result, isA<List<Map>>());
      expect(result.length, 1);
    });
  });

  test(
    'clearData resets LudoSessionData without Reloading User',
    () async {
      await container.read(ludoSessionProvider.notifier).clearData();

      verify(ludoMockBox.delete('ludoSession')).called(1);
      verifyNoMoreInteractions(ludoMockBox);
      verifyZeroInteractions(mockClient);

      expect(container.read(ludoSessionProvider), isNull);
    },
  );

  test(
    'clearData resets LudoSessionData and Reloads User',
    () async {
      await container.read(ludoSessionProvider.notifier).clearData(refreshUser: true);

      verify(ludoMockBox.delete('ludoSession')).called(1);
      verify(mockClient.get(Uri.parse('$baseUrl/user/info'), headers: anyNamed('headers'))).called(1);
      verify(userMockBox.get('user', defaultValue: anyNamed('defaultValue'))).called(1);
      verify(userMockBox.put('user', any)).called(1);

      verifyNoMoreInteractions(userMockBox);
      verifyNoMoreInteractions(ludoMockBox);
      verifyNoMoreInteractions(mockClient);
      expect(container.read(ludoSessionProvider), isNull);
    },
  );

  test(
    'playMove makes request to the right url',
    () async {
      final tokenId = 'test_token_id';
      when(mockClient.post(Uri.parse('$baseUrl/game/session/null/play-move/$tokenId'), body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((_) async => Response('', 201));

      await container.read(ludoSessionProvider.notifier).playMove(tokenId);

      verify(mockClient.post(Uri.parse('$baseUrl/game/session/null/play-move/$tokenId'), body: anyNamed('body'), headers: anyNamed('headers'))).called(1);
      verifyNoMoreInteractions(mockClient);
    },
  );
  test(
    'generateMove returns List<int>',
    () async {
      when(mockClient.post(Uri.parse('$baseUrl/game/session/null/generate-move'), body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((_) async => Response(jsonEncode([6, 5]), 200));

      final moves = await container.read(ludoSessionProvider.notifier).generateMove();

      verify(mockClient.post(Uri.parse('$baseUrl/game/session/null/generate-move'), body: anyNamed('body'), headers: anyNamed('headers'))).called(1);

      expect(moves, isA<List<int>>());
    },
  );
}
