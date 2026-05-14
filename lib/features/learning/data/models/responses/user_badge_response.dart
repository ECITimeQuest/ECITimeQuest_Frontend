import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_badge_response.freezed.dart';
part 'user_badge_response.g.dart';

@freezed
abstract class UserBadgeResponse with _$UserBadgeResponse {
  const factory UserBadgeResponse({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'badge_name') required String badgeName,
    @JsonKey(name: 'awarded_at') required DateTime awardedAt,
  }) = _UserBadgeResponse;

  factory UserBadgeResponse.fromJson(Map<String, dynamic> json) =>
      _$UserBadgeResponseFromJson(json);
}
