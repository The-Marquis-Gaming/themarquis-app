// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_suggestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AISuggestionImpl _$$AISuggestionImplFromJson(Map<String, dynamic> json) =>
    _$AISuggestionImpl(
      analysis: json['analysis'] as String,
      recommendation: AIRecommendation.fromJson(
          json['recommendation'] as Map<String, dynamic>),
      rationale: json['rationale'] as String,
    );

Map<String, dynamic> _$$AISuggestionImplToJson(_$AISuggestionImpl instance) =>
    <String, dynamic>{
      'analysis': instance.analysis,
      'recommendation': instance.recommendation,
      'rationale': instance.rationale,
    };

_$AIRecommendationImpl _$$AIRecommendationImplFromJson(
        Map<String, dynamic> json) =>
    _$AIRecommendationImpl(
      playerId: (json['playerId'] as num).toInt(),
      tokenId: (json['tokenId'] as num).toInt(),
      steps: (json['steps'] as num).toInt(),
    );

Map<String, dynamic> _$$AIRecommendationImplToJson(
        _$AIRecommendationImpl instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'tokenId': instance.tokenId,
      'steps': instance.steps,
    };
