import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'checkers_session.g.dart';
part 'checkers_session.freezed.dart';

@freezed
class CheckersSessionData extends HiveObject with _$CheckersSessionData {
  CheckersSessionData._();

  @HiveType(typeId: 4) // Make sure this ID is unique across your Hive types
  factory CheckersSessionData({
    @HiveField(0) required String id,
    @HiveField(1) required String status,
    @HiveField(2) required String nextPlayer,
    @HiveField(3) required List<CheckersSessionUserStatus> sessionUserStatus,
    @HiveField(4) required String nextPlayerId,
    @HiveField(5) required DateTime createdAt,
    @HiveField(6) required List<CheckersPiece> pieces,
    @HiveField(7) required bool isGameOver,
    @HiveField(8) required int orangeScore,
    @HiveField(9) required int blackScore,
    @HiveField(10) String? message,
  }) = _CheckersSessionData;

  factory CheckersSessionData.fromJson(Map<String, dynamic> json) =>
      _$CheckersSessionDataFromJson(json);
}

@freezed
class CheckersSessionUserStatus extends HiveObject
    with _$CheckersSessionUserStatus {
  CheckersSessionUserStatus._();

  @HiveType(typeId: 5)
  factory CheckersSessionUserStatus({
    @HiveField(0) required String playerId,
    @HiveField(1) required String userId,
    @HiveField(2) required String email,
    @HiveField(3) required String role,
    @HiveField(4) required String status,
    @HiveField(5) required int points,
    @HiveField(6) required String position, // "up" or "down"
  }) = _CheckersSessionUserStatus;

  factory CheckersSessionUserStatus.fromJson(Map<String, dynamic> json) =>
      _$CheckersSessionUserStatusFromJson(json);
}

@freezed
class CheckersPiece extends HiveObject with _$CheckersPiece {
  CheckersPiece._();

  @HiveType(typeId: 6)
  factory CheckersPiece({
    @HiveField(0) required int sessionId,
    @HiveField(1) required int row,
    @HiveField(2) required int col,
    @HiveField(3) required String player,
    @HiveField(4) required int position, // 0 = None, 1 = Up, 2 = Down
    @HiveField(5) required bool isKing,
    @HiveField(6) required bool isAlive,
  }) = _CheckersPiece;

  factory CheckersPiece.fromJson(Map<String, dynamic> json) =>
      _$CheckersPieceFromJson(json);
}
