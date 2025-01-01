import 'package:flame/cache.dart';
import 'package:flame/flame.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart' show GlobalKey, Widget;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:marquis_v2/games/ludo/components/dice.dart';
import 'package:marquis_v2/games/ludo/ludo_game_controller.dart';
import 'package:marquis_v2/games/ludo/ludo_session.dart';
import 'package:marquis_v2/games/ludo/models/ludo_session.dart';
import 'package:marquis_v2/games/ludo/screens/game_over_screen.dart';
import 'package:marquis_v2/games/ludo/screens/waiting_room/four_player_waiting_room_screen.dart';
import 'package:marquis_v2/games/ludo/screens/welcome_screen.dart';
import 'package:marquis_v2/models/app_state.dart';
import 'package:marquis_v2/models/enums.dart';
import 'package:marquis_v2/models/user.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../helpers/mock_image.dart';
import 'ludo_game_controller_test.mocks.dart';

void _setupFlame() {
  final mockImages = MockImages();
  final spriteImage = MockImage(height: 904, width: 1028);
  final avatarSpriteImage = MockImage(height: 4324, width: 4324);
  final diceImage = MockImage(height: 267, width: 1602);
  final activeButtonImage = MockImage(height: 46, width: 99);
  final playImage = MockImage(height: 46, width: 99);
  Flame.images = mockImages;

  when(mockImages.fromCache('spritesheet.png')).thenReturn(spriteImage);

  when(mockImages.fromCache('avatar_spritesheet.png')).thenReturn(avatarSpriteImage);

  when(mockImages.fromCache('dice_interface.png')).thenReturn(diceImage);

  when(mockImages.fromCache('active_button.png')).thenReturn(activeButtonImage);

  when(mockImages.fromCache('play.png')).thenReturn(playImage);

  when(mockImages.fromCache('dice_icon.png')).thenReturn(MockImage(height: 17, width: 16));
}

