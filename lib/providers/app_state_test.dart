import 'package:marquis_v2/models/app_state.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/providers/user.dart';

class AppStateTest extends AppState {
  AppStateTest() : super();

  @override
  AppStateData build() {
    return AppStateData(autoLoginResult: false);
  }

  @override
  Future<void> login(String email) async {
    state = state.copyWith(
      accessToken: "testToken",
      refreshToken: "testRefreshToken",
      accessTokenExpiry: DateTime.now().add(
        const Duration(days: 1),
      ),
      refreshTokenExpiry: DateTime.now().add(
        const Duration(days: 1),
      ),
    );
  }

  @override
  Future<void> loginSandbox(String email) async {
    state = state.copyWith(
      accessToken: "testToken",
      refreshToken: "testRefreshToken",
      accessTokenExpiry: DateTime.now().add(
        const Duration(days: 1),
      ),
      refreshTokenExpiry: DateTime.now().add(
        const Duration(days: 1),
      ),
    );
    ref.read(userProvider.notifier).getUser();
  }

  @override
  void selectGameSessionId(String? game, String? id) {
    state = state.copyWith(selectedGame: game, selectedGameSessionId: id);
  }

  @override
  Future<void> refreshToken([int tries = 1]) async {
    return;
  }

  @override
  Future<bool> tryAutoLogin() async {
    return false;
  }

  @override
  Future<void> logout() async {
    state = state.copyWith(accessToken: null, refreshToken: null);
  }
}
