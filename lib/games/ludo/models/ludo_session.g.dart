// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ludo_session.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LudoSessionDataImplAdapter extends TypeAdapter<_$LudoSessionDataImpl> {
  @override
  final int typeId = 2;

  @override
  _$LudoSessionDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$LudoSessionDataImpl(
      id: fields[0] as String,
      status: fields[2] as String,
      nextPlayer: fields[3] as String,
      nonce: fields[4] as String,
      color: fields[5] as String,
      playAmount: fields[6] as String,
      playToken: fields[7] as String,
      sessionUserStatus: (fields[8] as List).cast<LudoSessionUserStatus>(),
      nextPlayerId: fields[9] as int,
      creator: fields[10] as String,
      createdAt: fields[11] as DateTime,
      currentDiceValue: fields[12] as int?,
      playMoveFailed: fields[13] as bool?,
      message: fields[14] as String?,
      requiredPlayers: fields[15] as String,
      countdownStartTime: fields[16] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$LudoSessionDataImpl obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.nextPlayer)
      ..writeByte(4)
      ..write(obj.nonce)
      ..writeByte(5)
      ..write(obj.color)
      ..writeByte(6)
      ..write(obj.playAmount)
      ..writeByte(7)
      ..write(obj.playToken)
      ..writeByte(9)
      ..write(obj.nextPlayerId)
      ..writeByte(10)
      ..write(obj.creator)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.currentDiceValue)
      ..writeByte(13)
      ..write(obj.playMoveFailed)
      ..writeByte(14)
      ..write(obj.message)
      ..writeByte(15)
      ..write(obj.requiredPlayers)
      ..writeByte(16)
      ..write(obj.countdownStartTime)
      ..writeByte(8)
      ..write(obj.sessionUserStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LudoSessionDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LudoSessionUserStatusImplAdapter
    extends TypeAdapter<_$LudoSessionUserStatusImpl> {
  @override
  final int typeId = 3;

  @override
  _$LudoSessionUserStatusImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$LudoSessionUserStatusImpl(
      playerId: fields[0] as int,
      playerTokensPosition: (fields[1] as List).cast<String>(),
      playerWinningTokens: (fields[2] as List).cast<bool>(),
      userId: fields[3] as int,
      email: fields[4] as String,
      role: fields[5] as String,
      status: fields[6] as String,
      profileImageUrl: fields[7] as String?,
      points: fields[8] as int,
      playerTokensCircled: (fields[9] as List?)?.cast<bool>(),
      color: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$LudoSessionUserStatusImpl obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.playerId)
      ..writeByte(3)
      ..write(obj.userId)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.role)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.profileImageUrl)
      ..writeByte(8)
      ..write(obj.points)
      ..writeByte(10)
      ..write(obj.color)
      ..writeByte(1)
      ..write(obj.playerTokensPosition)
      ..writeByte(2)
      ..write(obj.playerWinningTokens)
      ..writeByte(9)
      ..write(obj.playerTokensCircled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LudoSessionUserStatusImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LudoSessionDataImpl _$$LudoSessionDataImplFromJson(
        Map<String, dynamic> json) =>
    _$LudoSessionDataImpl(
      id: json['id'] as String,
      status: json['status'] as String,
      nextPlayer: json['nextPlayer'] as String,
      nonce: json['nonce'] as String,
      color: json['color'] as String,
      playAmount: json['playAmount'] as String,
      playToken: json['playToken'] as String,
      sessionUserStatus: (json['sessionUserStatus'] as List<dynamic>)
          .map((e) => LudoSessionUserStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPlayerId: (json['nextPlayerId'] as num).toInt(),
      creator: json['creator'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      currentDiceValue: (json['currentDiceValue'] as num?)?.toInt(),
      playMoveFailed: json['playMoveFailed'] as bool?,
      message: json['message'] as String?,
      requiredPlayers: json['requiredPlayers'] as String? ?? "4",
      countdownStartTime: json['countdownStartTime'] == null
          ? null
          : DateTime.parse(json['countdownStartTime'] as String),
    );

Map<String, dynamic> _$$LudoSessionDataImplToJson(
        _$LudoSessionDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'nextPlayer': instance.nextPlayer,
      'nonce': instance.nonce,
      'color': instance.color,
      'playAmount': instance.playAmount,
      'playToken': instance.playToken,
      'sessionUserStatus': instance.sessionUserStatus,
      'nextPlayerId': instance.nextPlayerId,
      'creator': instance.creator,
      'createdAt': instance.createdAt.toIso8601String(),
      'currentDiceValue': instance.currentDiceValue,
      'playMoveFailed': instance.playMoveFailed,
      'message': instance.message,
      'requiredPlayers': instance.requiredPlayers,
      'countdownStartTime': instance.countdownStartTime?.toIso8601String(),
    };

_$LudoSessionUserStatusImpl _$$LudoSessionUserStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$LudoSessionUserStatusImpl(
      playerId: (json['playerId'] as num).toInt(),
      playerTokensPosition: (json['playerTokensPosition'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      playerWinningTokens: (json['playerWinningTokens'] as List<dynamic>)
          .map((e) => e as bool)
          .toList(),
      userId: (json['userId'] as num).toInt(),
      email: json['email'] as String,
      role: json['role'] as String,
      status: json['status'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      points: (json['points'] as num).toInt(),
      playerTokensCircled: (json['playerTokensCircled'] as List<dynamic>?)
          ?.map((e) => e as bool)
          .toList(),
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$LudoSessionUserStatusImplToJson(
        _$LudoSessionUserStatusImpl instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'playerTokensPosition': instance.playerTokensPosition,
      'playerWinningTokens': instance.playerWinningTokens,
      'userId': instance.userId,
      'email': instance.email,
      'role': instance.role,
      'status': instance.status,
      'profileImageUrl': instance.profileImageUrl,
      'points': instance.points,
      'playerTokensCircled': instance.playerTokensCircled,
      'color': instance.color,
    };
