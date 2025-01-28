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
