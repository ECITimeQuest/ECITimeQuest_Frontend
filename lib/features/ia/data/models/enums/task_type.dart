enum TaskType {
  quizGeneration,
  gapAnalysis,
  contentExpansion,
  answerExplanation;

  static TaskType fromApiValue(String value) {
    return switch (value) {
      'quiz_generation' => TaskType.quizGeneration,
      'gap_analysis' => TaskType.gapAnalysis,
      'content_expansion' => TaskType.contentExpansion,
      'answer_explanation' => TaskType.answerExplanation,
      _ => throw FormatException('Invalid task type: $value'),
    };
  }

  String toApiValue() {
    return switch (this) {
      TaskType.quizGeneration => 'quiz_generation',
      TaskType.gapAnalysis => 'gap_analysis',
      TaskType.contentExpansion => 'content_expansion',
      TaskType.answerExplanation => 'answer_explanation',
    };
  }
}
