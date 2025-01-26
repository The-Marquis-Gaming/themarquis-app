// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'starknet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StarknetProviderData {
  JsonRpcProvider get provider => throw _privateConstructorUsedError;
  Account? get signerAccount => throw _privateConstructorUsedError;

  /// Create a copy of StarknetProviderData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StarknetProviderDataCopyWith<StarknetProviderData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StarknetProviderDataCopyWith<$Res> {
  factory $StarknetProviderDataCopyWith(StarknetProviderData value,
          $Res Function(StarknetProviderData) then) =
      _$StarknetProviderDataCopyWithImpl<$Res, StarknetProviderData>;
  @useResult
  $Res call({JsonRpcProvider provider, Account? signerAccount});
}

/// @nodoc
class _$StarknetProviderDataCopyWithImpl<$Res,
        $Val extends StarknetProviderData>
    implements $StarknetProviderDataCopyWith<$Res> {
  _$StarknetProviderDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StarknetProviderData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
    Object? signerAccount = freezed,
  }) {
    return _then(_value.copyWith(
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as JsonRpcProvider,
      signerAccount: freezed == signerAccount
          ? _value.signerAccount
          : signerAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StarknetProviderDataImplCopyWith<$Res>
    implements $StarknetProviderDataCopyWith<$Res> {
  factory _$$StarknetProviderDataImplCopyWith(_$StarknetProviderDataImpl value,
          $Res Function(_$StarknetProviderDataImpl) then) =
      __$$StarknetProviderDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({JsonRpcProvider provider, Account? signerAccount});
}

/// @nodoc
class __$$StarknetProviderDataImplCopyWithImpl<$Res>
    extends _$StarknetProviderDataCopyWithImpl<$Res, _$StarknetProviderDataImpl>
    implements _$$StarknetProviderDataImplCopyWith<$Res> {
  __$$StarknetProviderDataImplCopyWithImpl(_$StarknetProviderDataImpl _value,
      $Res Function(_$StarknetProviderDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of StarknetProviderData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
    Object? signerAccount = freezed,
  }) {
    return _then(_$StarknetProviderDataImpl(
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as JsonRpcProvider,
      signerAccount: freezed == signerAccount
          ? _value.signerAccount
          : signerAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
    ));
  }
}

/// @nodoc

class _$StarknetProviderDataImpl implements _StarknetProviderData {
  _$StarknetProviderDataImpl({required this.provider, this.signerAccount});

  @override
  final JsonRpcProvider provider;
  @override
  final Account? signerAccount;

  @override
  String toString() {
    return 'StarknetProviderData(provider: $provider, signerAccount: $signerAccount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StarknetProviderDataImpl &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.signerAccount, signerAccount) ||
                other.signerAccount == signerAccount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, provider, signerAccount);

  /// Create a copy of StarknetProviderData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StarknetProviderDataImplCopyWith<_$StarknetProviderDataImpl>
      get copyWith =>
          __$$StarknetProviderDataImplCopyWithImpl<_$StarknetProviderDataImpl>(
              this, _$identity);
}

abstract class _StarknetProviderData implements StarknetProviderData {
  factory _StarknetProviderData(
      {required final JsonRpcProvider provider,
      final Account? signerAccount}) = _$StarknetProviderDataImpl;

  @override
  JsonRpcProvider get provider;
  @override
  Account? get signerAccount;

  /// Create a copy of StarknetProviderData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StarknetProviderDataImplCopyWith<_$StarknetProviderDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Piece {
  int get sessionId => throw _privateConstructorUsedError;
  int get row => throw _privateConstructorUsedError;
  int get col => throw _privateConstructorUsedError;
  String get player => throw _privateConstructorUsedError;
  int get position =>
      throw _privateConstructorUsedError; // 0 = None, 1 = Up, 2 = Down
  bool get isKing => throw _privateConstructorUsedError;
  bool get isAlive => throw _privateConstructorUsedError;

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PieceCopyWith<Piece> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PieceCopyWith<$Res> {
  factory $PieceCopyWith(Piece value, $Res Function(Piece) then) =
      _$PieceCopyWithImpl<$Res, Piece>;
  @useResult
  $Res call(
      {int sessionId,
      int row,
      int col,
      String player,
      int position,
      bool isKing,
      bool isAlive});
}

/// @nodoc
class _$PieceCopyWithImpl<$Res, $Val extends Piece>
    implements $PieceCopyWith<$Res> {
  _$PieceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Piece
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
abstract class _$$PieceImplCopyWith<$Res> implements $PieceCopyWith<$Res> {
  factory _$$PieceImplCopyWith(
          _$PieceImpl value, $Res Function(_$PieceImpl) then) =
      __$$PieceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int sessionId,
      int row,
      int col,
      String player,
      int position,
      bool isKing,
      bool isAlive});
}

/// @nodoc
class __$$PieceImplCopyWithImpl<$Res>
    extends _$PieceCopyWithImpl<$Res, _$PieceImpl>
    implements _$$PieceImplCopyWith<$Res> {
  __$$PieceImplCopyWithImpl(
      _$PieceImpl _value, $Res Function(_$PieceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Piece
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
    return _then(_$PieceImpl(
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

class _$PieceImpl implements _Piece {
  _$PieceImpl(
      {required this.sessionId,
      required this.row,
      required this.col,
      required this.player,
      required this.position,
      required this.isKing,
      required this.isAlive});

  @override
  final int sessionId;
  @override
  final int row;
  @override
  final int col;
  @override
  final String player;
  @override
  final int position;
// 0 = None, 1 = Up, 2 = Down
  @override
  final bool isKing;
  @override
  final bool isAlive;

  @override
  String toString() {
    return 'Piece(sessionId: $sessionId, row: $row, col: $col, player: $player, position: $position, isKing: $isKing, isAlive: $isAlive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PieceImpl &&
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

  @override
  int get hashCode => Object.hash(
      runtimeType, sessionId, row, col, player, position, isKing, isAlive);

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PieceImplCopyWith<_$PieceImpl> get copyWith =>
      __$$PieceImplCopyWithImpl<_$PieceImpl>(this, _$identity);
}

abstract class _Piece implements Piece {
  factory _Piece(
      {required final int sessionId,
      required final int row,
      required final int col,
      required final String player,
      required final int position,
      required final bool isKing,
      required final bool isAlive}) = _$PieceImpl;

  @override
  int get sessionId;
  @override
  int get row;
  @override
  int get col;
  @override
  String get player;
  @override
  int get position; // 0 = None, 1 = Up, 2 = Down
  @override
  bool get isKing;
  @override
  bool get isAlive;

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PieceImplCopyWith<_$PieceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
