import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:marquis_v2/env.dart';
import 'package:marquis_v2/games/ludo/models/ai_suggestion.dart';
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
          if (kDebugMode) print("WebSocket Event Received: $data");
          final decodedResponse = jsonDecode(data) as Map;

          // Log the event type
          if (kDebugMode) print("Event Type: ${decodedResponse['event']}");

          switch (decodedResponse['event']) {
            case 'session_created':
              if (kDebugMode) print("Session Created Event");
              final dataStr = decodedResponse['data'] as String;
              final data = jsonDecode(dataStr) as Map;
              if (data["session_id"] != _id) return;
              await getLudoSession();
              break;

            case 'player_joined':
              if (kDebugMode) print("Player Joined Event");
              final dataStr = decodedResponse['data'] as String;
              final data = jsonDecode(dataStr) as Map;
              if (data["session_id"] != _id) return;
              await getLudoSession();
              break;

            case 'session_full':
              if (kDebugMode) print("Session Full Event");
              final dataStr = decodedResponse['data'] as String;
              final data = jsonDecode(dataStr) as Map;
              if (data["session_id"] != _id) return;
              await getLudoSession();
              // Update session status to indicate it's ready to start
              state = state?.copyWith(
                status: "FULL",
                message: "Session is full and ready to start!",
              );
              break;

            case 'play_move':
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
              await getLudoSession();
              break;

            case 'player_exited':
              final dataStr = decodedResponse['data'] as String;
              final data = jsonDecode(dataStr) as Map;
              if (data["session_id"] != _id) return;
              state = state?.copyWith(
                message:
                    "EXITED: Player ${data['player_id']} has left the session.",
              );
              await getLudoSession();
              break;
          }
        },
        onDone: () {
          if (kDebugMode) print("WebSocket connection closed. Reconnecting...");
          Future.delayed(const Duration(seconds: 1), () {
            connectWebSocket();
          });
        },
        onError: (error) {
          if (kDebugMode) print('WebSocket Error: $error');
          Future.delayed(const Duration(seconds: 1), () {
            connectWebSocket();
          });
        },
        cancelOnError: false,
      );
    } catch (e) {
      if (kDebugMode) print('WebSocket Connection Error: $e');
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

    if (kDebugMode) print("Fetching session data for ID: $_id");

    final url = Uri.parse(
        '${ref.read(appStateProvider).isSandbox ? baseUrlDebug : baseUrl}/game/session/$_id');

    final response = await _httpClient!.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': ref.read(appStateProvider).bearerToken,
      },
    );

    if (kDebugMode) print("Session Response Status: ${response.statusCode}");
    if (kDebugMode)
      log("Session Response Body: ${utf8.decode(response.bodyBytes)}");

    if (response.statusCode != 201 && response.statusCode != 200) {
      throw HttpException(
          'Request error with status code ${response.statusCode}.\nResponse:${utf8.decode(response.bodyBytes)}');
    }
    final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    final List<LudoSessionUserStatus> sessionUserStatus =
        decodedResponse['session_user_status'].map<LudoSessionUserStatus>(
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
        );
      },
    ).toList();
    if (decodedResponse['required_players'] == 2) {
      sessionUserStatus[2] = sessionUserStatus[1].copyWith(playerId: 2);
      sessionUserStatus[1] =
          sessionUserStatus[1].copyWith(status: 'DUMMY', userId: -1);
      if (sessionUserStatus.length < 4) {
        sessionUserStatus.add(sessionUserStatus[2]
            .copyWith(status: 'DUMMY', playerId: 3, userId: -1));
      } else {
        sessionUserStatus[3] = sessionUserStatus[3]
            .copyWith(status: 'DUMMY', playerId: 3, userId: -1);
      }
    }
    final ludoSession = LudoSessionData(
      id: _id!,
      status: decodedResponse['status'],
      nextPlayer: decodedResponse['next_player'],
      nonce: decodedResponse['nonce'],
      playAmount: decodedResponse['play_amount'],
      playToken: decodedResponse['play_token'],
      sessionUserStatus: sessionUserStatus,
      nextPlayerId: decodedResponse['next_player_id'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          decodedResponse['created_at'] * 1000),
      creator: "",
      currentDiceValue: _currentDiceValue ?? -1,
      playMoveFailed: _playMoveFailed,
      requiredPlayers: decodedResponse['required_players'] ??
          decodedResponse['session_user_status'].length,
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
    final List<LudoSessionUserStatus> sessionUserStatus =
        decodedResponse['session_user_status'].map<LudoSessionUserStatus>(
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
        );
      },
    ).toList();
    if (decodedResponse['required_players'] == 2) {
      sessionUserStatus[2] = sessionUserStatus[1].copyWith(playerId: 2);
      sessionUserStatus[1] =
          sessionUserStatus[1].copyWith(status: 'DUMMY', userId: -1);
      if (sessionUserStatus.length < 4) {
        sessionUserStatus.add(sessionUserStatus[2]
            .copyWith(status: 'DUMMY', playerId: 3, userId: -1));
      } else {
        sessionUserStatus[3] = sessionUserStatus[3]
            .copyWith(status: 'DUMMY', playerId: 3, userId: -1);
      }
    }
    final ludoSession = LudoSessionData(
      id: id,
      status: decodedResponse['status'],
      nextPlayer: decodedResponse['next_player'],
      nonce: decodedResponse['nonce'],
      playAmount: decodedResponse['play_amount'],
      playToken: decodedResponse['play_token'],
      sessionUserStatus: sessionUserStatus,
      nextPlayerId: decodedResponse['next_player_id'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          decodedResponse['created_at'] * 1000),
      creator: "",
      currentDiceValue: -1,
      playMoveFailed: false,
      requiredPlayers: decodedResponse['required_players'] ??
          decodedResponse['session_user_status'].length,
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
            requiredPlayers: sessionData['required_players'] ??
                sessionData['session_user_status'].length,
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
      String amount, int requiredPlayers, String tokenAddress) async {
    final url = Uri.parse(
        '${ref.read(appStateProvider).isSandbox ? baseUrlDebug : baseUrl}/session/create');
    log(jsonEncode({
      'amount': amount,
      'required_players': requiredPlayers,
      'token_address': tokenAddress,
    }));
    final response = await _httpClient!.post(
      url,
      body: jsonEncode({
        'amount': amount,
        'required_players': requiredPlayers.toString(),
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

  Future<void> joinSession(String sessionId) async {
    final url = Uri.parse(
        '${ref.read(appStateProvider).isSandbox ? baseUrlDebug : baseUrl}/session/join');
    final response = await _httpClient!.post(
      url,
      body: jsonEncode({'session_id': sessionId}),
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

  Future<void> requestAISuggestion() async {
    if (state == null) return;

    try {
      final url = Uri.parse(
          '${ref.read(appStateProvider).isSandbox ? baseUrlDebug : baseUrl}/game/session/${state!.id}/ai-suggestion');
      final response = await _httpClient!.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode != 200) {
        throw HttpException('Failed to get AI suggestion');
      }

      final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
      state =
          state!.copyWith(aiSuggestion: AISuggestion.fromJson(decodedResponse));
    } catch (e) {
      debugPrint('Error getting AI suggestion: $e');
      // For now, use mock data for testing
      state = state!.copyWith(
        aiSuggestion: AISuggestion.fromJson({
          "analysis":
              "Player 1 (yellow) is next. Red has one token in the home area, while green has one. Yellow and blue have all tokens on the board. Yellow's tokens are relatively spread out, with one near the starting area. The game is still quite open.",
          "recommendation": {
            "player_id": state!.nextPlayerId,
            "token_id": 0,
            "steps": 4
          },
          "rationale":
              "Assuming a dice roll of 4, moving yellow token 0 (position 15) forward 4 spaces to position 19 is recommended. This advances a token towards the home stretch while keeping it relatively safe from capture. Other yellow tokens are already fairly advanced, and focusing on bringing this token closer to the finish is a sound strategy in the mid-game."
        }),
      );
    }
  }

  void clearAISuggestion() {
    if (state != null) {
      state = state!.copyWith(aiSuggestion: null);
    }
  }
}
