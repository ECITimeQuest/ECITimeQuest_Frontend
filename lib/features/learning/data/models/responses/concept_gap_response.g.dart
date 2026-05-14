// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concept_gap_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConceptGapResponse _$ConceptGapResponseFromJson(Map<String, dynamic> json) =>
    _ConceptGapResponse(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      topicId: json['topic_id'] as String,
      topicName: json['topic_name'] as String?,
      concept: json['concept'] as String,
      errorType: $enumDecode(_$ErrorTypeEnumMap, json['error_type']),
      weaknessScore: (json['weakness_score'] as num).toDouble(),
      avgResponseTimeMs: (json['avg_response_time_ms'] as num?)?.toInt(),
      detectedAt: DateTime.parse(json['detected_at'] as String),
    );

Map<String, dynamic> _$ConceptGapResponseToJson(_ConceptGapResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'topic_id': instance.topicId,
      'topic_name': instance.topicName,
      'concept': instance.concept,
      'error_type': _$ErrorTypeEnumMap[instance.errorType]!,
      'weakness_score': instance.weaknessScore,
      'avg_response_time_ms': instance.avgResponseTimeMs,
      'detected_at': instance.detectedAt.toIso8601String(),
    };

const _$ErrorTypeEnumMap = {
  ErrorType.factual: 'factual',
  ErrorType.conceptual: 'conceptual',
  ErrorType.contextual: 'contextual',
};
