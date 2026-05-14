import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/reinforcement_card.dart';
import 'package:flutter_app/core/widgets/upgrade_plan_widget.dart';
import 'package:flutter_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:flutter_app/features/learning/presentation/providers/concept_gaps_notifier.dart';
import 'package:flutter_app/features/learning/data/models/enums/error_type.dart';
import 'package:flutter_app/features/learning/data/models/responses/concept_gap_response.dart';
import 'package:flutter_app/core/utils/error_handler.dart';
import 'package:flutter_app/core/widgets/app_toast.dart';
import 'package:flutter_app/features/ia/data/models/enums/task_type.dart';
import 'package:flutter_app/features/ia/data/models/requests/ia_task_context.dart';
import 'package:flutter_app/features/ia/data/models/requests/ia_task_request.dart';
import 'package:flutter_app/features/ia/data/models/responses/ia_task_data.dart';
import 'package:flutter_app/features/ia/presentation/providers/ia_notifier.dart';
import 'package:flutter_app/features/content/presentation/providers/content_notifier.dart';
import 'package:flutter_app/features/content/data/models/mappers/content_mapper.dart';

class ConceptGapsSection extends ConsumerWidget {
  const ConceptGapsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gapsAsync = ref.watch(conceptGapsProvider);

    return ReinforcementCard(
      title: 'Temas para reforzar',
      subtitle: 'Recomendaciones personalizadas\nde tu IA Tutor',
      children: gapsAsync.when(
        data: (gaps) {
          if (gaps.isEmpty) {
            return [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text('¡Todo perfecto! No tienes temas por reforzar.'),
                ),
              ),
            ];
          }
          final List<Widget> columns = [];
          for (int i = 0; i < gaps.length; i += 3) {
            final chunk = gaps.skip(i).take(3).toList();
            columns.add(
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Column(
                  children: chunk.map((gap) {
                    final isLast = chunk.last == gap;
                    return Column(
                      children: [
                        _InteractiveGapCard(gap: gap),
                        if (!isLast) const SizedBox(height: 12),
                      ],
                    );
                  }).toList(),
                ),
              ),
            );
          }
          return [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: columns.map((col) {
                  final isLast = columns.last == col;
                  return Padding(
                    padding: EdgeInsets.only(right: isLast ? 0 : 16),
                    child: col,
                  );
                }).toList(),
              ),
            ),
          ];
        },
        loading: () => [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(),
            ),
          ),
        ],
        error: (err, _) => [const SizedBox.shrink()],
      ),
    );
  }
}

class _InteractiveGapCard extends ConsumerStatefulWidget {
  final ConceptGapResponse gap;

  const _InteractiveGapCard({required this.gap});

  @override
  ConsumerState<_InteractiveGapCard> createState() =>
      _InteractiveGapCardState();
}

class _InteractiveGapCardState extends ConsumerState<_InteractiveGapCard> {
  bool _isLoading = false;

  Future<void> _analyzeGap() async {
    final user = ref.read(authUserProvider).valueOrNull;

    if (user == null || !user.subscriptionPlan.isPremium) {
      showDialog(
        context: context,
        builder: (context) => const UpgradePlanWidget(
          title: 'Análisis de IA Tutor',
          message:
              'Mejora a Premium para indagar sobre tus vacíos conceptuales y acelerar tu aprendizaje.',
        ),
      );
      return;
    }

    setState(() => _isLoading = true);
    AppToast.info('Analizando vacío conceptual con IA...');

    try {
      final contextResponse = await ref
          .read(contentControllerProvider.notifier)
          .getIAContext(widget.gap.topicId);

      final topicContext = contextResponse.toTopicContext();

      final gapContext = GapAnalysisContext(
        topicName: topicContext.topicName,
        topicDescription: topicContext.topicDescription,
        periodName: topicContext.periodName,
        figures: topicContext.figures,
        events: topicContext.events,
        targetConcept: widget.gap.concept,
      );

      final taskRequest = IATaskRequest(
        taskType: TaskType.gapAnalysis,
        referenceId: widget.gap.topicId,
        context: gapContext,
      );

      final completedTask = await ref
          .read(iaProvider.notifier)
          .requestAndPollTask<GapAnalysisResponse>(taskRequest);

      final analysis = completedTask.data as GapAnalysisResponse;

      AppToast.success('¡Análisis completado!');

      if (!mounted) return;

      _showAnalysisDialog(context, analysis);
    } catch (e) {
      AppToast.error('Error al analizar: ${ErrorHandler.getMessage(e)}');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showAnalysisDialog(BuildContext context, GapAnalysisResponse analysis) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          child: ReinforcementCard(
            title: 'Análisis IA Tutor',
            subtitle: 'Sobre "${analysis.concept}"',
            children: [
              Text(
                analysis.explanation,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurface.withValues(alpha: 0.8),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _getSeverityColor(
                        analysis.severity,
                      ).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Severidad: ${analysis.severity.toUpperCase()}',
                      style: TextStyle(
                        color: _getSeverityColor(analysis.severity),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Entendido'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Color _getSeverityColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'alto':
        return Colors.red;
      case 'medio':
        return Colors.orange;
      case 'bajo':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData _getIconForErrorType(ErrorType type) {
    switch (type) {
      case ErrorType.factual:
        return Icons.menu_book;
      case ErrorType.conceptual:
        return Icons.lightbulb;
      case ErrorType.contextual:
        return Icons.map;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: _isLoading ? 0.6 : 1.0,
          child: ReinforcementCard.buildReinforcementCard(
            context,
            icon: _getIconForErrorType(widget.gap.errorType),
            iconBgColor: AppColors.surfaceContainer,
            iconColor: AppColors.primary,
            title: widget.gap.concept,
            subtitle: widget.gap.topicName ?? 'Repaso sugerido',
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              highlightColor: Colors.transparent,
              splashColor: AppColors.primary.withValues(alpha: 0.1),
              onTap: _isLoading ? null : _analyzeGap,
            ),
          ),
        ),
        if (_isLoading)
          const Positioned.fill(
            child: Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}
