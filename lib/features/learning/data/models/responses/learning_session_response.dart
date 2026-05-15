class LearningSessionResponse {
  final String id;
  final String userId;
  final String topicId;
  final int xpGained;
  final int coinsGained;
  final int livesLost;
  final bool completed;
  final DateTime startedAt;
  final DateTime? finishedAt;

  const LearningSessionResponse({
    required this.id,
    required this.userId,
    required this.topicId,
    required this.xpGained,
    required this.coinsGained,
    required this.livesLost,
    required this.completed,
    required this.startedAt,
    this.finishedAt,
  });

  factory LearningSessionResponse.fromJson(Map<String, dynamic> json) {
    return LearningSessionResponse(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      topicId: json['topic_id'] as String,
      xpGained: json['xp_gained'] as int,
      coinsGained: json['coins_gained'] as int,
      livesLost: json['lives_lost'] as int,
      completed: json['completed'] as bool,
      startedAt: DateTime.parse(json['started_at'] as String),
      finishedAt: json['finished_at'] != null
          ? DateTime.parse(json['finished_at'] as String)
          : null,
    );
  }
}
