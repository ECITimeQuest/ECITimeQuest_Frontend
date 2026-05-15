// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_progress_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopicProgressResponse _$TopicProgressResponseFromJson(
  Map<String, dynamic> json,
) => _TopicProgressResponse(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  topicId: json['topic_id'] as String,
  completionPercentage: (json['completion_percentage'] as num).toDouble(),
  xpEarned: (json['xp_earned'] as num).toInt(),
  lastStudiedAt: json['last_studied_at'] == null
      ? null
      : DateTime.parse(json['last_studied_at'] as String),
);

Map<String, dynamic> _$TopicProgressResponseToJson(
  _TopicProgressResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'topic_id': instance.topicId,
  'completion_percentage': instance.completionPercentage,
  'xp_earned': instance.xpEarned,
  'last_studied_at': instance.lastStudiedAt?.toIso8601String(),
};
