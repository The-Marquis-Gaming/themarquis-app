import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part "app_state.freezed.dart";
part "app_state.g.dart";

@freezed
class AppStateData extends HiveObject with _$AppStateData {
  AppStateData._();

  @HiveType(typeId: 0)
  factory AppStateData({
    @HiveField(0) @Default(0) int navigatorIndex,
    @HiveField(1) String? accessToken,
    @HiveField(2) @Default("system") String theme,
    @HiveField(3) bool? autoLoginResult,
    @HiveField(4) @Default(false) bool isConnectedInternet,
    @HiveField(5) String? selectedGame,
    @HiveField(6) String? refreshToken,
    @HiveField(7) DateTime? accessTokenExpiry,
    @HiveField(8) DateTime? refreshTokenExpiry,
    @HiveField(9) String? selectedGameSessionId,
    @HiveField(10) @Default(false) bool isBalanceVisible,
    @HiveField(11) @Default(false) bool isSandbox,
  }) = _AppStateData;

  String get bearerToken => accessToken == null ? '' : 'Bearer $accessToken';

  bool get isAuth => accessToken != null;
}
