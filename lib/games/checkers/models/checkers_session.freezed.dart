// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkers_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckersSessionData _$CheckersSessionDataFromJson(Map<String, dynamic> json) {
  return _CheckersSessionData.fromJson(json);
}

/// @nodoc
mixin _$CheckersSessionData {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get status => throw _privateConstructorUsedError;
  @HiveField(2)
  String get nextPlayer => throw _privateConstructorUsedError;
  @HiveField(3)
  List<CheckersSessionUserStatus> get sessionUserStatus =>
      throw _privateConstructorUsedError;
  @HiveField(4)
  String get nextPlayerId => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(6)
  List<CheckersPiece> get pieces => throw _privateConstructorUsedError;
  @HiveField(7)
  bool get isGameOver => throw _privateConstructorUsedError;
  @HiveField(8)
  int get orangeScore => throw _privateConstructorUsedError;
  @HiveField(9)
  int get blackScore => throw _privateConstructorUsedError;
  @HiveField(10)
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this CheckersSessionData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckersSessionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckersSessionDataCopyWith<CheckersSessionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckersSessionDataCopyWith<$Res> {
  factory $CheckersSessionDataCopyWith(
          CheckersSessionData value, $Res Function(CheckersSessionData) then) =
      _$CheckersSessionDataCopyWithImpl<$Res, CheckersSessionData>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String status,
      @HiveField(2) String nextPlayer,
      @HiveField(3) List<CheckersSessionUserStatus> sessionUserStatus,
      @HiveField(4) String nextPlayerId,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) List<CheckersPiece> pieces,
      @HiveField(7) bool isGameOver,
      @HiveField(8) int orangeScore,
      @HiveField(9) int blackScore,
      @HiveField(10) String? message});
}

/// @nodoc
class _$CheckersSessionDataCopyWithImpl<$Res, $Val extends CheckersSessionData>
    implements $CheckersSessionDataCopyWith<$Res> {
  _$CheckersSessionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckersSessionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? nextPlayer = null,
    Object? sessionUserStatus = null,
    Object? nextPlayerId = null,
    Object? createdAt = null,
    Object? pieces = null,
    Object? isGameOver = null,
    Object? orangeScore = null,
    Object? blackScore = null,
    Object? message = freezed,
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
      sessionUserStatus: null == sessionUserStatus
          ? _value.sessionUserStatus
          : sessionUserStatus // ignore: cast_nullable_to_non_nullable
              as List<CheckersSessionUserStatus>,
      nextPlayerId: null == nextPlayerId
          ? _value.nextPlayerId
          : nextPlayerId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pieces: null == pieces
          ? _value.pieces
          : pieces // ignore: cast_nullable_to_non_nullable
              as List<CheckersPiece>,
      isGameOver: null == isGameOver
          ? _value.isGameOver
          : isGameOver // ignore: cast_nullable_to_non_nullable
              as bool,
      orangeScore: null == orangeScore
          ? _value.orangeScore
          : orangeScore // ignore: cast_nullable_to_non_nullable
              as int,
      blackScore: null == blackScore
          ? _value.blackScore
          : blackScore // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckersSessionDataImplCopyWith<$Res>
    implements $CheckersSessionDataCopyWith<$Res> {
  factory _$$CheckersSessionDataImplCopyWith(_$CheckersSessionDataImpl value,
          $Res Function(_$CheckersSessionDataImpl) then) =
      __$$CheckersSessionDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String status,
      @HiveField(2) String nextPlayer,
      @HiveField(3) List<CheckersSessionUserStatus> sessionUserStatus,
      @HiveField(4) String nextPlayerId,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) List<CheckersPiece> pieces,
      @HiveField(7) bool isGameOver,
      @HiveField(8) int orangeScore,
      @HiveField(9) int blackScore,
      @HiveField(10) String? message});
}

