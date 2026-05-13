import 'package:flutter_app/features/content/data/models/historical_event.dart';
import 'package:flutter_app/features/content/data/models/historical_figure.dart';

sealed class IATaskContext {
  const IATaskContext();

  Map<String, dynamic> toJson();
}

class ContentExpansionContext extends IATaskContext {
  final String topicName;
  final String topicDescription;
  final String periodName;
  final List<HistoricalEvent> events;
  final List<HistoricalFigure> figures;

  const ContentExpansionContext({
    required this.topicName,
    required this.topicDescription,
    required this.periodName,
    required this.figures,
    required this.events,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'topic_name': topicName,
      'topic_description': topicDescription,
      'period_name': periodName,
      'figures': figures.map((e) => e.toJson()).toList(),
      'events': events.map((e) => e.toJson()).toList(),
    };
  }
}

class QuizContext extends IATaskContext {
  final String topicName;
  final String summary;
  final List<String> keyFacts;
  final String funFact;

  const QuizContext({
    required this.topicName,
    required this.summary,
    required this.keyFacts,
    required this.funFact,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'topic_name': topicName,
      'summary': summary,
      'key_facts': keyFacts,
      'fun_fact': funFact,
    };
  }
}

class AnswerExplanationContext extends IATaskContext {
  final String topicName;
  final String question;
  final String userAnswer;
  final String correctAnswer;

  const AnswerExplanationContext({
    required this.topicName,
    required this.question,
    required this.userAnswer,
    required this.correctAnswer,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'topic_name': topicName,
      'question': question,
      'user_answer': userAnswer,
      'correct_answer': correctAnswer,
    };
  }
}
