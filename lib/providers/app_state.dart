import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:marquis_v2/env.dart';
import 'package:marquis_v2/models/app_state.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "app_state.g.dart";

final baseUrl = environment['build'] == 'DEBUG' ? environment['apiUrlDebug'] : environment['apiUrl'];

@Riverpod(keepAlive: true)
class AppState extends _$AppState {
  final Box<AppStateData> _hiveBox;
  Timer? _refreshTokenTimer;
  Timer? _logoutTimer;
  Client? _httpClient;

  AppState({Client? httpClient, Box<AppStateData>? hiveBox})
      : _httpClient = httpClient,
        _hiveBox = hiveBox ?? Hive.box<AppStateData>("appState");

  @override
  AppStateData build() {
    _httpClient ??= Client();
    return _hiveBox.get("appState", defaultValue: AppStateData(autoLoginResult: null))!;
  }

  void changeNavigatorIndex(int newIndex) {
    state = state.copyWith(navigatorIndex: newIndex);
    _hiveBox.put("appState", state);
  }

  void changeTheme(String theme) {
    state = state.copyWith(theme: theme);
    _hiveBox.put("appState", state);
  }

  void selectGame(String? id) {
    state = state.copyWith(
      selectedGame: id,
    );
    _hiveBox.put("appState", state);
  }

  void selectGameSessionId(String? game, String? id) {
    state = state.copyWith(selectedGame: game, selectedGameSessionId: id);
    _hiveBox.put("appState", state);
  }

  void toggleBalanceVisibility() {
    state = state.copyWith(isBalanceVisible: !state.isBalanceVisible);
    _hiveBox.put("isBalanceVisible", state);
  }

