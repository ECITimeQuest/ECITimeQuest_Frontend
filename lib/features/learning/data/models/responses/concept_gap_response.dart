import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_app/features/learning/data/models/enums/error_type.dart';

part 'concept_gap_response.freezed.dart';
part 'concept_gap_response.g.dart';

@freezed
abstract class ConceptGapResponse with _$ConceptGapResponse {
  const factory ConceptGapResponse({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'topic_id') required String topicId,
    @JsonKey(name: 'topic_name') String? topicName,
    required String concept,
    @JsonKey(name: 'error_type') required ErrorType errorType,
    @JsonKey(name: 'weakness_score') required double weaknessScore,
    @JsonKey(name: 'avg_response_time_ms') int? avgResponseTimeMs,
    @JsonKey(name: 'detected_at') required DateTime detectedAt,
  }) = _ConceptGapResponse;

  factory ConceptGapResponse.fromJson(Map<String, dynamic> json) =>
      _$ConceptGapResponseFromJson(json);
}
