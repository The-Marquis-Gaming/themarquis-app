// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ludo_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LudoSessionData _$LudoSessionDataFromJson(Map<String, dynamic> json) {
  return _LudoSessionData.fromJson(json);
}

/// @nodoc
mixin _$LudoSessionData {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get status => throw _privateConstructorUsedError;
  @HiveField(3)
  String get nextPlayer => throw _privateConstructorUsedError;
  @HiveField(4)
  String get nonce => throw _privateConstructorUsedError;
  @HiveField(5)
  String get color => throw _privateConstructorUsedError;
  @HiveField(6)
  String get playAmount => throw _privateConstructorUsedError;
  @HiveField(7)
  String get playToken => throw _privateConstructorUsedError;
  @HiveField(8)
  List<LudoSessionUserStatus> get sessionUserStatus =>
      throw _privateConstructorUsedError;
  @HiveField(9)
  int get nextPlayerId => throw _privateConstructorUsedError;
  @HiveField(10)
  String get creator => throw _privateConstructorUsedError;
  @HiveField(11)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(12)
  int? get currentDiceValue => throw _privateConstructorUsedError;
  @HiveField(13)
  bool? get playMoveFailed => throw _privateConstructorUsedError;
  @HiveField(14)
  String? get message => throw _privateConstructorUsedError;
  @HiveField(15)
  String get requiredPlayers => throw _privateConstructorUsedError;
  @HiveField(16)
  DateTime? get countdownStartTime => throw _privateConstructorUsedError;

  /// Serializes this LudoSessionData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LudoSessionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LudoSessionDataCopyWith<LudoSessionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LudoSessionDataCopyWith<$Res> {
  factory $LudoSessionDataCopyWith(
          LudoSessionData value, $Res Function(LudoSessionData) then) =
      _$LudoSessionDataCopyWithImpl<$Res, LudoSessionData>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(2) String status,
      @HiveField(3) String nextPlayer,
      @HiveField(4) String nonce,
      @HiveField(5) String color,
      @HiveField(6) String playAmount,
      @HiveField(7) String playToken,
      @HiveField(8) List<LudoSessionUserStatus> sessionUserStatus,
      @HiveField(9) int nextPlayerId,
      @HiveField(10) String creator,
      @HiveField(11) DateTime createdAt,
      @HiveField(12) int? currentDiceValue,
      @HiveField(13) bool? playMoveFailed,
      @HiveField(14) String? message,
      @HiveField(15) String requiredPlayers,
      @HiveField(16) DateTime? countdownStartTime});
}

/// @nodoc
class _$LudoSessionDataCopyWithImpl<$Res, $Val extends LudoSessionData>
    implements $LudoSessionDataCopyWith<$Res> {
  _$LudoSessionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LudoSessionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? nextPlayer = null,
    Object? nonce = null,
    Object? color = null,
    Object? playAmount = null,
    Object? playToken = null,
    Object? sessionUserStatus = null,
    Object? nextPlayerId = null,
    Object? creator = null,
    Object? createdAt = null,
    Object? currentDiceValue = freezed,
    Object? playMoveFailed = freezed,
    Object? message = freezed,
    Object? requiredPlayers = null,
    Object? countdownStartTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      nextPlayer: null == nextPlayer
          ? _value.nextPlayer
          : nextPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      nonce: null == nonce
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      playAmount: null == playAmount
          ? _value.playAmount
          : playAmount // ignore: cast_nullable_to_non_nullable
              as String,
      playToken: null == playToken
          ? _value.playToken
          : playToken // ignore: cast_nullable_to_non_nullable
              as String,
      sessionUserStatus: null == sessionUserStatus
          ? _value.sessionUserStatus
          : sessionUserStatus // ignore: cast_nullable_to_non_nullable
              as List<LudoSessionUserStatus>,
      nextPlayerId: null == nextPlayerId
          ? _value.nextPlayerId
          : nextPlayerId // ignore: cast_nullable_to_non_nullable
              as int,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentDiceValue: freezed == currentDiceValue
          ? _value.currentDiceValue
          : currentDiceValue // ignore: cast_nullable_to_non_nullable
              as int?,
      playMoveFailed: freezed == playMoveFailed
          ? _value.playMoveFailed
          : playMoveFailed // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredPlayers: null == requiredPlayers
          ? _value.requiredPlayers
          : requiredPlayers // ignore: cast_nullable_to_non_nullable
              as String,
      countdownStartTime: freezed == countdownStartTime
          ? _value.countdownStartTime
          : countdownStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LudoSessionDataImplCopyWith<$Res>
    implements $LudoSessionDataCopyWith<$Res> {
  factory _$$LudoSessionDataImplCopyWith(_$LudoSessionDataImpl value,
          $Res Function(_$LudoSessionDataImpl) then) =
      __$$LudoSessionDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(2) String status,
      @HiveField(3) String nextPlayer,
      @HiveField(4) String nonce,
      @HiveField(5) String color,
      @HiveField(6) String playAmount,
      @HiveField(7) String playToken,
      @HiveField(8) List<LudoSessionUserStatus> sessionUserStatus,
      @HiveField(9) int nextPlayerId,
      @HiveField(10) String creator,
      @HiveField(11) DateTime createdAt,
      @HiveField(12) int? currentDiceValue,
      @HiveField(13) bool? playMoveFailed,
      @HiveField(14) String? message,
      @HiveField(15) String requiredPlayers,
      @HiveField(16) DateTime? countdownStartTime});
}

