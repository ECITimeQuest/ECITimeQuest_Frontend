import 'package:flutter_app/features/learning/data/models/quiz_question.dart';

class QuizResponse {
  final List<QuizQuestion> questions;

  const QuizResponse({required this.questions});

  factory QuizResponse.fromJson(Map<String, dynamic> json) {
    return QuizResponse(
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
