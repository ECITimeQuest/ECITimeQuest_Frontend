import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/utils/error_handler.dart';
import 'package:flutter_app/core/widgets/app_button.dart';
import 'package:flutter_app/core/widgets/app_toast.dart';
import 'package:flutter_app/core/widgets/page_header.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';
import 'package:flutter_app/core/widgets/reinforcement_card.dart';
import 'package:flutter_app/features/home/presentation/providers/navigation_provider.dart';
import 'package:flutter_app/features/ia/data/models/enums/task_type.dart';
import 'package:flutter_app/features/ia/data/models/requests/ia_task_request.dart';
import 'package:flutter_app/features/learning/data/models/requests/start_session_request.dart';
import 'package:flutter_app/features/ia/data/models/responses/ia_task_data.dart';
import 'package:flutter_app/features/ia/presentation/providers/ia_notifier.dart';
import 'package:flutter_app/features/content/data/models/mappers/content_mapper.dart';
import 'package:flutter_app/features/learning/presentation/providers/learning_notifier.dart';
import 'package:flutter_app/features/learning/presentation/pages/quiz_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopicStudyPage extends ConsumerStatefulWidget {
  final String topicId;
  final String topicName;
  final ExpandedContentResponse content;

  const TopicStudyPage({
    super.key,
    required this.topicId,
    required this.topicName,
    required this.content,
  });

  @override
  ConsumerState<TopicStudyPage> createState() => _TopicStudyPageState();
}

class _TopicStudyPageState extends ConsumerState<TopicStudyPage> {
  bool _isGeneratingQuiz = false;
  bool _isQuizReady = false;
  String? _quizTaskId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _generateQuiz();
    });
  }

  Future<void> _generateQuiz() async {
    setState(() {
      _isGeneratingQuiz = true;
    });

    AppToast.info(
      'Estamos generando tu quiz. Puedes ir estudiando mientras tanto.',
    );

    try {
      final request = IATaskRequest(
        taskType: TaskType.quizGeneration,
        referenceId: widget.topicId,
        context: widget.content.toQuizContext(widget.topicName),
      );

      final completedTask = await ref
          .read(iaProvider.notifier)
          .requestAndPollTask<QuizResponse>(request);

      AppToast.success('¡Quiz generado exitosamente!');

      setState(() {
        _quizTaskId = completedTask.taskId;
        _isQuizReady = true;
      });
    } catch (e) {
      AppToast.error('Error al generar el quiz: ${ErrorHandler.getMessage(e)}');
    } finally {
      setState(() {
        _isGeneratingQuiz = false;
      });
    }
  }

  Future<void> _goToQuiz() async {
    if (!_isQuizReady) return;

    final cancelLoading = AppToast.loading('Iniciando sesión...');

    try {
      if (_quizTaskId != null) {
        await ref.read(iaProvider.notifier).getIATask(_quizTaskId!);
      }

      await ref
          .read(learningControllerProvider.notifier)
          .startSession(StartSessionRequest(tipicId: widget.topicId));

      cancelLoading();

      if (mounted) {
        ref.read(homeOverlayProvider.notifier).state = const QuizPage();
      }
    } catch (e) {
      cancelLoading();
      AppToast.error('Error al iniciar el quiz: ${ErrorHandler.getMessage(e)}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(title: widget.topicName),
        const SizedBox(height: 10),
        PaddedCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Resumen',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(widget.content.summary),
              const SizedBox(height: 20),
              PaddedCard(
                color: AppColors.surface,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Datos Clave',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...widget.content.keyFacts.map(
                      (fact) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.success,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: Text(fact)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ReinforcementCard(
          title: '¿Sabías qué?',
          subtitle: 'Dato Curioso',
          children: [Text(widget.content.funFact)],
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: double.infinity,
          child: AppButton(
            label: _isQuizReady ? 'Ir al Quiz' : 'Generando Quiz...',
            icon: const Icon(Icons.play_arrow),
            isLoading: _isGeneratingQuiz,
            onPressed: _isQuizReady ? _goToQuiz : null,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ],
    );
  }
}
