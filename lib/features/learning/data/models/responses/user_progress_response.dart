import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_progress_response.freezed.dart';
part 'user_progress_response.g.dart';

@freezed
abstract class UserProgressResponse with _$UserProgressResponse {
  const factory UserProgressResponse({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'xp_total') required int xpTotal,
    required int level,
    required int coins,
    required int lives,
    @JsonKey(name: 'lives_refill_at') DateTime? livesRefillAt,
    @JsonKey(name: 'streak_day') required int streakDay,
    @JsonKey(name: 'longest_streak') required int longestStreak,
    @JsonKey(name: 'last_activity_date') DateTime? lastActivityDate,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _UserProgressResponse;

  factory UserProgressResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProgressResponseFromJson(json);
}
