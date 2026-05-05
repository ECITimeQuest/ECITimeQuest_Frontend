import 'dart:developer' as developer;
import 'package:flutter_app/core/widgets/app_toast.dart';
import 'package:flutter_app/features/learning/data/models/enums/task_type.dart';
import 'package:flutter_app/features/learning/data/models/requests/finish_session_request.dart';
import 'package:flutter_app/features/learning/data/models/requests/ia_task_context.dart';
import 'package:flutter_app/features/learning/data/models/requests/ia_task_request.dart';
import 'package:flutter_app/features/learning/data/models/requests/submit_answer_request.dart';
import 'package:flutter_app/features/learning/data/models/responses/quiz_question.dart';
import 'package:flutter_app/features/learning/data/models/responses/submit_answer_response.dart';
import 'package:flutter_app/features/learning/presentation/providers/ia_controller.dart';
import 'package:flutter_app/features/learning/presentation/providers/learning_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'quiz_state.dart';

class QuizNotifier extends StateNotifier<QuizState?> {
  final Ref ref;

  QuizNotifier(this.ref) : super(null);

  void initialize(
    List<QuizQuestion> questions,
    String topicName,
    String sessionId,
  ) {
    state = QuizState(
      questions: questions,
      topicName: topicName,
      sessionId: sessionId,
      startTime: DateTime.now(),
    );
  }

  void selectOption(int index) {
    if (state == null || state!.isSubmitted) return;
    state = state!.copyWith(selectedIndex: index);
  }

  Future<SubmitAnswerResponse?> submitAnswer() async {
    final currentState = state;

    if (currentState == null ||
        currentState.selectedIndex == null ||
        currentState.isSubmitted) {
      return null;
    }

    return await _processSubmitAnswer(currentState);
  }

  Future<Map<String, dynamic>?> nextQuestion() async {
    final currentState = state;
    if (currentState == null) return null;

    if (currentState.currentIndex >= currentState.questions.length - 1) {
      return await _finalizeSession(currentState);
    }

    state = currentState.copyWith(
      currentIndex: currentState.currentIndex + 1,
      resetSelection: true,
      isSubmitted: false,
      startTime: DateTime.now(),
    );
    return null;
  }

  void reset() {
    ref.invalidate(iaProvider);
    ref.invalidate(learningControllerProvider);
    state = null;
  }

  Future<SubmitAnswerResponse?> _processSubmitAnswer(
    QuizState currentState,
  ) async {
    final question = currentState.currentQuestion;
    final isCorrect = currentState.selectedIndex == question.correctIndex;

    final responseTimeMs = currentState.startTime != null
        ? DateTime.now().difference(currentState.startTime!).inMilliseconds
        : 0;

    final request = SubmitAnswerRequest(
      sessionId: currentState.sessionId,
      questionId: const Uuid().v4(),
      concept: question.concept,
      answer: question.options[currentState.selectedIndex!],
      responseTimeMs: responseTimeMs,
      isCorrect: isCorrect,
    );

    try {
      final response = await ref
          .read(learningControllerProvider.notifier)
          .submitAnswer(request);

      state = currentState.copyWith(
        isSubmitted: true,
        correctCount: isCorrect
            ? currentState.correctCount + 1
            : currentState.correctCount,
        incorrectCount: !isCorrect
            ? currentState.incorrectCount + 1
            : currentState.incorrectCount,
        totalResponseTimeMs: currentState.totalResponseTimeMs + responseTimeMs,
      );

      if (!isCorrect) {
        await _requestExplanation(question, currentState.selectedIndex!);
      }

      return response;
    } catch (e, stack) {
      developer.log(
        'Error submitting answer',
        name: 'LearningFlow',
        error: e,
        stackTrace: stack,
        level: 1000,
      );
      return null;
    }
  }

  Future<Map<String, dynamic>?> _finalizeSession(QuizState currentState) async {
    final totalAnswers =
        currentState.correctCount + currentState.incorrectCount;
    final avgResponseTimeMs = totalAnswers > 0
        ? currentState.totalResponseTimeMs ~/ totalAnswers
        : 0;

    final request = FinishSessionRequest(
      correctAnswers: currentState.correctCount,
      wrongAnswers: currentState.incorrectCount,
      avgResponseTimeMs: avgResponseTimeMs,
      completed: true,
    );

    try {
      final summary = await ref
          .read(learningControllerProvider.notifier)
          .finishSession(request, currentState.sessionId);

      final result = {
        'summary': summary,
        'correct': currentState.correctCount,
        'incorrect': currentState.incorrectCount,
      };

      return result;
    } catch (e, stack) {
      developer.log(
        'Error finishing session',
        name: 'LearningFlow',
        error: e,
        stackTrace: stack,
        level: 1000,
      );
      return null;
    }
  }

  Future<void> _requestExplanation(
    QuizQuestion question,
    int userSelectedIndex,
  ) async {
    final request = IATaskRequest(
      taskType: TaskType.answerExplanation,
      referenceId: "explanation_${DateTime.now().millisecondsSinceEpoch}",
      context: AnswerExplanationContext(
        topicName: state!.topicName,
        question: question.text,
        userAnswer: question.options[userSelectedIndex],
        correctAnswer: question.options[question.correctIndex],
      ),
    );

    AppToast.info(
      "Espera un momento, estamos generando una explicación para ti...",
    );

    try {
      final response = await ref
          .read(iaProvider.notifier)
          .requestIATask(request);

      if (response.taskId != null) {
        await ref.read(iaProvider.notifier).pollIATask(response.taskId!);
      }
    } catch (e, stack) {
      developer.log(
        'Error requesting explanation',
        name: 'IATaskFlow',
        error: e,
        stackTrace: stack,
        level: 1000,
      );
    }
  }
}

final quizNotifierProvider = StateNotifierProvider<QuizNotifier, QuizState?>((
  ref,
) {
  return QuizNotifier(ref);
});

final currentTopicProvider = StateProvider<String>(
  (ref) => "Misión de aprendizaje",
);
