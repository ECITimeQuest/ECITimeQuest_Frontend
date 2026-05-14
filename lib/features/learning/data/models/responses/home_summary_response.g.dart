// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeSummaryEraResponse _$HomeSummaryEraResponseFromJson(
  Map<String, dynamic> json,
) => _HomeSummaryEraResponse(
  periodId: json['period_id'] as String,
  periodName: json['period_name'] as String,
  lastStudiedAt: DateTime.parse(json['last_studied_at'] as String),
  completionPercentage: (json['completion_percentage'] as num).toDouble(),
);

Map<String, dynamic> _$HomeSummaryEraResponseToJson(
  _HomeSummaryEraResponse instance,
) => <String, dynamic>{
  'period_id': instance.periodId,
  'period_name': instance.periodName,
  'last_studied_at': instance.lastStudiedAt.toIso8601String(),
  'completion_percentage': instance.completionPercentage,
};

_HomeSummaryResponse _$HomeSummaryResponseFromJson(Map<String, dynamic> json) =>
    _HomeSummaryResponse(
      lastStudiedEra: json['last_studied_era'] == null
          ? null
          : HomeSummaryEraResponse.fromJson(
              json['last_studied_era'] as Map<String, dynamic>,
            ),
      completedErasCount: (json['completed_eras_count'] as num).toInt(),
      totalErasCount: (json['total_eras_count'] as num).toInt(),
    );

Map<String, dynamic> _$HomeSummaryResponseToJson(
  _HomeSummaryResponse instance,
) => <String, dynamic>{
  'last_studied_era': instance.lastStudiedEra,
  'completed_eras_count': instance.completedErasCount,
  'total_eras_count': instance.totalErasCount,
};
