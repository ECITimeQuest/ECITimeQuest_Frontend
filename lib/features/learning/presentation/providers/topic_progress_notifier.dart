import 'package:flutter_app/core/utils/task_runner_mixin.dart';
import 'package:flutter_app/features/learning/data/models/responses/topic_progress_response.dart';
import 'package:flutter_app/features/learning/data/providers/learning_provider.dart';
import 'package:flutter_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topicProgressProvider = AsyncNotifierProvider.autoDispose
    .family<TopicProgressNotifier, TopicProgressResponse?, String>(
      TopicProgressNotifier.new,
    );

class TopicProgressNotifier
    extends AutoDisposeFamilyAsyncNotifier<TopicProgressResponse?, String>
    with TaskRunnerMixin<TopicProgressResponse?> {
  @override
  Future<TopicProgressResponse?> build(String arg) async {
    final user = ref.watch(authUserProvider.select((s) => s.valueOrNull));
    if (user == null) {
      return null;
    }

    return getTopicProgress();
  }

  Future<TopicProgressResponse?> getTopicProgress() async {
    return runTask(
      flowName: 'TopicProgressFlow',
      startMessage: 'Obteniendo progreso del tema...',
      successMessage: 'Progreso del tema obtenido exitosamente',
      errorMessage: 'ERROR al obtener progreso del tema',
      action: () => ref.read(learningRepositoryProvider).getTopicProgress(arg),
    );
  }
}
