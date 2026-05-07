import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/utils/error_handler.dart';
import 'package:flutter_app/core/widgets/app_button.dart';
import 'package:flutter_app/core/widgets/app_toast.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';
import 'package:flutter_app/features/learning/data/models/enums/task_type.dart';
import 'package:flutter_app/features/learning/data/models/mappers/content_mapper.dart';
import 'package:flutter_app/features/learning/data/models/requests/ia_task_request.dart';
import 'package:flutter_app/features/learning/data/models/responses/ia_task_data.dart';
import 'package:flutter_app/features/learning/presentation/pages/topic_study_page.dart';
import 'package:flutter_app/features/learning/presentation/providers/content_notifier.dart';
import 'package:flutter_app/features/learning/presentation/providers/ia_notifier.dart';
import 'package:flutter_app/features/home/presentation/providers/navigation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopicsListPage extends ConsumerStatefulWidget {
  const TopicsListPage({super.key});

  @override
  ConsumerState<TopicsListPage> createState() => _TopicsListPageState();
}

class _TopicsListPageState extends ConsumerState<TopicsListPage> {
  final String _topicId = '20000000-0000-0000-0000-000000000001';
  final String _topicName = 'Arte Renacentista';

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
          .getIAContext(_topicId);

      final taskRequest = IATaskRequest(
        taskType: TaskType.contentExpansion,
        referenceId: _topicId,
        context: contextResponse.toContentExpansionContext(),
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
        topicId: _topicId,
        topicName: _topicName,
        content: _expandedContent!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Temas Disponibles',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        PaddedCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_topicName, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 10),
              Text(
                'Descubre los secretos y maravillas del Renacimiento.',
                style: Theme.of(context).textTheme.bodyMedium,
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
        ),
      ],
    );
  }
}
