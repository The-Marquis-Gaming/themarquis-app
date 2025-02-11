// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AISuggestion _$AISuggestionFromJson(Map<String, dynamic> json) {
  return _AISuggestion.fromJson(json);
}

/// @nodoc
mixin _$AISuggestion {
  String get analysis => throw _privateConstructorUsedError;
  AIRecommendation get recommendation => throw _privateConstructorUsedError;
  String get rationale => throw _privateConstructorUsedError;

  /// Serializes this AISuggestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AISuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AISuggestionCopyWith<AISuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AISuggestionCopyWith<$Res> {
  factory $AISuggestionCopyWith(
          AISuggestion value, $Res Function(AISuggestion) then) =
      _$AISuggestionCopyWithImpl<$Res, AISuggestion>;
  @useResult
  $Res call(
      {String analysis, AIRecommendation recommendation, String rationale});

  $AIRecommendationCopyWith<$Res> get recommendation;
}

/// @nodoc
class _$AISuggestionCopyWithImpl<$Res, $Val extends AISuggestion>
    implements $AISuggestionCopyWith<$Res> {
  _$AISuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AISuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analysis = null,
    Object? recommendation = null,
    Object? rationale = null,
  }) {
    return _then(_value.copyWith(
      analysis: null == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as AIRecommendation,
      rationale: null == rationale
          ? _value.rationale
          : rationale // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of AISuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AIRecommendationCopyWith<$Res> get recommendation {
    return $AIRecommendationCopyWith<$Res>(_value.recommendation, (value) {
      return _then(_value.copyWith(recommendation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AISuggestionImplCopyWith<$Res>
    implements $AISuggestionCopyWith<$Res> {
  factory _$$AISuggestionImplCopyWith(
          _$AISuggestionImpl value, $Res Function(_$AISuggestionImpl) then) =
      __$$AISuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String analysis, AIRecommendation recommendation, String rationale});

  @override
  $AIRecommendationCopyWith<$Res> get recommendation;
}

/// @nodoc
class __$$AISuggestionImplCopyWithImpl<$Res>
    extends _$AISuggestionCopyWithImpl<$Res, _$AISuggestionImpl>
    implements _$$AISuggestionImplCopyWith<$Res> {
  __$$AISuggestionImplCopyWithImpl(
      _$AISuggestionImpl _value, $Res Function(_$AISuggestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AISuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analysis = null,
    Object? recommendation = null,
    Object? rationale = null,
  }) {
    return _then(_$AISuggestionImpl(
      analysis: null == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as AIRecommendation,
      rationale: null == rationale
          ? _value.rationale
          : rationale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AISuggestionImpl implements _AISuggestion {
  _$AISuggestionImpl(
      {required this.analysis,
      required this.recommendation,
      required this.rationale});

  factory _$AISuggestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AISuggestionImplFromJson(json);

  @override
  final String analysis;
  @override
  final AIRecommendation recommendation;
  @override
  final String rationale;

  @override
  String toString() {
    return 'AISuggestion(analysis: $analysis, recommendation: $recommendation, rationale: $rationale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AISuggestionImpl &&
            (identical(other.analysis, analysis) ||
                other.analysis == analysis) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            (identical(other.rationale, rationale) ||
                other.rationale == rationale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, analysis, recommendation, rationale);

  /// Create a copy of AISuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AISuggestionImplCopyWith<_$AISuggestionImpl> get copyWith =>
      __$$AISuggestionImplCopyWithImpl<_$AISuggestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AISuggestionImplToJson(
      this,
    );
  }
}

abstract class _AISuggestion implements AISuggestion {
  factory _AISuggestion(
      {required final String analysis,
      required final AIRecommendation recommendation,
      required final String rationale}) = _$AISuggestionImpl;

  factory _AISuggestion.fromJson(Map<String, dynamic> json) =
      _$AISuggestionImpl.fromJson;

  @override
  String get analysis;
  @override
  AIRecommendation get recommendation;
  @override
  String get rationale;

  /// Create a copy of AISuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AISuggestionImplCopyWith<_$AISuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AIRecommendation _$AIRecommendationFromJson(Map<String, dynamic> json) {
  return _AIRecommendation.fromJson(json);
}

/// @nodoc
mixin _$AIRecommendation {
  int get playerId => throw _privateConstructorUsedError;
  int get tokenId => throw _privateConstructorUsedError;
  int get steps => throw _privateConstructorUsedError;

  /// Serializes this AIRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AIRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AIRecommendationCopyWith<AIRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AIRecommendationCopyWith<$Res> {
  factory $AIRecommendationCopyWith(
          AIRecommendation value, $Res Function(AIRecommendation) then) =
      _$AIRecommendationCopyWithImpl<$Res, AIRecommendation>;
  @useResult
  $Res call({int playerId, int tokenId, int steps});
}

/// @nodoc
class _$AIRecommendationCopyWithImpl<$Res, $Val extends AIRecommendation>
    implements $AIRecommendationCopyWith<$Res> {
  _$AIRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AIRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? tokenId = null,
    Object? steps = null,
  }) {
    return _then(_value.copyWith(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as int,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AIRecommendationImplCopyWith<$Res>
    implements $AIRecommendationCopyWith<$Res> {
  factory _$$AIRecommendationImplCopyWith(_$AIRecommendationImpl value,
          $Res Function(_$AIRecommendationImpl) then) =
      __$$AIRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int playerId, int tokenId, int steps});
}

/// @nodoc
class __$$AIRecommendationImplCopyWithImpl<$Res>
    extends _$AIRecommendationCopyWithImpl<$Res, _$AIRecommendationImpl>
    implements _$$AIRecommendationImplCopyWith<$Res> {
  __$$AIRecommendationImplCopyWithImpl(_$AIRecommendationImpl _value,
      $Res Function(_$AIRecommendationImpl) _then)
      : super(_value, _then);

  /// Create a copy of AIRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? tokenId = null,
    Object? steps = null,
  }) {
    return _then(_$AIRecommendationImpl(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as int,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AIRecommendationImpl implements _AIRecommendation {
  _$AIRecommendationImpl(
      {required this.playerId, required this.tokenId, required this.steps});

  factory _$AIRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AIRecommendationImplFromJson(json);

  @override
  final int playerId;
  @override
  final int tokenId;
  @override
  final int steps;

  @override
  String toString() {
    return 'AIRecommendation(playerId: $playerId, tokenId: $tokenId, steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AIRecommendationImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.steps, steps) || other.steps == steps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playerId, tokenId, steps);

  /// Create a copy of AIRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AIRecommendationImplCopyWith<_$AIRecommendationImpl> get copyWith =>
      __$$AIRecommendationImplCopyWithImpl<_$AIRecommendationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AIRecommendationImplToJson(
      this,
    );
  }
}

abstract class _AIRecommendation implements AIRecommendation {
  factory _AIRecommendation(
      {required final int playerId,
      required final int tokenId,
      required final int steps}) = _$AIRecommendationImpl;

  factory _AIRecommendation.fromJson(Map<String, dynamic> json) =
      _$AIRecommendationImpl.fromJson;

  @override
  int get playerId;
  @override
  int get tokenId;
  @override
  int get steps;

  /// Create a copy of AIRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AIRecommendationImplCopyWith<_$AIRecommendationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
