import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:marquis_v2/env.dart';
import 'package:marquis_v2/games/ludo/models/ludo_session.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part "ludo_session.g.dart";

final baseUrl = environment['apiUrl'];
final baseUrlDebug = environment['apiUrlDebug'];
final wsUrl = environment['wsUrl'];
final wsUrlDebug = environment['wsUrlDebug'];

@Riverpod(keepAlive: true)
class LudoSession extends _$LudoSession {
  //Details Declaration
  WebSocketChannel? _channel;
  Box<LudoSessionData>? _hiveBox;
  http.Client? _httpClient;
  String? _id;
  int? _currentDiceValue;
  bool _playMoveFailed = false;

  LudoSession({Box<LudoSessionData>? hiveBox, http.Client? httpClient}) {
    if (hiveBox != null) {
      _hiveBox = hiveBox;
    }
    if (httpClient != null) {
      _httpClient = httpClient;
    }
  }

  @override
  LudoSessionData? build() {
    _hiveBox ??= Hive.box<LudoSessionData>("ludoSession");
    _httpClient ??= http.Client();
    if (!Platform.environment.containsKey('FLUTTER_TEST')) connectWebSocket();
    ref.onDispose(() {
      _channel?.sink.close();
    });
    return null;
  }

  void connectWebSocket() {
    try {
      _channel = WebSocketChannel.connect(Uri.parse(
          ref.read(appStateProvider).isSandbox ? wsUrlDebug! : wsUrl!));
      _channel?.stream.listen(
        (data) async {
          if (kDebugMode) print("WS: $data");
          final decodedResponse = jsonDecode(data) as Map;
          switch (decodedResponse['event']) {
            case 'play_move':
            case 'player_joined':
            case 'play_move_failed':
            case 'session_finished':
              final dataStr = decodedResponse['data'] as String;
              final data = jsonDecode(dataStr) as Map;
              if (data["session_id"] != _id) return;
              if (decodedResponse['event'] == 'play_move') {
                _currentDiceValue = int.parse(data['steps']);
              }
              if (decodedResponse['event'] == 'play_move_failed') {
                _playMoveFailed = true;
              } else {
                _playMoveFailed = false;
              }
              if (kDebugMode) print('Data $data');
              await getLudoSession();
              break;
            case 'player_exited':
              final dataStr = decodedResponse['data'] as String;
              final data = jsonDecode(dataStr) as Map;
              if (data["session_id"] != _id) return;
              state = state?.copyWith(
                message:
                    "EXITED: Player ${data['player_id']} has left the session, session ${data['session_id']} has finished.",
              );
              break;
          }
        },
        onDone: () {
          Future.delayed(const Duration(seconds: 1), () {
            connectWebSocket();
          });
        },
        onError: (error) {
          if (kDebugMode) print('WS Error $error');
          Future.delayed(const Duration(seconds: 1), () {
            connectWebSocket();
          });
        },
        cancelOnError: false,
      );
    } catch (e) {
      if (kDebugMode) print('WS Connection Error $e');
      Future.delayed(const Duration(seconds: 1), () {
        connectWebSocket();
      });
    }
  }

