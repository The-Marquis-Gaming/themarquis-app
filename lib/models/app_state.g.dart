// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppStateDataImplAdapter extends TypeAdapter<_$AppStateDataImpl> {
  @override
  final int typeId = 0;

  @override
  _$AppStateDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$AppStateDataImpl(
      navigatorIndex: fields[0] as int,
      accessToken: fields[1] as String?,
      theme: fields[2] as String,
      autoLoginResult: fields[3] as bool?,
      isConnectedInternet: fields[4] as bool,
      selectedGame: fields[5] as String?,
      refreshToken: fields[6] as String?,
      accessTokenExpiry: fields[7] as DateTime?,
      refreshTokenExpiry: fields[8] as DateTime?,
      selectedGameSessionId: fields[9] as String?,
      isBalanceVisible: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$AppStateDataImpl obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.navigatorIndex)
      ..writeByte(1)
      ..write(obj.accessToken)
      ..writeByte(2)
      ..write(obj.theme)
      ..writeByte(3)
      ..write(obj.autoLoginResult)
      ..writeByte(4)
      ..write(obj.isConnectedInternet)
      ..writeByte(5)
      ..write(obj.selectedGame)
      ..writeByte(6)
      ..write(obj.refreshToken)
      ..writeByte(7)
      ..write(obj.accessTokenExpiry)
      ..writeByte(8)
      ..write(obj.refreshTokenExpiry)
      ..writeByte(9)
      ..write(obj.selectedGameSessionId)
      ..writeByte(10)
      ..write(obj.isBalanceVisible);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppStateDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