/// @nodoc
class __$$CheckersSessionDataImplCopyWithImpl<$Res>
    extends _$CheckersSessionDataCopyWithImpl<$Res, _$CheckersSessionDataImpl>
    implements _$$CheckersSessionDataImplCopyWith<$Res> {
  __$$CheckersSessionDataImplCopyWithImpl(_$CheckersSessionDataImpl _value,
      $Res Function(_$CheckersSessionDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckersSessionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? nextPlayer = null,
    Object? sessionUserStatus = null,
    Object? nextPlayerId = null,
    Object? createdAt = null,
    Object? pieces = null,
    Object? isGameOver = null,
    Object? orangeScore = null,
    Object? blackScore = null,
    Object? message = freezed,
  }) {
    return _then(_$CheckersSessionDataImpl(
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
      sessionUserStatus: null == sessionUserStatus
          ? _value._sessionUserStatus
          : sessionUserStatus // ignore: cast_nullable_to_non_nullable
              as List<CheckersSessionUserStatus>,
      nextPlayerId: null == nextPlayerId
          ? _value.nextPlayerId
          : nextPlayerId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pieces: null == pieces
          ? _value._pieces
          : pieces // ignore: cast_nullable_to_non_nullable
              as List<CheckersPiece>,
      isGameOver: null == isGameOver
          ? _value.isGameOver
          : isGameOver // ignore: cast_nullable_to_non_nullable
              as bool,
      orangeScore: null == orangeScore
          ? _value.orangeScore
          : orangeScore // ignore: cast_nullable_to_non_nullable
              as int,
      blackScore: null == blackScore
          ? _value.blackScore
          : blackScore // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 4)
class _$CheckersSessionDataImpl extends _CheckersSessionData {
  _$CheckersSessionDataImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.status,
      @HiveField(2) required this.nextPlayer,
      @HiveField(3)
      required final List<CheckersSessionUserStatus> sessionUserStatus,
      @HiveField(4) required this.nextPlayerId,
      @HiveField(5) required this.createdAt,
      @HiveField(6) required final List<CheckersPiece> pieces,
      @HiveField(7) required this.isGameOver,
      @HiveField(8) required this.orangeScore,
      @HiveField(9) required this.blackScore,
      @HiveField(10) this.message})
      : _sessionUserStatus = sessionUserStatus,
        _pieces = pieces,
        super._();

  factory _$CheckersSessionDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckersSessionDataImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String status;
  @override
  @HiveField(2)
  final String nextPlayer;
  final List<CheckersSessionUserStatus> _sessionUserStatus;
  @override
  @HiveField(3)
  List<CheckersSessionUserStatus> get sessionUserStatus {
    if (_sessionUserStatus is EqualUnmodifiableListView)
      return _sessionUserStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessionUserStatus);
  }

  @override
  @HiveField(4)
  final String nextPlayerId;
  @override
  @HiveField(5)
  final DateTime createdAt;
  final List<CheckersPiece> _pieces;
  @override
  @HiveField(6)
  List<CheckersPiece> get pieces {
    if (_pieces is EqualUnmodifiableListView) return _pieces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pieces);
  }

  @override
  @HiveField(7)
  final bool isGameOver;
  @override
  @HiveField(8)
  final int orangeScore;
  @override
  @HiveField(9)
  final int blackScore;
  @override
  @HiveField(10)
  final String? message;

  @override
  String toString() {
    return 'CheckersSessionData(id: $id, status: $status, nextPlayer: $nextPlayer, sessionUserStatus: $sessionUserStatus, nextPlayerId: $nextPlayerId, createdAt: $createdAt, pieces: $pieces, isGameOver: $isGameOver, orangeScore: $orangeScore, blackScore: $blackScore, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckersSessionDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.nextPlayer, nextPlayer) ||
                other.nextPlayer == nextPlayer) &&
            const DeepCollectionEquality()
                .equals(other._sessionUserStatus, _sessionUserStatus) &&
            (identical(other.nextPlayerId, nextPlayerId) ||
                other.nextPlayerId == nextPlayerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._pieces, _pieces) &&
            (identical(other.isGameOver, isGameOver) ||
                other.isGameOver == isGameOver) &&
            (identical(other.orangeScore, orangeScore) ||
                other.orangeScore == orangeScore) &&
            (identical(other.blackScore, blackScore) ||
                other.blackScore == blackScore) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      nextPlayer,
      const DeepCollectionEquality().hash(_sessionUserStatus),
      nextPlayerId,
      createdAt,
      const DeepCollectionEquality().hash(_pieces),
      isGameOver,
      orangeScore,
      blackScore,
      message);

  /// Create a copy of CheckersSessionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckersSessionDataImplCopyWith<_$CheckersSessionDataImpl> get copyWith =>
      __$$CheckersSessionDataImplCopyWithImpl<_$CheckersSessionDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckersSessionDataImplToJson(
      this,
    );
  }
}

