class TopicResponse {
  final String id;
  final String name;
  final int difficulty;
  final bool isPremium;
  final int xpReward;
  final int order;

  const TopicResponse({
    required this.id,
    required this.name,
    required this.difficulty,
    required this.isPremium,
    required this.xpReward,
    required this.order,
  });

  factory TopicResponse.fromJson(Map<String, dynamic> json) {
    return TopicResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      difficulty: json['difficulty'] as int,
      isPremium: json['is_premium'] as bool,
      xpReward: json['xp_reward'] as int,
      order: json['order'] as int,
    );
  }
}