  Future<void> login(String email) async {
    final url = Uri.parse('$baseUrl/auth/signin');
    final response = await _httpClient!.post(
      url,
      body: jsonEncode({'email': email}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw HttpException('Request error with status code ${response.statusCode}.\nResponse:${utf8.decode(response.bodyBytes)}');
    }
  }

  Future<void> loginSandbox(String email) async {
    final url = Uri.parse('$baseUrl/auth/signin-sandbox');
    final response = await _httpClient!.post(
      url,
      body: jsonEncode({'email': email}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw HttpException('Request error with status code ${response.statusCode}.\nResponse:${utf8.decode(response.bodyBytes)}');
    }
    final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    final accessTokenExpiryTime = DateTime.now().add(const Duration(hours: 1));
    final refreshTokenExpiryTime = DateTime.now().add(const Duration(days: 1));

    //verify token
    state = state.copyWith(
      accessToken: decodedResponse['access_token'],
      refreshToken: decodedResponse['refresh_token'],
      accessTokenExpiry: accessTokenExpiryTime,
      refreshTokenExpiry: refreshTokenExpiryTime,
      autoLoginResult: true,
    );
    if (_refreshTokenTimer != null) _refreshTokenTimer!.cancel();
    _refreshTokenTimer = Timer(
      state.accessTokenExpiry!.subtract(Duration(minutes: 10)).difference(DateTime.now()),
      () {
        refreshToken();
      },
    );
    if (_logoutTimer != null) _logoutTimer!.cancel();
    _logoutTimer = Timer(
      state.refreshTokenExpiry!.difference(DateTime.now()),
      () {
        logout();
      },
    );
    await _hiveBox.put("appState", state);
    await ref.read(userProvider.notifier).getUser();
  }

  Future<void> signup(String email, String referralCode) async {
    final url = Uri.parse('$baseUrl/auth/signup');
    final response = await _httpClient!.post(
      url,
      body: jsonEncode({'email': email, 'referral_code': referralCode}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw HttpException('Request error with status code ${response.statusCode}.\nResponse:${utf8.decode(response.bodyBytes)}');
    }
  }

  Future<void> signupSandbox(String email) async {
    final url = Uri.parse('$baseUrl/auth/signup-sandbox');
    final response = await _httpClient!.post(
      url,
      body: jsonEncode({
        'email': email,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw HttpException('Request error with status code ${response.statusCode}.\nResponse:${utf8.decode(response.bodyBytes)}');
    }
    final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    //verify token
    state = state.copyWith(
      accessToken: decodedResponse['access_token'],
      refreshToken: decodedResponse['refresh_token'],
      accessTokenExpiry: DateTime.now().add(const Duration(hours: 1)),
      refreshTokenExpiry: DateTime.now().add(const Duration(days: 1)),
      autoLoginResult: true,
    );
    if (_refreshTokenTimer != null) _refreshTokenTimer!.cancel();
    _refreshTokenTimer = Timer(
      state.accessTokenExpiry!.subtract(Duration(minutes: 10)).difference(DateTime.now()),
      () {
        refreshToken();
      },
    );
    if (_logoutTimer != null) _logoutTimer!.cancel();
    _logoutTimer = Timer(
      state.refreshTokenExpiry!.difference(DateTime.now()),
      () {
        logout();
      },
    );
    await _hiveBox.put("appState", state);
    await ref.read(userProvider.notifier).getUser();
  }

  Future<void> verifyCode(String email, String code) async {
    final url = Uri.parse('$baseUrl/auth/verify-code');
    final response = await _httpClient!.post(
      url,
      body: jsonEncode({'email': email, 'code': code}),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw HttpException('Request error with status code ${response.statusCode}.\nResponse:${utf8.decode(response.bodyBytes)}');
    }
    final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    //verify token
    state = state.copyWith(
      accessToken: decodedResponse['access_token'],
      refreshToken: decodedResponse['refresh_token'],
      accessTokenExpiry: DateTime.now().add(const Duration(hours: 1)),
      refreshTokenExpiry: DateTime.now().add(const Duration(days: 1)),
      autoLoginResult: true,
    );
    if (_refreshTokenTimer != null) _refreshTokenTimer!.cancel();
    _refreshTokenTimer = Timer(
      state.accessTokenExpiry!.subtract(Duration(minutes: 10)).difference(DateTime.now()),
      () {
        refreshToken();
      },
    );
    if (_logoutTimer != null) _logoutTimer!.cancel();
    _logoutTimer = Timer(
      state.refreshTokenExpiry!.difference(DateTime.now()),
      () {
        logout();
      },
    );
    await _hiveBox.put("appState", state);
    await ref.read(userProvider.notifier).getUser();
  }

  Future<void> logout() async {
    if (kDebugMode) print("logout");
    await Future.delayed(
      Duration.zero,
      () {
        state = state.copyWith(
          navigatorIndex: 0,
          accessToken: null,
          refreshToken: null,
          selectedGame: null,
          selectedGameSessionId: null,
          autoLoginResult: false,
        );
      },
    );

    _refreshTokenTimer?.cancel();
    _refreshTokenTimer = null;
    _logoutTimer?.cancel();
    _logoutTimer = null;
    ref.read(userProvider.notifier).clearData();
    await _hiveBox.put("appState", state);
  }

  Future<bool> tryAutoLogin() async {
    if (state.accessToken == null || state.accessTokenExpiry == null) {
      // state = state.copyWith(autoLoginResult: false);

      await logout();
      return false;
    }
    if (state.refreshTokenExpiry!.isBefore(DateTime.now())) {
      await logout();
      return false;
    }
    try {
      // await ref.read(userProvider.notifier).getUser();
      await refreshToken();
      // state = state.copyWith(autoLoginResult: true);
      return true;
    } catch (e) {
      await logout();

      // state = state.copyWith(autoLoginResult: true);
      return false;
    }
  }

  void setConnectivity(bool val) {
    state = state.copyWith(isConnectedInternet: val);
  }

  // void setAutoLogin(bool val) {
  //   state = state.copyWith(autoLoginResult: val);
  // }

  Future<void> refreshToken([int tries = 1]) async {
    const int maxRetries = 3;
    const Duration retryDelay = Duration(seconds: 5);

    while (tries <= maxRetries) {
      try {
        final url = Uri.parse('$baseUrl/auth/refresh');
        final response = await _httpClient!.post(
          url,
          body: jsonEncode({'refresh_token': state.refreshToken}),
          headers: {'Content-Type': 'application/json', 'Authorization': state.bearerToken},
        );

        if (response.statusCode != 201 && response.statusCode != 200) {
          throw HttpException('Request error with status code ${response.statusCode}.\nResponse:${utf8.decode(response.bodyBytes)}');
        }

        final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
        // Verify token
        state = state.copyWith(
          accessToken: decodedResponse['access_token'],
          refreshToken: decodedResponse['refresh_token'],
          accessTokenExpiry: DateTime.now().add(const Duration(hours: 1)),
          refreshTokenExpiry: DateTime.now().add(const Duration(days: 1)),
          autoLoginResult: true,
        );

        if (_refreshTokenTimer != null) _refreshTokenTimer!.cancel();
        _refreshTokenTimer = Timer(
          state.accessTokenExpiry!.subtract(Duration(minutes: 10)).difference(DateTime.now()),
          () {
            refreshToken();
          },
        );

        if (_logoutTimer != null) _logoutTimer!.cancel();
        _logoutTimer = Timer(state.refreshTokenExpiry!.difference(DateTime.now()), logout);

        await _hiveBox.put("appState", state);
        await ref.read(userProvider.notifier).getUser();
        return;
      } catch (e) {
        if (tries == maxRetries) {
          throw Exception("Failed to refresh token after $maxRetries attempts");
        }
        await Future.delayed(retryDelay);
        tries++;
      }
    }
  }

  // Future<void> requestChangePassword(String email) async {
  //   await ref.read(natsServiceProvider.notifier).makeMicroserviceRequest(
  //         "auth.requestChangePassword",
  //         jsonEncode({
  //           "email": email,
  //         }),
  //         isAuth: true,
  //       );
  // }
}