abstract class _CheckersSessionData extends CheckersSessionData {
  factory _CheckersSessionData(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String status,
      @HiveField(2) required final String nextPlayer,
      @HiveField(3)
      required final List<CheckersSessionUserStatus> sessionUserStatus,
      @HiveField(4) required final String nextPlayerId,
      @HiveField(5) required final DateTime createdAt,
      @HiveField(6) required final List<CheckersPiece> pieces,
      @HiveField(7) required final bool isGameOver,
      @HiveField(8) required final int orangeScore,
      @HiveField(9) required final int blackScore,
      @HiveField(10) final String? message}) = _$CheckersSessionDataImpl;
  _CheckersSessionData._() : super._();

  factory _CheckersSessionData.fromJson(Map<String, dynamic> json) =
      _$CheckersSessionDataImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get status;
  @override
  @HiveField(2)
  String get nextPlayer;
  @override
  @HiveField(3)
  List<CheckersSessionUserStatus> get sessionUserStatus;
  @override
  @HiveField(4)
  String get nextPlayerId;
  @override
  @HiveField(5)
  DateTime get createdAt;
  @override
  @HiveField(6)
  List<CheckersPiece> get pieces;
  @override
  @HiveField(7)
  bool get isGameOver;
  @override
  @HiveField(8)
  int get orangeScore;
  @override
  @HiveField(9)
  int get blackScore;
  @override
  @HiveField(10)
  String? get message;

  /// Create a copy of CheckersSessionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckersSessionDataImplCopyWith<_$CheckersSessionDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckersSessionUserStatus _$CheckersSessionUserStatusFromJson(
    Map<String, dynamic> json) {
  return _CheckersSessionUserStatus.fromJson(json);
}

/// @nodoc
mixin _$CheckersSessionUserStatus {
  @HiveField(0)
  String get playerId => throw _privateConstructorUsedError;
  @HiveField(1)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  String get email => throw _privateConstructorUsedError;
  @HiveField(3)
  String get role => throw _privateConstructorUsedError;
  @HiveField(4)
  String get status => throw _privateConstructorUsedError;
  @HiveField(5)
  int get points => throw _privateConstructorUsedError;
  @HiveField(6)
  String get position => throw _privateConstructorUsedError;

  /// Serializes this CheckersSessionUserStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckersSessionUserStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckersSessionUserStatusCopyWith<CheckersSessionUserStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckersSessionUserStatusCopyWith<$Res> {
  factory $CheckersSessionUserStatusCopyWith(CheckersSessionUserStatus value,
          $Res Function(CheckersSessionUserStatus) then) =
      _$CheckersSessionUserStatusCopyWithImpl<$Res, CheckersSessionUserStatus>;
  @useResult
  $Res call(
      {@HiveField(0) String playerId,
      @HiveField(1) String userId,
      @HiveField(2) String email,
      @HiveField(3) String role,
      @HiveField(4) String status,
      @HiveField(5) int points,
      @HiveField(6) String position});
}

/// @nodoc
class _$CheckersSessionUserStatusCopyWithImpl<$Res,
        $Val extends CheckersSessionUserStatus>
    implements $CheckersSessionUserStatusCopyWith<$Res> {
  _$CheckersSessionUserStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckersSessionUserStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? userId = null,
    Object? email = null,
    Object? role = null,
    Object? status = null,
    Object? points = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
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
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckersSessionUserStatusImplCopyWith<$Res>
    implements $CheckersSessionUserStatusCopyWith<$Res> {
  factory _$$CheckersSessionUserStatusImplCopyWith(
          _$CheckersSessionUserStatusImpl value,
          $Res Function(_$CheckersSessionUserStatusImpl) then) =
      __$$CheckersSessionUserStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String playerId,
      @HiveField(1) String userId,
      @HiveField(2) String email,
      @HiveField(3) String role,
      @HiveField(4) String status,
      @HiveField(5) int points,
      @HiveField(6) String position});
}

