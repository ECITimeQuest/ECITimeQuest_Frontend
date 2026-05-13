import 'package:flutter_app/features/content/data/models/historical_event.dart';
import 'package:flutter_app/features/content/data/models/historical_figure.dart';
import 'package:flutter_app/features/learning/data/models/quiz_question.dart';

sealed class IATaskData {
  const IATaskData();

  factory IATaskData.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      _ when json.containsKey('content') => IATaskData.fromJson(
        json['content'] as Map<String, dynamic>,
      ),
      _ when json.containsKey('questions') => QuizResponse.fromJson(json),
      _ when json.containsKey('explanation') =>
        AnswerExplanationResponse.fromJson(json),
      _ when json.containsKey('summary') && json.containsKey('key_facts') =>
        ExpandedContentResponse.fromJson(json),
      _ => throw FormatException(
        'No se pudo determinar el tipo de IATaskData. Campos: ${json.keys}',
      ),
    };
  }
}

class ExpandedContentResponse extends IATaskData {
  final String summary;
  final List<String> keyFacts;
  final String funFact;
  final List<HistoricalEvent> events;
  final List<HistoricalFigure> figures;

  const ExpandedContentResponse({
    required this.summary,
    required this.keyFacts,
    required this.funFact,
    required this.events,
    required this.figures,
  });

  factory ExpandedContentResponse.fromJson(Map<String, dynamic> json) {
    return ExpandedContentResponse(
      summary: json['summary'] as String,
      keyFacts: (json['key_facts'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      funFact: json['fun_fact'] as String,
      events:
          (json['events'] as List<dynamic>?)
              ?.map((e) => HistoricalEvent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      figures:
          (json['figures'] as List<dynamic>?)
              ?.map((e) => HistoricalFigure.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
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
