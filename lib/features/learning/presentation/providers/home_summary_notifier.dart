import 'package:flutter_app/core/utils/task_runner_mixin.dart';
import 'package:flutter_app/features/learning/data/models/responses/home_summary_response.dart';
import 'package:flutter_app/features/learning/data/providers/learning_provider.dart';
import 'package:flutter_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeSummaryProvider =
    AsyncNotifierProvider<HomeSummaryNotifier, HomeSummaryResponse?>(
      HomeSummaryNotifier.new,
    );

class HomeSummaryNotifier extends AsyncNotifier<HomeSummaryResponse?>
    with TaskRunnerMixin<HomeSummaryResponse?> {
  @override
  Future<HomeSummaryResponse?> build() async {
    final user = ref.watch(authUserProvider);

    if (user.valueOrNull == null) {
      return null;
    }

    return getHomeSummary();
  }

  Future<HomeSummaryResponse> getHomeSummary() async {
    return runTask(
      flowName: 'HomeSummaryFlow',
      startMessage: 'Obteniendo resumen del inicio...',
      successMessage: 'Resumen del inicio obtenido exitosamente',
      errorMessage: 'ERROR al obtener resumen del inicio',
      action: () => ref.read(learningRepositoryProvider).getHomeSummary(),
    );
  }
}
