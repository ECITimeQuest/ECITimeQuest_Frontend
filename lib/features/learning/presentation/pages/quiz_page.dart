import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/app_button.dart';
import 'package:flutter_app/core/widgets/app_toast.dart';
import 'package:flutter_app/features/learning/data/models/responses/submit_answer_response.dart';
import 'package:flutter_app/features/learning/data/models/responses/learning_session_response.dart';
import 'package:flutter_app/features/learning/presentation/providers/quiz_notifier.dart';
import 'package:flutter_app/features/learning/presentation/providers/ia_controller.dart';
import 'package:flutter_app/features/learning/presentation/widgets/quiz_progress_header.dart';
import 'package:flutter_app/features/learning/presentation/widgets/quiz_options_list.dart';
import 'package:flutter_app/features/learning/presentation/widgets/feedback_modal.dart';
import 'package:flutter_app/features/learning/presentation/widgets/quiz_summary_modal.dart';
import 'package:flutter_app/features/home/presentation/providers/navigation_provider.dart';
import 'package:flutter_app/features/learning/data/models/responses/ia_task_data.dart';
import 'package:flutter_app/features/learning/presentation/providers/learning_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({super.key});

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeQuiz();
    });
  }

  void _initializeQuiz() {
    final iaState = ref.read(iaProvider);
    final learningState = ref.read(learningControllerProvider);

    if (iaState.hasValue &&
        iaState.value?.data is QuizResponse &&
        learningState is AsyncData<dynamic> &&
        learningState.value is LearningSessionResponse) {
      final quiz = iaState.value!.data as QuizResponse;
      final session = learningState.value as LearningSessionResponse;

      if (session.completed) return;

      ref
          .read(quizNotifierProvider.notifier)
          .initialize(
            quiz.questions,
            ref.read(currentTopicProvider),
            session.id,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(iaProvider, (_, _) => _initializeQuiz());
    ref.listen(learningControllerProvider, (_, _) => _initializeQuiz());

    final quizState = ref.watch(quizNotifierProvider);
    final iaState = ref.watch(iaProvider);

    if (quizState == null) {
      if (iaState.hasError) {
        return const Center(child: Text("Error al cargar el desafío"));
      }

      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text("Preparando tu desafío..."),
          ],
        ),
      );
    }

    final isSubmitting = ref.watch(iaProvider).isLoading;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuizProgressHeader(
          moduleName: quizState.topicName.toUpperCase(),
          chipContent:
              "Pregunta ${quizState.currentIndex + 1} de ${quizState.questions.length}",
          progress: (quizState.currentIndex + 1) / quizState.questions.length,
        ),
        const SizedBox(height: 32),
        Text(
          quizState.currentQuestion.text,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: AppColors.onSurface),
        ),
        const SizedBox(height: 24),
        const QuizOptionsList(),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: AppButton(
            label: "Confirmar respuesta",
            icon: const Icon(Icons.arrow_forward, size: 18),
            isLoading: isSubmitting,
            onPressed:
                (quizState.selectedIndex == null || quizState.isSubmitted)
                ? null
                : () => _handleSubmit(context),
          ),
        ),
      ],
    );
  }

  Future<void> _handleSubmit(BuildContext context) async {
    final result = await ref.read(quizNotifierProvider.notifier).submitAnswer();

    if (!context.mounted) return;

    if (result != null) {
      if (result.isCorrect) {
        _showFeedbackModal(context, result: result);
      } else {
        _showFeedbackModal(context, isCorrect: false, result: result);
      }
    } else {
      AppToast.error(
        "Hubo un problema al enviar tu respuesta. Inténtalo de nuevo.",
      );
    }
  }

  void _showFeedbackModal(
    BuildContext context, {
    SubmitAnswerResponse? result,
    bool isCorrect = true,
  }) {
    final quizState = ref.read(quizNotifierProvider);
    final isLast =
        quizState != null &&
        quizState.currentIndex == quizState.questions.length - 1;

    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FeedbackModal(
        isCorrect: isCorrect,
        result: result,
        isLast: isLast,
        onNext: () async {
          final summaryResult = await ref
              .read(quizNotifierProvider.notifier)
              .nextQuestion();

          if (!context.mounted) return;
          Navigator.pop(context);

          if (summaryResult != null) {
            _showSummaryModal(
              context,
              summaryResult['summary'] as LearningSessionResponse,
              summaryResult['correct'] as int,
              summaryResult['incorrect'] as int,
            );
          } else {
            final quizState = ref.read(quizNotifierProvider);
            if (quizState == null) {
              AppToast.error("No se pudo finalizar la sesión correctamente.");
              ref.read(navigationIndexProvider.notifier).state = 0;
            }
          }
        },
      ),
    );
  }

  void _showSummaryModal(
    BuildContext context,
    LearningSessionResponse summary,
    int correct,
    int incorrect,
  ) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => QuizSummaryModal(
        summary: summary,
        correctAnswers: correct,
        wrongAnswers: incorrect,
        onFinish: () {
          Navigator.pop(context);
          ref.read(quizNotifierProvider.notifier).reset();
          ref.read(navigationIndexProvider.notifier).state = 0;
        },
      ),
    );
  }
}