@GenerateMocks([Box, LudoSessionData, Client, Images])
void main() {
  late LudoGameController ludoGameController;
  late ProviderContainer container;
  late MockBox<AppStateData> appMockBox;
  late MockBox<UserData> userMockBox;
  late MockBox<LudoSessionData> ludoBox;
  late MockClient mockClient;
  late GlobalKey<RiverpodAwareGameWidgetState<LudoGameController>> gameKey;
  late Widget gameWidget;

  setUp(
    () {
      _setupFlame();
      ludoGameController = LudoGameController();
      ludoBox = MockBox<LudoSessionData>();
      mockClient = MockClient();
      appMockBox = MockBox<AppStateData>();
      userMockBox = MockBox<UserData>();
      gameKey = GlobalKey<RiverpodAwareGameWidgetState<LudoGameController>>();
      container = ProviderContainer(
        overrides: [
          appStateProvider.overrideWith(() => AppState(hiveBox: appMockBox, httpClient: mockClient)),
          userProvider.overrideWith(() => User(hiveBox: userMockBox, httpClient: mockClient)),
          ludoSessionProvider.overrideWith(() => LudoSession(hiveBox: ludoBox, httpClient: mockClient)),
        ],
      );
      gameWidget = UncontrolledProviderScope(
        container: container,
        child: RiverpodAwareGameWidget<LudoGameController>(
          key: gameKey,
          game: ludoGameController,
          overlayBuilderMap: {
            PlayState.welcome.name: (context, game) => LudoWelcomeScreen(game: game),
            PlayState.waiting.name: (context, game) => FourPlayerWaitingRoomScreen(game: game),
            PlayState.finished.name: (context, game) => MatchResultsScreen(game: game, session: container.read(ludoSessionProvider)!),
          },
        ),
      );

      when(appMockBox.get('appState', defaultValue: anyNamed('defaultValue'))).thenReturn(AppStateData(navigatorIndex: 0));
      when(userMockBox.get('user', defaultValue: anyNamed('defaultValue'))).thenReturn(
        UserData(
          id: "0",
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
          sessionId: "sessionId",
        ),
      );
      when(ludoBox.get('ludoSession', defaultValue: anyNamed('defaultValue'))).thenReturn(
        LudoSessionData(
          id: "0",
          status: "status",
          nextPlayer: "nextPlayer",
          nonce: "nonce",
          color: "red",
          playAmount: "playAmount",
          playToken: "playToken",
          sessionUserStatus: List.generate(4, (index) {
            return LudoSessionUserStatus(
              playerId: index,
              playerTokensPosition: [],
              playerWinningTokens: [false, false, false, false],
              userId: index,
              email: "email",
              role: "role",
              status: "status",
              points: 0,
              playerTokensCircled: [false, false, false, false],
              color: "red",
            );
          }),
          nextPlayerId: 1,
          creator: "creator",
          createdAt: DateTime.now(),
          currentDiceValue: 0,
          playMoveFailed: false,
        ),
      );
    },
  );

  group(
    'Ludo Game Controller Tests',
    () {
      test('Initial state is correct', () {
        expect(ludoGameController.isInit, false);
        expect(ludoGameController.playerCanMove, false);
        expect(ludoGameController.currentPlayer, 0);
      });

      testWidgets('OnLoad sets playState to welcome', (widgetTester) async {
        await widgetTester.pumpWidget(gameWidget);

        await ludoGameController.onLoad();

        expect(ludoGameController.playState, PlayState.welcome);
        expect(ludoGameController.board, isNull);
        expect(ludoGameController.diceContainer, isNull);
        expect(ludoGameController.playerHomes, isEmpty);
        expect(ludoGameController.destination, isNull);
      });

      testWidgets("Waiting playState doesn't have game elements loaded", (widgetTester) async {
        await widgetTester.pumpWidget(gameWidget);

        await ludoGameController.updatePlayState(PlayState.waiting);

        expect(ludoGameController.playState, PlayState.waiting);
        expect(ludoGameController.board, isNull);
        expect(ludoGameController.diceContainer, isNull);
        expect(ludoGameController.playerHomes, isEmpty);
        expect(ludoGameController.destination, isNull);
      });

      testWidgets("Finished playState doesn't have game elements loaded", (widgetTester) async {
        await widgetTester.pumpWidget(gameWidget);

        await ludoGameController.updatePlayState(PlayState.finished);

        expect(ludoGameController.playState, PlayState.finished);
        expect(ludoGameController.board, isNull);
        expect(ludoGameController.diceContainer, isNull);
        expect(ludoGameController.playerHomes, isEmpty);
        expect(ludoGameController.destination, isNull);
      });

      testWidgets(
        'Setting playState to playing initializes the game',
        (widgetTester) async {
          await widgetTester.pumpWidget(gameWidget);

          ludoGameController.sessionData = ludoBox.get('ludoSession')!;
          await ludoGameController.updatePlayState(PlayState.playing);

          expect(ludoGameController.isInit, true);
          expect(ludoGameController.playState, PlayState.playing);
          expect(ludoGameController.board, isNotNull);
          expect(ludoGameController.diceContainer, isNotNull);
          expect(ludoGameController.playerHomes, isNotEmpty);
          expect(ludoGameController.playerHomes.length, 4);
          expect(ludoGameController.destination, isNotNull);
        },
      );

      testWidgets('Playing move updates dice state', (widgetTester) async {
        when(mockClient.post(any, body: anyNamed('body'), headers: anyNamed('headers'))).thenAnswer((_) async => Response("", 200));
        await widgetTester.pumpWidget(gameWidget);
        ludoGameController.sessionData = ludoBox.get("ludoSession")!;
        await ludoGameController.updatePlayState(PlayState.playing);
        await ludoGameController.playMove(0);
        expect(ludoGameController.currentDice.state, DiceState.playingMove);
      });
    },
  );
}
