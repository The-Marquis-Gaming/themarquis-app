// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppStateData {
  @HiveField(0)
  int get navigatorIndex => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get accessToken => throw _privateConstructorUsedError;
  @HiveField(2)
  String get theme => throw _privateConstructorUsedError;
  @HiveField(3)
  bool? get autoLoginResult => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get isConnectedInternet => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get selectedGame => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get refreshToken => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime? get accessTokenExpiry => throw _privateConstructorUsedError;
  @HiveField(8)
  DateTime? get refreshTokenExpiry => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get selectedGameSessionId => throw _privateConstructorUsedError;
  @HiveField(10)
  bool get isBalanceVisible => throw _privateConstructorUsedError;
  @HiveField(11)
  bool get isSandbox => throw _privateConstructorUsedError;

  /// Create a copy of AppStateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateDataCopyWith<AppStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateDataCopyWith<$Res> {
  factory $AppStateDataCopyWith(
          AppStateData value, $Res Function(AppStateData) then) =
      _$AppStateDataCopyWithImpl<$Res, AppStateData>;
  @useResult
  $Res call(
      {@HiveField(0) int navigatorIndex,
      @HiveField(1) String? accessToken,
      @HiveField(2) String theme,
      @HiveField(3) bool? autoLoginResult,
      @HiveField(4) bool isConnectedInternet,
      @HiveField(5) String? selectedGame,
      @HiveField(6) String? refreshToken,
      @HiveField(7) DateTime? accessTokenExpiry,
      @HiveField(8) DateTime? refreshTokenExpiry,
      @HiveField(9) String? selectedGameSessionId,
      @HiveField(10) bool isBalanceVisible,
      @HiveField(11) bool isSandbox});
}

