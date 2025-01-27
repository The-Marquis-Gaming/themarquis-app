import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'ludo_session.g.dart';
part 'ludo_session.freezed.dart';

const playerColors = {
  // Add this const
  'red': Color(0xffd04c2f),
  'blue': Color(0xff2fa9d0),
  'green': Color(0xff2fd06f),
  'yellow': Color(0xffb0d02f),
};

@freezed
class LudoSessionData extends HiveObject with _$LudoSessionData {
  LudoSessionData._();

  @HiveType(typeId: 2)
  factory LudoSessionData({
    @HiveField(0) required String id,
    @HiveField(2) required String status,
    @HiveField(3) required String nextPlayer,
    @HiveField(4) required String nonce,
    @HiveField(5) required String color,
    @HiveField(6) required String playAmount,
    @HiveField(7) required String playToken,
    @HiveField(8) required List<LudoSessionUserStatus> sessionUserStatus,
    @HiveField(9) required int nextPlayerId,
    @HiveField(10) required String creator,
    @HiveField(11) required DateTime createdAt,
    @HiveField(12) int? currentDiceValue,
    @HiveField(13) bool? playMoveFailed,
    @HiveField(14) String? message,
    @HiveField(15) @Default("4") String requiredPlayers,
  }) = _LudoSessionData;

  List<Color> get getListOfColors => sessionUserStatus
      .map((user) => playerColors[user.color] ?? Colors.grey)
      .toList();
//find index of that color
//sub list, [0, target][target, 3]
//return it
  int get nextPlayerIndex =>
      sessionUserStatus.indexWhere((user) => user.playerId == nextPlayerId);

  List<String> get notAvailableColors => sessionUserStatus
      .where((pl) => pl.status == "ACTIVE")
      .toList()
      .map((e) => e.color!)
      .toList();

  factory LudoSessionData.fromJson(Map<String, dynamic> json) =>
      _$LudoSessionDataFromJson(json);
}

@freezed
class LudoSessionUserStatus extends HiveObject with _$LudoSessionUserStatus {
  LudoSessionUserStatus._();

  @HiveType(typeId: 3)
  factory LudoSessionUserStatus({
    @HiveField(0) required int playerId,
    @HiveField(1) required List<String> playerTokensPosition,
    @HiveField(2) required List<bool> playerWinningTokens,
    @HiveField(3) required int userId,
    @HiveField(4) required String email,
    @HiveField(5) required String role,
    @HiveField(6) required String status,
    @HiveField(7) String? profileImageUrl,
    @HiveField(8) required int points,
    @HiveField(9) required List<bool>? playerTokensCircled,
    @HiveField(10) required String? color,
  }) = _LudoSessionUserStatus;

  factory LudoSessionUserStatus.fromJson(Map<String, dynamic> json) =>
      _$LudoSessionUserStatusFromJson(json);
}
