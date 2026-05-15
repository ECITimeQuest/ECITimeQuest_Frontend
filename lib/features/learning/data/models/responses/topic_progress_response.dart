import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_progress_response.freezed.dart';
part 'topic_progress_response.g.dart';

@freezed
abstract class TopicProgressResponse with _$TopicProgressResponse {
  const factory TopicProgressResponse({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'topic_id') required String topicId,
    @JsonKey(name: 'completion_percentage')
    required double completionPercentage,
    @JsonKey(name: 'xp_earned') required int xpEarned,
    @JsonKey(name: 'last_studied_at') DateTime? lastStudiedAt,
  }) = _TopicProgressResponse;

  factory TopicProgressResponse.fromJson(Map<String, dynamic> json) =>
      _$TopicProgressResponseFromJson(json);
}