/// @nodoc
class __$$LudoSessionDataImplCopyWithImpl<$Res>
    extends _$LudoSessionDataCopyWithImpl<$Res, _$LudoSessionDataImpl>
    implements _$$LudoSessionDataImplCopyWith<$Res> {
  __$$LudoSessionDataImplCopyWithImpl(
      _$LudoSessionDataImpl _value, $Res Function(_$LudoSessionDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of LudoSessionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? nextPlayer = null,
    Object? nonce = null,
    Object? color = null,
    Object? playAmount = null,
    Object? playToken = null,
    Object? sessionUserStatus = null,
    Object? nextPlayerId = null,
    Object? creator = null,
    Object? createdAt = null,
    Object? currentDiceValue = freezed,
    Object? playMoveFailed = freezed,
    Object? message = freezed,
    Object? requiredPlayers = null,
    Object? countdownStartTime = freezed,
  }) {
    return _then(_$LudoSessionDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      nextPlayer: null == nextPlayer
          ? _value.nextPlayer
          : nextPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      nonce: null == nonce
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      playAmount: null == playAmount
          ? _value.playAmount
          : playAmount // ignore: cast_nullable_to_non_nullable
              as String,
      playToken: null == playToken
          ? _value.playToken
          : playToken // ignore: cast_nullable_to_non_nullable
              as String,
      sessionUserStatus: null == sessionUserStatus
          ? _value._sessionUserStatus
          : sessionUserStatus // ignore: cast_nullable_to_non_nullable
              as List<LudoSessionUserStatus>,
      nextPlayerId: null == nextPlayerId
          ? _value.nextPlayerId
          : nextPlayerId // ignore: cast_nullable_to_non_nullable
              as int,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentDiceValue: freezed == currentDiceValue
          ? _value.currentDiceValue
          : currentDiceValue // ignore: cast_nullable_to_non_nullable
              as int?,
      playMoveFailed: freezed == playMoveFailed
          ? _value.playMoveFailed
          : playMoveFailed // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredPlayers: null == requiredPlayers
          ? _value.requiredPlayers
          : requiredPlayers // ignore: cast_nullable_to_non_nullable
              as String,
      countdownStartTime: freezed == countdownStartTime
          ? _value.countdownStartTime
          : countdownStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2)
class _$LudoSessionDataImpl extends _LudoSessionData {
  _$LudoSessionDataImpl(
      {@HiveField(0) required this.id,
      @HiveField(2) required this.status,
      @HiveField(3) required this.nextPlayer,
      @HiveField(4) required this.nonce,
      @HiveField(5) required this.color,
      @HiveField(6) required this.playAmount,
      @HiveField(7) required this.playToken,
      @HiveField(8)
      required final List<LudoSessionUserStatus> sessionUserStatus,
      @HiveField(9) required this.nextPlayerId,
      @HiveField(10) required this.creator,
      @HiveField(11) required this.createdAt,
      @HiveField(12) this.currentDiceValue,
      @HiveField(13) this.playMoveFailed,
      @HiveField(14) this.message,
      @HiveField(15) this.requiredPlayers = "4",
      @HiveField(16) this.countdownStartTime})
      : _sessionUserStatus = sessionUserStatus,
        super._();

  factory _$LudoSessionDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LudoSessionDataImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(2)
  final String status;
  @override
  @HiveField(3)
  final String nextPlayer;
  @override
  @HiveField(4)
  final String nonce;
  @override
  @HiveField(5)
  final String color;
  @override
  @HiveField(6)
  final String playAmount;
  @override
  @HiveField(7)
  final String playToken;
  final List<LudoSessionUserStatus> _sessionUserStatus;
  @override
  @HiveField(8)
  List<LudoSessionUserStatus> get sessionUserStatus {
    if (_sessionUserStatus is EqualUnmodifiableListView)
      return _sessionUserStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessionUserStatus);
  }

  @override
  @HiveField(9)
  final int nextPlayerId;
  @override
  @HiveField(10)
  final String creator;
  @override
  @HiveField(11)
  final DateTime createdAt;
  @override
  @HiveField(12)
  final int? currentDiceValue;
  @override
  @HiveField(13)
  final bool? playMoveFailed;
  @override
  @HiveField(14)
  final String? message;
  @override
  @JsonKey()
  @HiveField(15)
  final String requiredPlayers;
  @override
  @HiveField(16)
  final DateTime? countdownStartTime;

  @override
  String toString() {
    return 'LudoSessionData(id: $id, status: $status, nextPlayer: $nextPlayer, nonce: $nonce, color: $color, playAmount: $playAmount, playToken: $playToken, sessionUserStatus: $sessionUserStatus, nextPlayerId: $nextPlayerId, creator: $creator, createdAt: $createdAt, currentDiceValue: $currentDiceValue, playMoveFailed: $playMoveFailed, message: $message, requiredPlayers: $requiredPlayers, countdownStartTime: $countdownStartTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LudoSessionDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.nextPlayer, nextPlayer) ||
                other.nextPlayer == nextPlayer) &&
            (identical(other.nonce, nonce) || other.nonce == nonce) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.playAmount, playAmount) ||
                other.playAmount == playAmount) &&
            (identical(other.playToken, playToken) ||
                other.playToken == playToken) &&
            const DeepCollectionEquality()
                .equals(other._sessionUserStatus, _sessionUserStatus) &&
            (identical(other.nextPlayerId, nextPlayerId) ||
                other.nextPlayerId == nextPlayerId) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.currentDiceValue, currentDiceValue) ||
                other.currentDiceValue == currentDiceValue) &&
            (identical(other.playMoveFailed, playMoveFailed) ||
                other.playMoveFailed == playMoveFailed) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requiredPlayers, requiredPlayers) ||
                other.requiredPlayers == requiredPlayers) &&
            (identical(other.countdownStartTime, countdownStartTime) ||
                other.countdownStartTime == countdownStartTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      nextPlayer,
      nonce,
      color,
      playAmount,
      playToken,
      const DeepCollectionEquality().hash(_sessionUserStatus),
      nextPlayerId,
      creator,
      createdAt,
      currentDiceValue,
      playMoveFailed,
      message,
      requiredPlayers,
      countdownStartTime);

  /// Create a copy of LudoSessionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LudoSessionDataImplCopyWith<_$LudoSessionDataImpl> get copyWith =>
      __$$LudoSessionDataImplCopyWithImpl<_$LudoSessionDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LudoSessionDataImplToJson(
      this,
    );
  }
}

