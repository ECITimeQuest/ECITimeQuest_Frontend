import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_app/features/content/data/models/historical_event.dart';
import 'package:flutter_app/features/content/data/models/historical_figure.dart';
import 'package:flutter_app/features/learning/data/models/quiz_question.dart';

part 'ia_task_data.freezed.dart';
part 'ia_task_data.g.dart';

@Freezed(unionKey: 'task_type')
sealed class IATaskData with _$IATaskData {
  const IATaskData._();

  @FreezedUnionValue('content_expansion')
  const factory IATaskData.expandedContentResponse({
    required String summary,
    @JsonKey(name: 'key_facts') required List<String> keyFacts,
    @JsonKey(name: 'fun_fact') required String funFact,
    @Default([]) List<HistoricalEvent> events,
    @Default([]) List<HistoricalFigure> figures,
  }) = ExpandedContentResponse;

  @FreezedUnionValue('quiz_generation')
  const factory IATaskData.quizResponse({
    required List<QuizQuestion> questions,
  }) = QuizResponse;

  @FreezedUnionValue('answer_explanation')
  const factory IATaskData.answerExplanationResponse({
    required String explanation,
    @JsonKey(name: 'key_concept') required String keyConcept,
    required String tip,
  }) = AnswerExplanationResponse;

  @FreezedUnionValue('gap_analysis')
  const factory IATaskData.gapAnalysisResponse({
    required String concept,
    required String explanation,
    required String severity,
  }) = GapAnalysisResponse;

  factory IATaskData.fromJson(Map<String, dynamic> json) = _$IATaskDataFromJson;
  static IATaskData parseApiData(Map<String, dynamic> json) {
    // If the JSON contains a 'content' field, flatten it so the fields
    // match the ExpandedContentResponse factory above.
    // We also make sure not to lose 'task_type'.
    if (json.containsKey('content') &&
        json['content'] is Map<String, dynamic>) {
      final inner = json['content'] as Map<String, dynamic>;
      final flat = Map<String, dynamic>.from(json);
      flat.addAll(inner);
      flat.remove('content');
      return IATaskData.fromJson(flat);
    }
    return IATaskData.fromJson(json);
  }
}