  Future<void> getLudoSession() async {
    if (_id == null) {
      _id = ref.read(appStateProvider).selectedGameSessionId;
      if (_id == null) return;
    }
    final url = Uri.parse(
        '${ref.read(appStateProvider).isSandbox ? baseUrlDebug : baseUrl}/game/session/$_id');
    final response = await _httpClient!.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': ref.read(appStateProvider).bearerToken,
      },
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw HttpException(
          'Request error with status code ${response.statusCode}.\nResponse:${utf8.decode(response.bodyBytes)}');
    }
    final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    final ludoSession = LudoSessionData(
      id: _id!,
      status: decodedResponse['status'],
      nextPlayer: decodedResponse['next_player'],
      nonce: decodedResponse['nonce'],
      color: decodedResponse['color'] ?? "0",
      playAmount: decodedResponse['play_amount'],
      playToken: decodedResponse['play_token'],
      sessionUserStatus: [
        ...decodedResponse['session_user_status'].map(
          (e) {
            final List<String> playerTokensPosition =
                (e['player_tokens_position'] as List<dynamic>)
                    .map((e) => e.toString())
                    .toList();
            final List<bool> playerWinningTokens =
                (e['player_winning_tokens'] as List<dynamic>)
                    .map((e) => e as bool)
                    .toList();
            final List<bool> playerTokensCircled =
                (e['player_tokens_circled'] as List<dynamic>)
                    .map((e) => e as bool)
                    .toList();
            return LudoSessionUserStatus(
              playerId: e['player_id'],
              playerTokensPosition: playerTokensPosition,
              playerWinningTokens: playerWinningTokens,
              playerTokensCircled: playerTokensCircled,
              userId: e['user_id'],
              email: e['email'],
              role: e['role'],
              status: e['status'],
              points: e['points'],
              color: e['color'],
            );
          },
        ),
      ],
      nextPlayerId: decodedResponse['next_player_id'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          decodedResponse['created_at'] * 1000),
      creator: "",
      currentDiceValue: _currentDiceValue ?? -1,
      playMoveFailed: _playMoveFailed,
    );
    await _hiveBox!.put(_id, ludoSession);
    state = ludoSession;
  }

  Future<LudoSessionData?> getLudoSessionFromId(String id) async {
    final url = Uri.parse(
        '${ref.read(appStateProvider).isSandbox ? baseUrlDebug : baseUrl}/game/session/$id');
    final response = await _httpClient!
        .get(url, headers: {'Content-Type': 'application/json'});
    debugPrint("${response.headers}");
    debugPrint(response.body);
    debugPrint("${response.statusCode}");
    if (response.statusCode != 201 && response.statusCode != 200) {
      if (!kReleaseMode)
        throw HttpException(
            '${jsonDecode(utf8.decode(response.bodyBytes))["message"]}');
      throw HttpException(
          'Request error with status code ${response.statusCode}.\nResponse: ${utf8.decode(response.bodyBytes)}');
    }
    final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    final ludoSession = LudoSessionData(
      id: id,
      status: decodedResponse['status'],
      nextPlayer: decodedResponse['next_player'],
      nonce: decodedResponse['nonce'],
      color: decodedResponse['color'] ?? "0",
      playAmount: decodedResponse['play_amount'],
      playToken: decodedResponse['play_token'],
      sessionUserStatus: [
        ...decodedResponse['session_user_status'].map(
          (e) {
            final List<String> playerTokensPosition =
                (e['player_tokens_position'] as List<dynamic>)
                    .map((e) => e.toString())
                    .toList();
            final List<bool> playerWinningTokens =
                (e['player_winning_tokens'] as List<dynamic>)
                    .map((e) => e as bool)
                    .toList();
            final List<bool> playerTokensCircled =
                (e['player_tokens_circled'] as List<dynamic>)
                    .map((e) => e as bool)
                    .toList();
            return LudoSessionUserStatus(
              playerId: e['player_id'],
              playerTokensPosition: playerTokensPosition,
              playerWinningTokens: playerWinningTokens,
              playerTokensCircled: playerTokensCircled,
              userId: e['user_id'],
              email: e['email'],
              role: e['role'],
              status: e['status'],
              points: e['points'],
              color: e['color'],
            );
          },
        ),
      ],
      nextPlayerId: decodedResponse['next_player_id'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          decodedResponse['created_at'] * 1000),
      creator: "",
      currentDiceValue: -1,
      playMoveFailed: false,
    );
    return ludoSession;
  }

  Future<List<LudoSessionData>> getOpenSessions() async {
    final url = Uri.parse(
        '${ref.read(appStateProvider).isSandbox ? baseUrlDebug : baseUrl}/session/get-open-sessions');
    final response = await _httpClient!.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw HttpException(
          'Request error with status code ${response.statusCode}.\nResponse:${utf8.decode(response.bodyBytes)}');
    }
    final decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
    return decodedResponse
        .map(
          (sessionData) => LudoSessionData(
            id: sessionData['id'],
            status: sessionData['status'],
            nextPlayer: sessionData['next_player'],
            nonce: sessionData['nonce'],
            color: sessionData['color'] ?? "0",
            playAmount: sessionData['play_amount'],
            playToken: sessionData['play_token'],
            sessionUserStatus: [
              ...sessionData['session_user_status'].map(
                (e) {
                  final List<String> playerTokensPosition =
                      (e['player_tokens_position'] as List<dynamic>)
                          .map((e) => e.toString())
                          .toList();
                  final List<bool> playerWinningTokens =
                      (e['player_winning_tokens'] as List<dynamic>)
                          .map((e) => e as bool)
                          .toList();
                  final List<bool> playerTokensCircled =
                      (e['player_tokens_circled'] as List<dynamic>)
                          .map((e) => e as bool)
                          .toList();
                  return LudoSessionUserStatus(
                    playerId: e['player_id'],
                    playerTokensPosition: playerTokensPosition,
                    playerWinningTokens: playerWinningTokens,
                    playerTokensCircled: playerTokensCircled,
                    userId: e['user_id'],
                    email: e['email'],
                    role: e['role'],
                    status: e['status'],
                    points: e['points'],
                    color: e['color'],
                  );
                },
              ),
            ],
            nextPlayerId: sessionData['next_player_id'],
            createdAt: DateTime.fromMillisecondsSinceEpoch(
                sessionData['created_at'] * 1000),
            creator: "",
            currentDiceValue: -1,
            playMoveFailed: false,
          ),
        )
        .toList();
  }

  Future<List<Map>> getTransactions(String id) async {
    final url = Uri.parse(
        '${ref.read(appStateProvider).isSandbox ? baseUrlDebug : baseUrl}/game/session/$id/transactions');
    final response = await _httpClient!
        .get(url, headers: {'Content-Type': 'application/json'});
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw HttpException(
          'Request error with status code ${response.statusCode}.\nResponse:${utf8.decode(response.bodyBytes)}');
    }
    final decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
    if (kDebugMode) print(decodedResponse);
    return decodedResponse.map((e) => e as Map).toList();
  }

  Future<List<int>> generateMove() async {
    final url = Uri.parse(
        '${ref.read(appStateProvider).isSandbox ? baseUrlDebug : baseUrl}/game/session/$_id/generate-move');
    final response = await _httpClient!.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': ref.read(appStateProvider).bearerToken
      },
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw HttpException(
          'Request error with status code ${response.statusCode}.\nResponse:${utf8.decode(response.bodyBytes)}');
    }
    final decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
    return decodedResponse.map((e) => e as int).toList();
  }

  Future<void> playMove(String tokenId) async {
    final url = Uri.parse(
        '${ref.read(appStateProvider).isSandbox ? baseUrlDebug : baseUrl}/game/session/$_id/play-move/$tokenId');
    final response = await _httpClient!.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': ref.read(appStateProvider).bearerToken
      },
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw HttpException(
          'Request error with status code ${response.statusCode}.\nResponse:${utf8.decode(response.bodyBytes)}');
    }
  }

  Future<void> clearData({bool refreshUser = false}) async {
    _hiveBox!.delete("ludoSession");
    state = null;
    _id = null;
    if (refreshUser) {
      await ref.read(userProvider.notifier).getUser();
    }
  }

  Future<void> createSession(
      String amount, String color, String tokenAddress) async {
    final url = Uri.parse(
        '${ref.read(appStateProvider).isSandbox ? baseUrlDebug : baseUrl}/session/create');
    log(jsonEncode({
      'amount': amount,
      'user_creator_color': color,
      'token_address': tokenAddress,
    }));
    final response = await _httpClient!.post(
      url,
      body: jsonEncode({
        'amount': amount,
        'user_creator_color': color,
        'token_address': tokenAddress,
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': ref.read(appStateProvider).bearerToken,
      },
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw HttpException(
          'Request error with status code ${response.statusCode}.\nResponse:${utf8.decode(response.bodyBytes)}');
    }
    final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    if (kDebugMode) print(decodedResponse);
    _id = decodedResponse['id'];
    await getLudoSession();
    await ref.read(userProvider.notifier).getUser();
  }

  Future<void> joinSession(String sessionId, String color) async {
    final url = Uri.parse(
        '${ref.read(appStateProvider).isSandbox ? baseUrlDebug : baseUrl}/session/join');
    final response = await _httpClient!.post(
      url,
      body: jsonEncode({
        'session_id': sessionId,
        'user_color': color,
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': ref.read(appStateProvider).bearerToken,
      },
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw HttpException(
          'Request error with status code ${response.statusCode}.\nResponse:${utf8.decode(response.bodyBytes)}');
    }
    final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    if (kDebugMode) print(decodedResponse);
    _id = sessionId;
    await getLudoSession();
    await ref.read(userProvider.notifier).getUser();
  }

  Future<void> closeSession(String tokenId) async {
    final url = Uri.parse(
        '${ref.read(appStateProvider).isSandbox ? baseUrlDebug : baseUrl}/session/close');
    final response = await _httpClient!.post(
      url,
      body: jsonEncode({'session_id': _id}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw HttpException(
          'Request error with status code ${response.statusCode}.\nResponse:${utf8.decode(response.bodyBytes)}');
    }
    final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    if (kDebugMode) print(decodedResponse);
    await ref.read(userProvider.notifier).getUser();
  }

  Future<void> exitSession() async {
    if (_id == null) {
      _id = ref.read(userProvider)?.sessionId;
      if (_id == null) return;
    }
    final url = Uri.parse(
        '${ref.read(appStateProvider).isSandbox ? baseUrlDebug : baseUrl}/session/exit-game');
    final response = await _httpClient!.post(
      url,
      body: jsonEncode({'session_id': _id}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': ref.read(appStateProvider).bearerToken,
      },
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw HttpException(
          'Request error with status code ${response.statusCode}.\nResponse:${utf8.decode(response.bodyBytes)}');
    }
    final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    if (kDebugMode) print(decodedResponse);
    _id = null;
    state = null;
    await ref.read(userProvider.notifier).getUser();
  }

  Future<void> editLudoSession(
    String firstName,
    String lastName,
    DateTime birthdate,
    String gender,
    String country,
    String fieldOfCareer,
  ) async {
    // await ref.read(natsServiceProvider.notifier).makeMicroserviceRequest(
    //       "jomfi.editLudoSession.<LudoSession>",
    //       jsonEncode({
    //         'firstName': firstName,
    //         'lastName': lastName,
    //         'birthdate': birthdate.toIso8601String(),
    //         'gender': gender,
    //         'country': country,
    //         'fieldOfCareer': fieldOfCareer,
    //       }),
    //     );
    // state = state?.copyWith(
    //   firstName: firstName,
    //   lastName: lastName,
    //   birthdate: birthdate,
    //   gender: gender,
    //   country: country,
    //   fieldOfCareer: fieldOfCareer,
    // );
  }
}