abstract class _LudoSessionData extends LudoSessionData {
  factory _LudoSessionData(
          {@HiveField(0) required final String id,
          @HiveField(2) required final String status,
          @HiveField(3) required final String nextPlayer,
          @HiveField(4) required final String nonce,
          @HiveField(5) required final String color,
          @HiveField(6) required final String playAmount,
          @HiveField(7) required final String playToken,
          @HiveField(8)
          required final List<LudoSessionUserStatus> sessionUserStatus,
          @HiveField(9) required final int nextPlayerId,
          @HiveField(10) required final String creator,
          @HiveField(11) required final DateTime createdAt,
          @HiveField(12) final int? currentDiceValue,
          @HiveField(13) final bool? playMoveFailed,
          @HiveField(14) final String? message,
          @HiveField(15) final String requiredPlayers,
          @HiveField(16) final DateTime? countdownStartTime}) =
      _$LudoSessionDataImpl;
  _LudoSessionData._() : super._();

  factory _LudoSessionData.fromJson(Map<String, dynamic> json) =
      _$LudoSessionDataImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(2)
  String get status;
  @override
  @HiveField(3)
  String get nextPlayer;
  @override
  @HiveField(4)
  String get nonce;
  @override
  @HiveField(5)
  String get color;
  @override
  @HiveField(6)
  String get playAmount;
  @override
  @HiveField(7)
  String get playToken;
  @override
  @HiveField(8)
  List<LudoSessionUserStatus> get sessionUserStatus;
  @override
  @HiveField(9)
  int get nextPlayerId;
  @override
  @HiveField(10)
  String get creator;
  @override
  @HiveField(11)
  DateTime get createdAt;
  @override
  @HiveField(12)
  int? get currentDiceValue;
  @override
  @HiveField(13)
  bool? get playMoveFailed;
  @override
  @HiveField(14)
  String? get message;
  @override
  @HiveField(15)
  String get requiredPlayers;
  @override
  @HiveField(16)
  DateTime? get countdownStartTime;

