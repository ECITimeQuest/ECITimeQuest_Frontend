// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_badge_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserBadgeResponse _$UserBadgeResponseFromJson(Map<String, dynamic> json) =>
    _UserBadgeResponse(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      badgeName: json['badge_name'] as String,
      awardedAt: DateTime.parse(json['awarded_at'] as String),
    );

Map<String, dynamic> _$UserBadgeResponseToJson(_UserBadgeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'badge_name': instance.badgeName,
      'awarded_at': instance.awardedAt.toIso8601String(),
    };
