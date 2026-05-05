class SubmitAnswerRequest {
  final String sessionId;
  final String questionId;
  final String concept;
  final String answer;
  final int responseTimeMs;
  final bool isCorrect;

  const SubmitAnswerRequest({
    required this.sessionId,
    required this.questionId,
    required this.concept,
    required this.answer,
    required this.responseTimeMs,
    required this.isCorrect,
  });

  Map<String, dynamic> toJson() {
    return {
      'session_id': sessionId,
      'question_id': questionId,
      'concept': concept,
      'answer': answer,
      'response_time_ms': responseTimeMs,
      'is_correct': isCorrect,
    };
  }
}