  /// Create a copy of LudoSessionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LudoSessionDataImplCopyWith<_$LudoSessionDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LudoSessionUserStatus _$LudoSessionUserStatusFromJson(
    Map<String, dynamic> json) {
  return _LudoSessionUserStatus.fromJson(json);
}

/// @nodoc
mixin _$LudoSessionUserStatus {
  @HiveField(0)
  int get playerId => throw _privateConstructorUsedError;
  @HiveField(1)
  List<String> get playerTokensPosition => throw _privateConstructorUsedError;
  @HiveField(2)
  List<bool> get playerWinningTokens => throw _privateConstructorUsedError;
  @HiveField(3)
  int get userId => throw _privateConstructorUsedError;
  @HiveField(4)
  String get email => throw _privateConstructorUsedError;
  @HiveField(5)
  String get role => throw _privateConstructorUsedError;
  @HiveField(6)
  String get status => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get profileImageUrl => throw _privateConstructorUsedError;
  @HiveField(8)
  int get points => throw _privateConstructorUsedError;
  @HiveField(9)
  List<bool>? get playerTokensCircled => throw _privateConstructorUsedError;
  @HiveField(10)
  String? get color => throw _privateConstructorUsedError;

  /// Serializes this LudoSessionUserStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LudoSessionUserStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LudoSessionUserStatusCopyWith<LudoSessionUserStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LudoSessionUserStatusCopyWith<$Res> {
  factory $LudoSessionUserStatusCopyWith(LudoSessionUserStatus value,
          $Res Function(LudoSessionUserStatus) then) =
      _$LudoSessionUserStatusCopyWithImpl<$Res, LudoSessionUserStatus>;
  @useResult
  $Res call(
      {@HiveField(0) int playerId,
      @HiveField(1) List<String> playerTokensPosition,
      @HiveField(2) List<bool> playerWinningTokens,
      @HiveField(3) int userId,
      @HiveField(4) String email,
      @HiveField(5) String role,
      @HiveField(6) String status,
      @HiveField(7) String? profileImageUrl,
      @HiveField(8) int points,
      @HiveField(9) List<bool>? playerTokensCircled,
      @HiveField(10) String? color});
}