/// @nodoc
class __$$CheckersSessionUserStatusImplCopyWithImpl<$Res>
    extends _$CheckersSessionUserStatusCopyWithImpl<$Res,
        _$CheckersSessionUserStatusImpl>
    implements _$$CheckersSessionUserStatusImplCopyWith<$Res> {
  __$$CheckersSessionUserStatusImplCopyWithImpl(
      _$CheckersSessionUserStatusImpl _value,
      $Res Function(_$CheckersSessionUserStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckersSessionUserStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? userId = null,
    Object? email = null,
    Object? role = null,
    Object? status = null,
    Object? points = null,
    Object? position = null,
  }) {
    return _then(_$CheckersSessionUserStatusImpl(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
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
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 5)
class _$CheckersSessionUserStatusImpl extends _CheckersSessionUserStatus {
  _$CheckersSessionUserStatusImpl(
      {@HiveField(0) required this.playerId,
      @HiveField(1) required this.userId,
      @HiveField(2) required this.email,
      @HiveField(3) required this.role,
      @HiveField(4) required this.status,
      @HiveField(5) required this.points,
      @HiveField(6) required this.position})
      : super._();

  factory _$CheckersSessionUserStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckersSessionUserStatusImplFromJson(json);

  @override
  @HiveField(0)
  final String playerId;
  @override
  @HiveField(1)
  final String userId;
  @override
  @HiveField(2)
  final String email;
  @override
  @HiveField(3)
  final String role;
  @override
  @HiveField(4)
  final String status;
  @override
  @HiveField(5)
  final int points;
  @override
  @HiveField(6)
  final String position;

  @override
  String toString() {
    return 'CheckersSessionUserStatus(playerId: $playerId, userId: $userId, email: $email, role: $role, status: $status, points: $points, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckersSessionUserStatusImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, playerId, userId, email, role, status, points, position);

  /// Create a copy of CheckersSessionUserStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckersSessionUserStatusImplCopyWith<_$CheckersSessionUserStatusImpl>
      get copyWith => __$$CheckersSessionUserStatusImplCopyWithImpl<
          _$CheckersSessionUserStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckersSessionUserStatusImplToJson(
      this,
    );
  }
}

abstract class _CheckersSessionUserStatus extends CheckersSessionUserStatus {
  factory _CheckersSessionUserStatus(
          {@HiveField(0) required final String playerId,
          @HiveField(1) required final String userId,
          @HiveField(2) required final String email,
          @HiveField(3) required final String role,
          @HiveField(4) required final String status,
          @HiveField(5) required final int points,
          @HiveField(6) required final String position}) =
      _$CheckersSessionUserStatusImpl;
  _CheckersSessionUserStatus._() : super._();

  factory _CheckersSessionUserStatus.fromJson(Map<String, dynamic> json) =
      _$CheckersSessionUserStatusImpl.fromJson;

  @override
  @HiveField(0)
  String get playerId;
  @override
  @HiveField(1)
  String get userId;
  @override
  @HiveField(2)
  String get email;
  @override
  @HiveField(3)
  String get role;
  @override
  @HiveField(4)
  String get status;
  @override
  @HiveField(5)
  int get points;
  @override
  @HiveField(6)
  String get position;

  /// Create a copy of CheckersSessionUserStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckersSessionUserStatusImplCopyWith<_$CheckersSessionUserStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CheckersPiece _$CheckersPieceFromJson(Map<String, dynamic> json) {
  return _CheckersPiece.fromJson(json);
}

/// @nodoc
mixin _$CheckersPiece {
  @HiveField(0)
  int get sessionId => throw _privateConstructorUsedError;
  @HiveField(1)
  int get row => throw _privateConstructorUsedError;
  @HiveField(2)
  int get col => throw _privateConstructorUsedError;
  @HiveField(3)
  String get player => throw _privateConstructorUsedError;
  @HiveField(4)
  int get position =>
      throw _privateConstructorUsedError; // 0 = None, 1 = Up, 2 = Down
  @HiveField(5)
  bool get isKing => throw _privateConstructorUsedError;
  @HiveField(6)
  bool get isAlive => throw _privateConstructorUsedError;

  /// Serializes this CheckersPiece to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckersPiece
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckersPieceCopyWith<CheckersPiece> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckersPieceCopyWith<$Res> {
  factory $CheckersPieceCopyWith(
          CheckersPiece value, $Res Function(CheckersPiece) then) =
      _$CheckersPieceCopyWithImpl<$Res, CheckersPiece>;
  @useResult
  $Res call(
      {@HiveField(0) int sessionId,
      @HiveField(1) int row,
      @HiveField(2) int col,
      @HiveField(3) String player,
      @HiveField(4) int position,
      @HiveField(5) bool isKing,
      @HiveField(6) bool isAlive});
}

/// @nodoc
class _$CheckersPieceCopyWithImpl<$Res, $Val extends CheckersPiece>
    implements $CheckersPieceCopyWith<$Res> {
  _$CheckersPieceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckersPiece
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? row = null,
    Object? col = null,
    Object? player = null,
    Object? position = null,
    Object? isKing = null,
    Object? isAlive = null,
  }) {
    return _then(_value.copyWith(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as int,
      row: null == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as int,
      col: null == col
          ? _value.col
          : col // ignore: cast_nullable_to_non_nullable
              as int,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      isKing: null == isKing
          ? _value.isKing
          : isKing // ignore: cast_nullable_to_non_nullable
              as bool,
      isAlive: null == isAlive
          ? _value.isAlive
          : isAlive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckersPieceImplCopyWith<$Res>
    implements $CheckersPieceCopyWith<$Res> {
  factory _$$CheckersPieceImplCopyWith(
          _$CheckersPieceImpl value, $Res Function(_$CheckersPieceImpl) then) =
      __$$CheckersPieceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int sessionId,
      @HiveField(1) int row,
      @HiveField(2) int col,
      @HiveField(3) String player,
      @HiveField(4) int position,
      @HiveField(5) bool isKing,
      @HiveField(6) bool isAlive});
}

/// @nodoc
class __$$CheckersPieceImplCopyWithImpl<$Res>
    extends _$CheckersPieceCopyWithImpl<$Res, _$CheckersPieceImpl>
    implements _$$CheckersPieceImplCopyWith<$Res> {
  __$$CheckersPieceImplCopyWithImpl(
      _$CheckersPieceImpl _value, $Res Function(_$CheckersPieceImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckersPiece
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? row = null,
    Object? col = null,
    Object? player = null,
    Object? position = null,
    Object? isKing = null,
    Object? isAlive = null,
  }) {
    return _then(_$CheckersPieceImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as int,
      row: null == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as int,
      col: null == col
          ? _value.col
          : col // ignore: cast_nullable_to_non_nullable
              as int,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      isKing: null == isKing
          ? _value.isKing
          : isKing // ignore: cast_nullable_to_non_nullable
              as bool,
      isAlive: null == isAlive
          ? _value.isAlive
          : isAlive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 6)
class _$CheckersPieceImpl extends _CheckersPiece {
  _$CheckersPieceImpl(
      {@HiveField(0) required this.sessionId,
      @HiveField(1) required this.row,
      @HiveField(2) required this.col,
      @HiveField(3) required this.player,
      @HiveField(4) required this.position,
      @HiveField(5) required this.isKing,
      @HiveField(6) required this.isAlive})
      : super._();

  factory _$CheckersPieceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckersPieceImplFromJson(json);

  @override
  @HiveField(0)
  final int sessionId;
  @override
  @HiveField(1)
  final int row;
  @override
  @HiveField(2)
  final int col;
  @override
  @HiveField(3)
  final String player;
  @override
  @HiveField(4)
  final int position;
// 0 = None, 1 = Up, 2 = Down
  @override
  @HiveField(5)
  final bool isKing;
  @override
  @HiveField(6)
  final bool isAlive;

  @override
  String toString() {
    return 'CheckersPiece(sessionId: $sessionId, row: $row, col: $col, player: $player, position: $position, isKing: $isKing, isAlive: $isAlive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckersPieceImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.row, row) || other.row == row) &&
            (identical(other.col, col) || other.col == col) &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.isKing, isKing) || other.isKing == isKing) &&
            (identical(other.isAlive, isAlive) || other.isAlive == isAlive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, sessionId, row, col, player, position, isKing, isAlive);

  /// Create a copy of CheckersPiece
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckersPieceImplCopyWith<_$CheckersPieceImpl> get copyWith =>
      __$$CheckersPieceImplCopyWithImpl<_$CheckersPieceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckersPieceImplToJson(
      this,
    );
  }
}

abstract class _CheckersPiece extends CheckersPiece {
  factory _CheckersPiece(
      {@HiveField(0) required final int sessionId,
      @HiveField(1) required final int row,
      @HiveField(2) required final int col,
      @HiveField(3) required final String player,
      @HiveField(4) required final int position,
      @HiveField(5) required final bool isKing,
      @HiveField(6) required final bool isAlive}) = _$CheckersPieceImpl;
  _CheckersPiece._() : super._();

  factory _CheckersPiece.fromJson(Map<String, dynamic> json) =
      _$CheckersPieceImpl.fromJson;

  @override
  @HiveField(0)
  int get sessionId;
  @override
  @HiveField(1)
  int get row;
  @override
  @HiveField(2)
  int get col;
  @override
  @HiveField(3)
  String get player;
  @override
  @HiveField(4)
  int get position; // 0 = None, 1 = Up, 2 = Down
  @override
  @HiveField(5)
  bool get isKing;
  @override
  @HiveField(6)
  bool get isAlive;

  /// Create a copy of CheckersPiece
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckersPieceImplCopyWith<_$CheckersPieceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
