// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProgressResponse _$UserProgressResponseFromJson(
  Map<String, dynamic> json,
) => _UserProgressResponse(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  xpTotal: (json['xp_total'] as num).toInt(),
  level: (json['level'] as num).toInt(),
  coins: (json['coins'] as num).toInt(),
  lives: (json['lives'] as num).toInt(),
  livesRefillAt: json['lives_refill_at'] == null
      ? null
      : DateTime.parse(json['lives_refill_at'] as String),
  streakDay: (json['streak_day'] as num).toInt(),
  longestStreak: (json['longest_streak'] as num).toInt(),
  lastActivityDate: json['last_activity_date'] == null
      ? null
      : DateTime.parse(json['last_activity_date'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$UserProgressResponseToJson(
  _UserProgressResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'xp_total': instance.xpTotal,
  'level': instance.level,
  'coins': instance.coins,
  'lives': instance.lives,
  'lives_refill_at': instance.livesRefillAt?.toIso8601String(),
  'streak_day': instance.streakDay,
  'longest_streak': instance.longestStreak,
  'last_activity_date': instance.lastActivityDate?.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
