import 'quiz_question.dart';

sealed class IATaskData {
  const IATaskData();

  factory IATaskData.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('questions')) {
      return QuizResponse.fromJson(json);
    } else if (json.containsKey('explanation')) {
      return AnswerExplanationResponse.fromJson(json);
    } else {
      throw FormatException(
        'No se pudo determinar el tipo de IATaskData. Campos: ${json.keys}',
      );
    }
  }
}

class QuizResponse extends IATaskData {
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

class AnswerExplanationResponse extends IATaskData {
  final String explanation;
  final String keyConcept;
  final String tip;

  const AnswerExplanationResponse({
    required this.explanation,
    required this.keyConcept,
    required this.tip,
  });

  factory AnswerExplanationResponse.fromJson(Map<String, dynamic> json) {
    return AnswerExplanationResponse(
      explanation: json['explanation'] as String,
      keyConcept: json['key_concept'] as String,
      tip: json['tip'] as String,
    );
  }
}