/// @nodoc
class _$LudoSessionUserStatusCopyWithImpl<$Res,
        $Val extends LudoSessionUserStatus>
    implements $LudoSessionUserStatusCopyWith<$Res> {
  _$LudoSessionUserStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LudoSessionUserStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? playerTokensPosition = null,
    Object? playerWinningTokens = null,
    Object? userId = null,
    Object? email = null,
    Object? role = null,
    Object? status = null,
    Object? profileImageUrl = freezed,
    Object? points = null,
    Object? playerTokensCircled = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
      playerTokensPosition: null == playerTokensPosition
          ? _value.playerTokensPosition
          : playerTokensPosition // ignore: cast_nullable_to_non_nullable
              as List<String>,
      playerWinningTokens: null == playerWinningTokens
          ? _value.playerWinningTokens
          : playerWinningTokens // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      playerTokensCircled: freezed == playerTokensCircled
          ? _value.playerTokensCircled
          : playerTokensCircled // ignore: cast_nullable_to_non_nullable
              as List<bool>?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LudoSessionUserStatusImplCopyWith<$Res>
    implements $LudoSessionUserStatusCopyWith<$Res> {
  factory _$$LudoSessionUserStatusImplCopyWith(
          _$LudoSessionUserStatusImpl value,
          $Res Function(_$LudoSessionUserStatusImpl) then) =
      __$$LudoSessionUserStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int playerId,
      @HiveField(1) List<String> playerTokensPosition,
      @HiveField(2) List<bool> playerWinningTokens,
      @HiveField(3) int userId,
      @HiveField(4) String email,
      @HiveField(5) String role,
      @HiveField(6) String status,
      @HiveField(7) String? profileImageUrl,
      @HiveField(8) int points,
      @HiveField(9) List<bool>? playerTokensCircled,
      @HiveField(10) String? color});
}

/// @nodoc
class __$$LudoSessionUserStatusImplCopyWithImpl<$Res>
    extends _$LudoSessionUserStatusCopyWithImpl<$Res,
        _$LudoSessionUserStatusImpl>
    implements _$$LudoSessionUserStatusImplCopyWith<$Res> {
  __$$LudoSessionUserStatusImplCopyWithImpl(_$LudoSessionUserStatusImpl _value,
      $Res Function(_$LudoSessionUserStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of LudoSessionUserStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? playerTokensPosition = null,
    Object? playerWinningTokens = null,
    Object? userId = null,
    Object? email = null,
    Object? role = null,
    Object? status = null,
    Object? profileImageUrl = freezed,
    Object? points = null,
    Object? playerTokensCircled = freezed,
    Object? color = freezed,
  }) {
    return _then(_$LudoSessionUserStatusImpl(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
      playerTokensPosition: null == playerTokensPosition
          ? _value._playerTokensPosition
          : playerTokensPosition // ignore: cast_nullable_to_non_nullable
              as List<String>,
      playerWinningTokens: null == playerWinningTokens
          ? _value._playerWinningTokens
          : playerWinningTokens // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      playerTokensCircled: freezed == playerTokensCircled
          ? _value._playerTokensCircled
          : playerTokensCircled // ignore: cast_nullable_to_non_nullable
              as List<bool>?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 3)
class _$LudoSessionUserStatusImpl extends _LudoSessionUserStatus {
  _$LudoSessionUserStatusImpl(
      {@HiveField(0) required this.playerId,
      @HiveField(1) required final List<String> playerTokensPosition,
      @HiveField(2) required final List<bool> playerWinningTokens,
      @HiveField(3) required this.userId,
      @HiveField(4) required this.email,
      @HiveField(5) required this.role,
      @HiveField(6) required this.status,
      @HiveField(7) this.profileImageUrl,
      @HiveField(8) required this.points,
      @HiveField(9) required final List<bool>? playerTokensCircled,
      @HiveField(10) required this.color})
      : _playerTokensPosition = playerTokensPosition,
        _playerWinningTokens = playerWinningTokens,
        _playerTokensCircled = playerTokensCircled,
        super._();

  factory _$LudoSessionUserStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$LudoSessionUserStatusImplFromJson(json);

  @override
  @HiveField(0)
  final int playerId;
  final List<String> _playerTokensPosition;
  @override
  @HiveField(1)
  List<String> get playerTokensPosition {
    if (_playerTokensPosition is EqualUnmodifiableListView)
      return _playerTokensPosition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerTokensPosition);
  }

  final List<bool> _playerWinningTokens;
  @override
  @HiveField(2)
  List<bool> get playerWinningTokens {
    if (_playerWinningTokens is EqualUnmodifiableListView)
      return _playerWinningTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerWinningTokens);
  }

  @override
  @HiveField(3)
  final int userId;
  @override
  @HiveField(4)
  final String email;
  @override
  @HiveField(5)
  final String role;
  @override
  @HiveField(6)
  final String status;
  @override
  @HiveField(7)
  final String? profileImageUrl;
  @override
  @HiveField(8)
  final int points;
  final List<bool>? _playerTokensCircled;
  @override
  @HiveField(9)
  List<bool>? get playerTokensCircled {
    final value = _playerTokensCircled;
    if (value == null) return null;
    if (_playerTokensCircled is EqualUnmodifiableListView)
      return _playerTokensCircled;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(10)
  final String? color;

  @override
  String toString() {
    return 'LudoSessionUserStatus(playerId: $playerId, playerTokensPosition: $playerTokensPosition, playerWinningTokens: $playerWinningTokens, userId: $userId, email: $email, role: $role, status: $status, profileImageUrl: $profileImageUrl, points: $points, playerTokensCircled: $playerTokensCircled, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LudoSessionUserStatusImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            const DeepCollectionEquality()
                .equals(other._playerTokensPosition, _playerTokensPosition) &&
            const DeepCollectionEquality()
                .equals(other._playerWinningTokens, _playerWinningTokens) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.points, points) || other.points == points) &&
            const DeepCollectionEquality()
                .equals(other._playerTokensCircled, _playerTokensCircled) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      playerId,
      const DeepCollectionEquality().hash(_playerTokensPosition),
      const DeepCollectionEquality().hash(_playerWinningTokens),
      userId,
      email,
      role,
      status,
      profileImageUrl,
      points,
      const DeepCollectionEquality().hash(_playerTokensCircled),
      color);

  /// Create a copy of LudoSessionUserStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LudoSessionUserStatusImplCopyWith<_$LudoSessionUserStatusImpl>
      get copyWith => __$$LudoSessionUserStatusImplCopyWithImpl<
          _$LudoSessionUserStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LudoSessionUserStatusImplToJson(
      this,
    );
  }
}

