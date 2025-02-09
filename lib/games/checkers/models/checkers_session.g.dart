// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkers_session.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckersSessionDataImplAdapter
    extends TypeAdapter<_$CheckersSessionDataImpl> {
  @override
  final int typeId = 4;

  @override
  _$CheckersSessionDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$CheckersSessionDataImpl(
      id: fields[0] as String,
      status: fields[1] as String,
      nextPlayer: fields[2] as String,
      sessionUserStatus: (fields[3] as List).cast<CheckersSessionUserStatus>(),
      nextPlayerId: fields[4] as String,
      createdAt: fields[5] as DateTime,
      pieces: (fields[6] as List).cast<CheckersPiece>(),
      isGameOver: fields[7] as bool,
      orangeScore: fields[8] as int,
      blackScore: fields[9] as int,
      message: fields[10] as String?,
      isBlackTurn: fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$CheckersSessionDataImpl obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.nextPlayer)
      ..writeByte(4)
      ..write(obj.nextPlayerId)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.isGameOver)
      ..writeByte(8)
      ..write(obj.orangeScore)
      ..writeByte(9)
      ..write(obj.blackScore)
      ..writeByte(10)
      ..write(obj.message)
      ..writeByte(11)
      ..write(obj.isBlackTurn)
      ..writeByte(3)
      ..write(obj.sessionUserStatus)
      ..writeByte(6)
      ..write(obj.pieces);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckersSessionDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CheckersSessionUserStatusImplAdapter
    extends TypeAdapter<_$CheckersSessionUserStatusImpl> {
  @override
  final int typeId = 5;

  @override
  _$CheckersSessionUserStatusImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$CheckersSessionUserStatusImpl(
      playerId: fields[0] as String,
      userId: fields[1] as String,
      email: fields[2] as String,
      role: fields[3] as String,
      status: fields[4] as String,
      points: fields[5] as int,
      position: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$CheckersSessionUserStatusImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.playerId)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.role)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.points)
      ..writeByte(6)
      ..write(obj.position);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckersSessionUserStatusImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CheckersPieceImplAdapter extends TypeAdapter<_$CheckersPieceImpl> {
  @override
  final int typeId = 6;

  @override
  _$CheckersPieceImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$CheckersPieceImpl(
      sessionId: fields[0] as int,
      row: fields[1] as int,
      col: fields[2] as int,
      player: fields[3] as String,
      position: fields[4] as int,
      isKing: fields[5] as bool,
      isAlive: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$CheckersPieceImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.sessionId)
      ..writeByte(1)
      ..write(obj.row)
      ..writeByte(2)
      ..write(obj.col)
      ..writeByte(3)
      ..write(obj.player)
      ..writeByte(4)
      ..write(obj.position)
      ..writeByte(5)
      ..write(obj.isKing)
      ..writeByte(6)
      ..write(obj.isAlive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckersPieceImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckersSessionDataImpl _$$CheckersSessionDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckersSessionDataImpl(
      id: json['id'] as String,
      status: json['status'] as String,
      nextPlayer: json['nextPlayer'] as String,
      sessionUserStatus: (json['sessionUserStatus'] as List<dynamic>)
          .map((e) =>
              CheckersSessionUserStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPlayerId: json['nextPlayerId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      pieces: (json['pieces'] as List<dynamic>)
          .map((e) => CheckersPiece.fromJson(e as Map<String, dynamic>))
          .toList(),
      isGameOver: json['isGameOver'] as bool,
      orangeScore: (json['orangeScore'] as num).toInt(),
      blackScore: (json['blackScore'] as num).toInt(),
      message: json['message'] as String?,
      isBlackTurn: json['isBlackTurn'] as bool,
    );

Map<String, dynamic> _$$CheckersSessionDataImplToJson(
        _$CheckersSessionDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'nextPlayer': instance.nextPlayer,
      'sessionUserStatus': instance.sessionUserStatus,
      'nextPlayerId': instance.nextPlayerId,
      'createdAt': instance.createdAt.toIso8601String(),
      'pieces': instance.pieces,
      'isGameOver': instance.isGameOver,
      'orangeScore': instance.orangeScore,
      'blackScore': instance.blackScore,
      'message': instance.message,
      'isBlackTurn': instance.isBlackTurn,
    };

_$CheckersSessionUserStatusImpl _$$CheckersSessionUserStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckersSessionUserStatusImpl(
      playerId: json['playerId'] as String,
      userId: json['userId'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      status: json['status'] as String,
      points: (json['points'] as num).toInt(),
      position: json['position'] as String,
    );

Map<String, dynamic> _$$CheckersSessionUserStatusImplToJson(
        _$CheckersSessionUserStatusImpl instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'userId': instance.userId,
      'email': instance.email,
      'role': instance.role,
      'status': instance.status,
      'points': instance.points,
      'position': instance.position,
    };

_$CheckersPieceImpl _$$CheckersPieceImplFromJson(Map<String, dynamic> json) =>
    _$CheckersPieceImpl(
      sessionId: (json['sessionId'] as num).toInt(),
      row: (json['row'] as num).toInt(),
      col: (json['col'] as num).toInt(),
      player: json['player'] as String,
      position: (json['position'] as num).toInt(),
      isKing: json['isKing'] as bool,
      isAlive: json['isAlive'] as bool,
    );

Map<String, dynamic> _$$CheckersPieceImplToJson(_$CheckersPieceImpl instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'row': instance.row,
      'col': instance.col,
      'player': instance.player,
      'position': instance.position,
      'isKing': instance.isKing,
      'isAlive': instance.isAlive,
    };
