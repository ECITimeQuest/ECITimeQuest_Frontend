import 'package:flutter_app/core/utils/task_runner_mixin.dart';
import 'package:flutter_app/features/learning/data/models/responses/historical_period_response.dart';
import 'package:flutter_app/features/learning/data/models/responses/topic_response.dart';
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

  Future<List<HistoricalPeriodResponse>> listPeriods() async {
    return runTask(
      flowName: 'ContentFlow',
      startMessage: 'Obteniendo períodos históricos...',
      successMessage: 'Períodos obtenidos exitosamente',
      errorMessage: 'ERROR al obtener períodos históricos',
      action: () => ref.read(contentRepositoryProvider).listPeriods(),
    );
  }

  Future<HistoricalPeriodResponse> getPeriod(String periodId) async {
    return runTask(
      flowName: 'ContentFlow',
      startMessage: 'Obteniendo período histórico...',
      successMessage: 'Período histórico obtenido exitosamente',
      errorMessage: 'ERROR al obtener período histórico',
      action: () => ref.read(contentRepositoryProvider).getPeriod(periodId),
    );
  }

  Future<List<TopicResponse>> listTopics(String periodId) async {
    return runTask(
      flowName: 'ContentFlow',
      startMessage: 'Obteniendo temas del período...',
      successMessage: 'Temas obtenidos exitosamente',
      errorMessage: 'ERROR al obtener temas del período',
      action: () => ref.read(contentRepositoryProvider).listTopics(periodId),
    );
  }

  Future<TopicResponse> getTopic(String topicId) async {
    return runTask(
      flowName: 'ContentFlow',
      startMessage: 'Obteniendo tema...',
      successMessage: 'Tema obtenido exitosamente',
      errorMessage: 'ERROR al obtener tema',
      action: () => ref.read(contentRepositoryProvider).getTopic(topicId),
    );
  }
}