/// @nodoc
class _$AppStateDataCopyWithImpl<$Res, $Val extends AppStateData>
    implements $AppStateDataCopyWith<$Res> {
  _$AppStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppStateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navigatorIndex = null,
    Object? accessToken = freezed,
    Object? theme = null,
    Object? autoLoginResult = freezed,
    Object? isConnectedInternet = null,
    Object? selectedGame = freezed,
    Object? refreshToken = freezed,
    Object? accessTokenExpiry = freezed,
    Object? refreshTokenExpiry = freezed,
    Object? selectedGameSessionId = freezed,
    Object? isBalanceVisible = null,
    Object? isSandbox = null,
  }) {
    return _then(_value.copyWith(
      navigatorIndex: null == navigatorIndex
          ? _value.navigatorIndex
          : navigatorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      autoLoginResult: freezed == autoLoginResult
          ? _value.autoLoginResult
          : autoLoginResult // ignore: cast_nullable_to_non_nullable
              as bool?,
      isConnectedInternet: null == isConnectedInternet
          ? _value.isConnectedInternet
          : isConnectedInternet // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedGame: freezed == selectedGame
          ? _value.selectedGame
          : selectedGame // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessTokenExpiry: freezed == accessTokenExpiry
          ? _value.accessTokenExpiry
          : accessTokenExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      refreshTokenExpiry: freezed == refreshTokenExpiry
          ? _value.refreshTokenExpiry
          : refreshTokenExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedGameSessionId: freezed == selectedGameSessionId
          ? _value.selectedGameSessionId
          : selectedGameSessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      isBalanceVisible: null == isBalanceVisible
          ? _value.isBalanceVisible
          : isBalanceVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isSandbox: null == isSandbox
          ? _value.isSandbox
          : isSandbox // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppStateDataImplCopyWith<$Res>
    implements $AppStateDataCopyWith<$Res> {
  factory _$$AppStateDataImplCopyWith(
          _$AppStateDataImpl value, $Res Function(_$AppStateDataImpl) then) =
      __$$AppStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int navigatorIndex,
      @HiveField(1) String? accessToken,
      @HiveField(2) String theme,
      @HiveField(3) bool? autoLoginResult,
      @HiveField(4) bool isConnectedInternet,
      @HiveField(5) String? selectedGame,
      @HiveField(6) String? refreshToken,
      @HiveField(7) DateTime? accessTokenExpiry,
      @HiveField(8) DateTime? refreshTokenExpiry,
      @HiveField(9) String? selectedGameSessionId,
      @HiveField(10) bool isBalanceVisible,
      @HiveField(11) bool isSandbox});
}

/// @nodoc
class __$$AppStateDataImplCopyWithImpl<$Res>
    extends _$AppStateDataCopyWithImpl<$Res, _$AppStateDataImpl>
    implements _$$AppStateDataImplCopyWith<$Res> {
  __$$AppStateDataImplCopyWithImpl(
      _$AppStateDataImpl _value, $Res Function(_$AppStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppStateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navigatorIndex = null,
    Object? accessToken = freezed,
    Object? theme = null,
    Object? autoLoginResult = freezed,
    Object? isConnectedInternet = null,
    Object? selectedGame = freezed,
    Object? refreshToken = freezed,
    Object? accessTokenExpiry = freezed,
    Object? refreshTokenExpiry = freezed,
    Object? selectedGameSessionId = freezed,
    Object? isBalanceVisible = null,
    Object? isSandbox = null,
  }) {
    return _then(_$AppStateDataImpl(
      navigatorIndex: null == navigatorIndex
          ? _value.navigatorIndex
          : navigatorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      autoLoginResult: freezed == autoLoginResult
          ? _value.autoLoginResult
          : autoLoginResult // ignore: cast_nullable_to_non_nullable
              as bool?,
      isConnectedInternet: null == isConnectedInternet
          ? _value.isConnectedInternet
          : isConnectedInternet // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedGame: freezed == selectedGame
          ? _value.selectedGame
          : selectedGame // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessTokenExpiry: freezed == accessTokenExpiry
          ? _value.accessTokenExpiry
          : accessTokenExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      refreshTokenExpiry: freezed == refreshTokenExpiry
          ? _value.refreshTokenExpiry
          : refreshTokenExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedGameSessionId: freezed == selectedGameSessionId
          ? _value.selectedGameSessionId
          : selectedGameSessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      isBalanceVisible: null == isBalanceVisible
          ? _value.isBalanceVisible
          : isBalanceVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isSandbox: null == isSandbox
          ? _value.isSandbox
          : isSandbox // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0)
class _$AppStateDataImpl extends _AppStateData {
  _$AppStateDataImpl(
      {@HiveField(0) this.navigatorIndex = 0,
      @HiveField(1) this.accessToken,
      @HiveField(2) this.theme = "system",
      @HiveField(3) this.autoLoginResult,
      @HiveField(4) this.isConnectedInternet = false,
      @HiveField(5) this.selectedGame,
      @HiveField(6) this.refreshToken,
      @HiveField(7) this.accessTokenExpiry,
      @HiveField(8) this.refreshTokenExpiry,
      @HiveField(9) this.selectedGameSessionId,
      @HiveField(10) this.isBalanceVisible = false,
      @HiveField(11) this.isSandbox = false})
      : super._();

  @override
  @JsonKey()
  @HiveField(0)
  final int navigatorIndex;
  @override
  @HiveField(1)
  final String? accessToken;
  @override
  @JsonKey()
  @HiveField(2)
  final String theme;
  @override
  @HiveField(3)
  final bool? autoLoginResult;
  @override
  @JsonKey()
  @HiveField(4)
  final bool isConnectedInternet;
  @override
  @HiveField(5)
  final String? selectedGame;
  @override
  @HiveField(6)
  final String? refreshToken;
  @override
  @HiveField(7)
  final DateTime? accessTokenExpiry;
  @override
  @HiveField(8)
  final DateTime? refreshTokenExpiry;
  @override
  @HiveField(9)
  final String? selectedGameSessionId;
  @override
  @JsonKey()
  @HiveField(10)
  final bool isBalanceVisible;
  @override
  @JsonKey()
  @HiveField(11)
  final bool isSandbox;

  @override
  String toString() {
    return 'AppStateData(navigatorIndex: $navigatorIndex, accessToken: $accessToken, theme: $theme, autoLoginResult: $autoLoginResult, isConnectedInternet: $isConnectedInternet, selectedGame: $selectedGame, refreshToken: $refreshToken, accessTokenExpiry: $accessTokenExpiry, refreshTokenExpiry: $refreshTokenExpiry, selectedGameSessionId: $selectedGameSessionId, isBalanceVisible: $isBalanceVisible, isSandbox: $isSandbox)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateDataImpl &&
            (identical(other.navigatorIndex, navigatorIndex) ||
                other.navigatorIndex == navigatorIndex) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.autoLoginResult, autoLoginResult) ||
                other.autoLoginResult == autoLoginResult) &&
            (identical(other.isConnectedInternet, isConnectedInternet) ||
                other.isConnectedInternet == isConnectedInternet) &&
            (identical(other.selectedGame, selectedGame) ||
                other.selectedGame == selectedGame) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.accessTokenExpiry, accessTokenExpiry) ||
                other.accessTokenExpiry == accessTokenExpiry) &&
            (identical(other.refreshTokenExpiry, refreshTokenExpiry) ||
                other.refreshTokenExpiry == refreshTokenExpiry) &&
            (identical(other.selectedGameSessionId, selectedGameSessionId) ||
                other.selectedGameSessionId == selectedGameSessionId) &&
            (identical(other.isBalanceVisible, isBalanceVisible) ||
                other.isBalanceVisible == isBalanceVisible) &&
            (identical(other.isSandbox, isSandbox) ||
                other.isSandbox == isSandbox));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      navigatorIndex,
      accessToken,
      theme,
      autoLoginResult,
      isConnectedInternet,
      selectedGame,
      refreshToken,
      accessTokenExpiry,
      refreshTokenExpiry,
      selectedGameSessionId,
      isBalanceVisible,
      isSandbox);

  /// Create a copy of AppStateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateDataImplCopyWith<_$AppStateDataImpl> get copyWith =>
      __$$AppStateDataImplCopyWithImpl<_$AppStateDataImpl>(this, _$identity);
}

