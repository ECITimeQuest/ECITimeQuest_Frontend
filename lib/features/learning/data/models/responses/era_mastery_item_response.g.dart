// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'era_mastery_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EraMasteryItemResponse _$EraMasteryItemResponseFromJson(
  Map<String, dynamic> json,
) => _EraMasteryItemResponse(
  periodId: json['period_id'] as String,
  periodName: json['period_name'] as String,
  masteryPercentage: (json['mastery_percentage'] as num).toDouble(),
  topicsCount: (json['topics_count'] as num).toInt(),
  topicsCompleted: (json['topics_completed'] as num).toInt(),
  xpTotal: (json['xp_total'] as num).toInt(),
);

Map<String, dynamic> _$EraMasteryItemResponseToJson(
  _EraMasteryItemResponse instance,
) => <String, dynamic>{
  'period_id': instance.periodId,
  'period_name': instance.periodName,
  'mastery_percentage': instance.masteryPercentage,
  'topics_count': instance.topicsCount,
  'topics_completed': instance.topicsCompleted,
  'xp_total': instance.xpTotal,
};
