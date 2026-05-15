class SubmitAnswerResponse {
  final String sessionId;
  final bool isCorrect;
  final int xpEarned;
  final int coinsEarned;
  final String? feedback;
  final int livesLost;

  const SubmitAnswerResponse({
    required this.sessionId,
    required this.isCorrect,
    required this.xpEarned,
    required this.coinsEarned,
    this.feedback,
    required this.livesLost,
  });

  factory SubmitAnswerResponse.fromJson(Map<String, dynamic> json) {
    return SubmitAnswerResponse(
      sessionId: json['session_id'] as String,
      isCorrect: json['is_correct'] as bool,
      xpEarned: json['xp_earned'] as int,
      coinsEarned: json['coins_earned'] as int,
      feedback: json['feedback'] as String?,
      livesLost: json['lives_lost'] as int,
    );
  }
}
