class FinishSessionRequest {
  final int correctAnswers;
  final int wrongAnswers;
  final int? avgResponseTimeMs;
  final bool completed;

  const FinishSessionRequest({
    required this.correctAnswers,
    required this.wrongAnswers,
    this.avgResponseTimeMs,
    required this.completed,
  });

  Map<String, dynamic> toJson() {
    return {
      'correct_answers': correctAnswers,
      'wrong_answers': wrongAnswers,
      'avg_response_time_ms': avgResponseTimeMs,
      'completed': completed,
    };
  }
}
