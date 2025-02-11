import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_suggestion.freezed.dart';
part 'ai_suggestion.g.dart';

@freezed
class AISuggestion with _$AISuggestion {
  factory AISuggestion({
    required String analysis,
    required AIRecommendation recommendation,
    required String rationale,
  }) = _AISuggestion;

  factory AISuggestion.fromJson(Map<String, dynamic> json) =>
      _$AISuggestionFromJson(json);
}

@freezed
class AIRecommendation with _$AIRecommendation {
  factory AIRecommendation({
    required int playerId,
    required int tokenId,
    required int steps,
  }) = _AIRecommendation;

  factory AIRecommendation.fromJson(Map<String, dynamic> json) =>
      _$AIRecommendationFromJson(json);
}
