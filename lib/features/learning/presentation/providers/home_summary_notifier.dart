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
  Future<HomeSummaryResponse?>? _ongoingFetch;

  @override
  Future<HomeSummaryResponse?> build() async {
    final userId = ref.watch(authUserProvider.select((s) => s.valueOrNull?.id));

    if (userId == null) {
      return null;
    }

    return getHomeSummary();
  }

  Future<HomeSummaryResponse> getHomeSummary() async {
    if (_ongoingFetch != null) {
      return await _ongoingFetch as HomeSummaryResponse;
    }

    _ongoingFetch = runTask(
      flowName: 'HomeSummaryFlow',
      startMessage: 'Obteniendo resumen del inicio...',
      successMessage: 'Resumen del inicio obtenido exitosamente',
      errorMessage: 'ERROR al obtener resumen del inicio',
      action: () => ref.read(learningRepositoryProvider).getHomeSummary(),
    );

    try {
      final result = await _ongoingFetch;
      return result!;
    } finally {
      _ongoingFetch = null;
    }
  }
}