abstract class _LudoSessionUserStatus extends LudoSessionUserStatus {
  factory _LudoSessionUserStatus(
          {@HiveField(0) required final int playerId,
          @HiveField(1) required final List<String> playerTokensPosition,
          @HiveField(2) required final List<bool> playerWinningTokens,
          @HiveField(3) required final int userId,
          @HiveField(4) required final String email,
          @HiveField(5) required final String role,
          @HiveField(6) required final String status,
          @HiveField(7) final String? profileImageUrl,
          @HiveField(8) required final int points,
          @HiveField(9) required final List<bool>? playerTokensCircled,
          @HiveField(10) required final String? color}) =
      _$LudoSessionUserStatusImpl;
  _LudoSessionUserStatus._() : super._();

  factory _LudoSessionUserStatus.fromJson(Map<String, dynamic> json) =
      _$LudoSessionUserStatusImpl.fromJson;

  @override
  @HiveField(0)
  int get playerId;
  @override
  @HiveField(1)
  List<String> get playerTokensPosition;
  @override
  @HiveField(2)
  List<bool> get playerWinningTokens;
  @override
  @HiveField(3)
  int get userId;
  @override
  @HiveField(4)
  String get email;
  @override
  @HiveField(5)
  String get role;
  @override
  @HiveField(6)
  String get status;
  @override
  @HiveField(7)
  String? get profileImageUrl;
  @override
  @HiveField(8)
  int get points;
  @override
  @HiveField(9)
  List<bool>? get playerTokensCircled;
  @override
  @HiveField(10)
  String? get color;

  /// Create a copy of LudoSessionUserStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LudoSessionUserStatusImplCopyWith<_$LudoSessionUserStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}
