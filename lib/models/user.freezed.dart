// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get email => throw _privateConstructorUsedError;
  @HiveField(2)
  String get role => throw _privateConstructorUsedError;
  @HiveField(3)
  String get status => throw _privateConstructorUsedError;
  @HiveField(4)
  int get points => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get referredBy => throw _privateConstructorUsedError;
  @HiveField(6)
  int get referralId => throw _privateConstructorUsedError;
  @HiveField(7)
  int get walletId => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get profileImageUrl => throw _privateConstructorUsedError;
  @HiveField(9)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(10)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @HiveField(11)
  String get referralCode => throw _privateConstructorUsedError;
  @HiveField(12)
  String get accountAddress => throw _privateConstructorUsedError;
  @HiveField(13)
  String? get sessionId => throw _privateConstructorUsedError;

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String email,
      @HiveField(2) String role,
      @HiveField(3) String status,
      @HiveField(4) int points,
      @HiveField(5) String? referredBy,
      @HiveField(6) int referralId,
      @HiveField(7) int walletId,
      @HiveField(8) String? profileImageUrl,
      @HiveField(9) DateTime createdAt,
      @HiveField(10) DateTime updatedAt,
      @HiveField(11) String referralCode,
      @HiveField(12) String accountAddress,
      @HiveField(13) String? sessionId});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? role = null,
    Object? status = null,
    Object? points = null,
    Object? referredBy = freezed,
    Object? referralId = null,
    Object? walletId = null,
    Object? profileImageUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? referralCode = null,
    Object? accountAddress = null,
    Object? sessionId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      referredBy: freezed == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      referralId: null == referralId
          ? _value.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as int,
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      accountAddress: null == accountAddress
          ? _value.accountAddress
          : accountAddress // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
          _$UserDataImpl value, $Res Function(_$UserDataImpl) then) =
      __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String email,
      @HiveField(2) String role,
      @HiveField(3) String status,
      @HiveField(4) int points,
      @HiveField(5) String? referredBy,
      @HiveField(6) int referralId,
      @HiveField(7) int walletId,
      @HiveField(8) String? profileImageUrl,
      @HiveField(9) DateTime createdAt,
      @HiveField(10) DateTime updatedAt,
      @HiveField(11) String referralCode,
      @HiveField(12) String accountAddress,
      @HiveField(13) String? sessionId});
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
      _$UserDataImpl _value, $Res Function(_$UserDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? role = null,
    Object? status = null,
    Object? points = null,
    Object? referredBy = freezed,
    Object? referralId = null,
    Object? walletId = null,
    Object? profileImageUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? referralCode = null,
    Object? accountAddress = null,
    Object? sessionId = freezed,
  }) {
    return _then(_$UserDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      referredBy: freezed == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      referralId: null == referralId
          ? _value.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as int,
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      accountAddress: null == accountAddress
          ? _value.accountAddress
          : accountAddress // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1)
class _$UserDataImpl extends _UserData {
  _$UserDataImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.email,
      @HiveField(2) required this.role,
      @HiveField(3) required this.status,
      @HiveField(4) required this.points,
      @HiveField(5) required this.referredBy,
      @HiveField(6) required this.referralId,
      @HiveField(7) required this.walletId,
      @HiveField(8) required this.profileImageUrl,
      @HiveField(9) required this.createdAt,
      @HiveField(10) required this.updatedAt,
      @HiveField(11) required this.referralCode,
      @HiveField(12) required this.accountAddress,
      @HiveField(13) required this.sessionId})
      : super._();

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String email;
  @override
  @HiveField(2)
  final String role;
  @override
  @HiveField(3)
  final String status;
  @override
  @HiveField(4)
  final int points;
  @override
  @HiveField(5)
  final String? referredBy;
  @override
  @HiveField(6)
  final int referralId;
  @override
  @HiveField(7)
  final int walletId;
  @override
  @HiveField(8)
  final String? profileImageUrl;
  @override
  @HiveField(9)
  final DateTime createdAt;
  @override
  @HiveField(10)
  final DateTime updatedAt;
  @override
  @HiveField(11)
  final String referralCode;
  @override
  @HiveField(12)
  final String accountAddress;
  @override
  @HiveField(13)
  final String? sessionId;

  @override
  String toString() {
    return 'UserData(id: $id, email: $email, role: $role, status: $status, points: $points, referredBy: $referredBy, referralId: $referralId, walletId: $walletId, profileImageUrl: $profileImageUrl, createdAt: $createdAt, updatedAt: $updatedAt, referralCode: $referralCode, accountAddress: $accountAddress, sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.referredBy, referredBy) ||
                other.referredBy == referredBy) &&
            (identical(other.referralId, referralId) ||
                other.referralId == referralId) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.accountAddress, accountAddress) ||
                other.accountAddress == accountAddress) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      role,
      status,
      points,
      referredBy,
      referralId,
      walletId,
      profileImageUrl,
      createdAt,
      updatedAt,
      referralCode,
      accountAddress,
      sessionId);

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(
      this,
    );
  }
}

abstract class _UserData extends UserData {
  factory _UserData(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String email,
      @HiveField(2) required final String role,
      @HiveField(3) required final String status,
      @HiveField(4) required final int points,
      @HiveField(5) required final String? referredBy,
      @HiveField(6) required final int referralId,
      @HiveField(7) required final int walletId,
      @HiveField(8) required final String? profileImageUrl,
      @HiveField(9) required final DateTime createdAt,
      @HiveField(10) required final DateTime updatedAt,
      @HiveField(11) required final String referralCode,
      @HiveField(12) required final String accountAddress,
      @HiveField(13) required final String? sessionId}) = _$UserDataImpl;
  _UserData._() : super._();

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get email;
  @override
  @HiveField(2)
  String get role;
  @override
  @HiveField(3)
  String get status;
  @override
  @HiveField(4)
  int get points;
  @override
  @HiveField(5)
  String? get referredBy;
  @override
  @HiveField(6)
  int get referralId;
  @override
  @HiveField(7)
  int get walletId;
  @override
  @HiveField(8)
  String? get profileImageUrl;
  @override
  @HiveField(9)
  DateTime get createdAt;
  @override
  @HiveField(10)
  DateTime get updatedAt;
  @override
  @HiveField(11)
  String get referralCode;
  @override
  @HiveField(12)
  String get accountAddress;
  @override
  @HiveField(13)
  String? get sessionId;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
