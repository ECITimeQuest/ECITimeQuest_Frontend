import 'package:flutter_app/core/utils/task_runner_mixin.dart';
import 'package:flutter_app/features/learning/data/models/responses/submit_answer_response.dart';
import 'package:flutter_app/features/learning/data/models/responses/user_progress_response.dart';
import 'package:flutter_app/features/learning/data/providers/learning_provider.dart';
import 'package:flutter_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProgressProvider =
    AsyncNotifierProvider<UserProgressNotifier, UserProgressResponse?>(
      UserProgressNotifier.new,
    );

class UserProgressNotifier extends AsyncNotifier<UserProgressResponse?>
    with TaskRunnerMixin<UserProgressResponse?> {
  Future<UserProgressResponse?>? _ongoingFetch;

  @override
  Future<UserProgressResponse?> build() async {
    final userId = ref.watch(authUserProvider.select((s) => s.valueOrNull?.id));

    if (userId == null) {
      return null;
    }

    return getUserProgress();
  }

  Future<UserProgressResponse?> getUserProgress() async {
    if (_ongoingFetch != null) {
      return _ongoingFetch;
    }

    _ongoingFetch = runTask(
      flowName: 'UserProgressFlow',
      startMessage: 'Obteniendo progreso del usuario...',
      successMessage: 'Progreso obtenido exitosamente',
      errorMessage: 'ERROR al obtener progreso',
      action: () => ref.read(learningRepositoryProvider).getUserProgress(),
    );

    return _ongoingFetch;
  }

  void updateFromAnswer(SubmitAnswerResponse response) {
    if (state.valueOrNull != null) {
      final current = state.value!;
      state = AsyncData(
        current.copyWith(
          coins: current.coins + response.coinsEarned,
          xpTotal: current.xpTotal + response.xpEarned,
          lives: current.lives - response.livesLost,
        ),
      );
    }
  }
}
