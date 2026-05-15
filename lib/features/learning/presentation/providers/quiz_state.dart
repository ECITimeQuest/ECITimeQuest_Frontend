import 'package:flutter_app/features/learning/data/models/quiz_question.dart';

class QuizState {
  final List<QuizQuestion> questions;
  final int currentIndex;
  final int? selectedIndex;
  final bool isSubmitted;
  final int correctCount;
  final int incorrectCount;
  final String topicName;
  final String sessionId;
  final DateTime? startTime;
  final int totalResponseTimeMs;

  QuizState({
    required this.questions,
    this.currentIndex = 0,
    this.selectedIndex,
    this.isSubmitted = false,
    this.correctCount = 0,
    this.incorrectCount = 0,
    required this.topicName,
    required this.sessionId,
    this.startTime,
    this.totalResponseTimeMs = 0,
  });

  QuizQuestion get currentQuestion => questions[currentIndex];

  QuizState copyWith({
    List<QuizQuestion>? questions,
    int? currentIndex,
    int? selectedIndex,
    bool? isSubmitted,
    int? correctCount,
    int? incorrectCount,
    String? topicName,
    String? sessionId,
    DateTime? startTime,
    int? totalResponseTimeMs,
    bool resetSelection = false,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedIndex: resetSelection
          ? null
          : (selectedIndex ?? this.selectedIndex),
      isSubmitted: isSubmitted ?? this.isSubmitted,
      correctCount: correctCount ?? this.correctCount,
      incorrectCount: incorrectCount ?? this.incorrectCount,
      topicName: topicName ?? this.topicName,
      sessionId: sessionId ?? this.sessionId,
      startTime: startTime ?? this.startTime,
      totalResponseTimeMs: totalResponseTimeMs ?? this.totalResponseTimeMs,
    );
  }
}
