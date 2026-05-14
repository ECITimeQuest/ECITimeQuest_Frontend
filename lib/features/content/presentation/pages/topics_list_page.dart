import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/utils/error_handler.dart';
import 'package:flutter_app/core/widgets/app_button.dart';
import 'package:flutter_app/core/widgets/app_toast.dart';
import 'package:flutter_app/core/widgets/page_header.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';
import 'package:flutter_app/features/ia/data/models/enums/task_type.dart';
import 'package:flutter_app/features/content/data/models/mappers/content_mapper.dart';
import 'package:flutter_app/features/ia/data/models/requests/ia_task_request.dart';
import 'package:flutter_app/features/ia/data/models/responses/ia_task_data.dart';
import 'package:flutter_app/features/content/data/models/responses/topic_response.dart';
import 'package:flutter_app/features/learning/presentation/pages/topic_study_page.dart';
import 'package:flutter_app/features/content/presentation/providers/content_notifier.dart';
import 'package:flutter_app/features/ia/presentation/providers/ia_notifier.dart';
import 'package:flutter_app/features/home/presentation/providers/navigation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopicsListPage extends ConsumerStatefulWidget {
  final String periodId;
  final String periodName;
  final String? periodDescription;

  const TopicsListPage({
    super.key,
    required this.periodId,
    required this.periodName,
    this.periodDescription,
  });

  @override
  ConsumerState<TopicsListPage> createState() => _TopicsListPageState();
}

class _TopicsListPageState extends ConsumerState<TopicsListPage> {
  bool _isLoading = true;
  String? _errorMessage;
  List<TopicResponse> _topics = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadTopics();
    });
  }

  Future<void> _loadTopics() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final topics = await ref
          .read(contentControllerProvider.notifier)
          .listTopics(widget.periodId);

      setState(() {
        _topics = topics;
      });
    } catch (e) {
      setState(() {
        _errorMessage = ErrorHandler.getMessage(e);
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(title: 'Temas: ${widget.periodName}'),
        if (widget.periodDescription != null &&
            widget.periodDescription!.isNotEmpty) ...[
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(widget.periodDescription!),
          ),
        ],
        const SizedBox(height: 20),
        if (_isLoading)
          const Center(child: CircularProgressIndicator())
        else if (_errorMessage != null)
          Center(
            child: Column(
              children: [
                Icon(Icons.error_outline, color: AppColors.error, size: 48),
                const SizedBox(height: 16),
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: AppColors.error),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _loadTopics,
                  child: const Text('Reintentar'),
                ),
              ],
            ),
          )
        else if (_topics.isEmpty)
          const Center(
            child: Text('No hay temas disponibles para este período.'),
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _topics.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return TopicCard(topic: _topics[index]);
            },
          ),
      ],
    );
  }
}

class TopicCard extends ConsumerStatefulWidget {
  final TopicResponse topic;

  const TopicCard({super.key, required this.topic});

  @override
  ConsumerState<TopicCard> createState() => _TopicCardState();
}

class _TopicCardState extends ConsumerState<TopicCard> {
  bool _isLoading = false;
  ExpandedContentResponse? _expandedContent;

  Future<void> _requestContent() async {
    setState(() {
      _isLoading = true;
    });

    AppToast.info('Generando el contenido del tema...');

    try {
      final contextResponse = await ref
          .read(contentControllerProvider.notifier)
          .getIAContext(widget.topic.id);

      final taskRequest = IATaskRequest(
        taskType: TaskType.contentExpansion,
        referenceId: widget.topic.id,
        context: contextResponse.toTopicContext(),
      );

      final completedTask = await ref
          .read(iaProvider.notifier)
          .requestAndPollTask<ExpandedContentResponse>(taskRequest);

      AppToast.success('¡Contenido generado con éxito!');

      setState(() {
        _expandedContent = completedTask.data as ExpandedContentResponse;
      });
    } catch (e) {
      AppToast.error(
        'Error al generar el contenido: ${ErrorHandler.getMessage(e)}',
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _goToStudyPage() {
    if (_expandedContent != null) {
      ref.read(homeOverlayProvider.notifier).state = TopicStudyPage(
        topicId: widget.topic.id,
        topicName: widget.topic.name,
        content: _expandedContent!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PaddedCard(
      verticalPadding: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.topic.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              if (widget.topic.isPremium) ...[
                const SizedBox(width: 8),
                const Icon(Icons.star, color: AppColors.tertiary, size: 20),
              ],
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildBadge(
                context,
                icon: Icons.signal_cellular_alt,
                label: 'Dificultad ${widget.topic.difficulty}',
                color: AppColors.primary,
              ),
              const SizedBox(width: 10),
              _buildBadge(
                context,
                icon: Icons.stars,
                label: '${widget.topic.xpReward} XP',
                color: AppColors.fire,
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: _expandedContent == null
                ? AppButton(
                    label: 'Solicitar Contenido',
                    icon: const Icon(Icons.auto_awesome),
                    isLoading: _isLoading,
                    loadingLabel: 'Generando...',
                    onPressed: _requestContent,
                  )
                : AppButton(
                    label: 'Ver Contenido',
                    icon: const Icon(Icons.menu_book),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                    ),
                    onPressed: _goToStudyPage,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