abstract class _AppStateData extends AppStateData {
  factory _AppStateData(
      {@HiveField(0) final int navigatorIndex,
      @HiveField(1) final String? accessToken,
      @HiveField(2) final String theme,
      @HiveField(3) final bool? autoLoginResult,
      @HiveField(4) final bool isConnectedInternet,
      @HiveField(5) final String? selectedGame,
      @HiveField(6) final String? refreshToken,
      @HiveField(7) final DateTime? accessTokenExpiry,
      @HiveField(8) final DateTime? refreshTokenExpiry,
      @HiveField(9) final String? selectedGameSessionId,
      @HiveField(10) final bool isBalanceVisible,
      @HiveField(11) final bool isSandbox}) = _$AppStateDataImpl;
  _AppStateData._() : super._();

  @override
  @HiveField(0)
  int get navigatorIndex;
  @override
  @HiveField(1)
  String? get accessToken;
  @override
  @HiveField(2)
  String get theme;
  @override
  @HiveField(3)
  bool? get autoLoginResult;
  @override
  @HiveField(4)
  bool get isConnectedInternet;
  @override
  @HiveField(5)
  String? get selectedGame;
  @override
  @HiveField(6)
  String? get refreshToken;
  @override
  @HiveField(7)
  DateTime? get accessTokenExpiry;
  @override
  @HiveField(8)
  DateTime? get refreshTokenExpiry;
  @override
  @HiveField(9)
  String? get selectedGameSessionId;
  @override
  @HiveField(10)
  bool get isBalanceVisible;
  @override
  @HiveField(11)
  bool get isSandbox;

  /// Create a copy of AppStateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateDataImplCopyWith<_$AppStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
