class QuizQuestion {
  final String text;
  final List<String> options;
  final int correctIndex;
  final String concept;

  const QuizQuestion({
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.concept,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      text: json['text'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      correctIndex: json['correct_index'] as int,
      concept: json['concept'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'options': options,
      'correct_index': correctIndex,
      'concept': concept,
    };
  }
}
