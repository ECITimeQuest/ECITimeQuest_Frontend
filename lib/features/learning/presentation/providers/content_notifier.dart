import 'package:flutter_app/core/utils/task_runner_mixin.dart';
import 'package:flutter_app/features/learning/data/models/responses/topic_ia_context_response.dart';
import 'package:flutter_app/features/learning/data/providers/content_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contentControllerProvider =
    AsyncNotifierProvider<ContentNotifier, TopicAIContextResponse?>(
      ContentNotifier.new,
    );

class ContentNotifier extends AsyncNotifier<TopicAIContextResponse?>
    with TaskRunnerMixin<TopicAIContextResponse?> {
  @override
  Future<TopicAIContextResponse?> build() async => null;

  Future<TopicAIContextResponse> getIAContext(String topicId) async {
    return runTask(
      flowName: 'ContentFlow',
      startMessage: 'Obteniendo contexto de IA para el tema...',
      successMessage: 'Contexto obtenido exitosamente',
      errorMessage: 'ERROR al obtener contexto de IA',
      action: () => ref.read(contentRepositoryProvider).getIAContext(topicId),
    );
  }
}
