import 'package:flutter_app/core/utils/task_runner_mixin.dart';
import 'package:flutter_app/features/learning/data/models/responses/era_mastery_item_response.dart';
import 'package:flutter_app/features/learning/data/providers/learning_provider.dart';
import 'package:flutter_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eraMasteryProvider =
    AsyncNotifierProvider<EraMasteryNotifier, List<EraMasteryItemResponse>>(
      EraMasteryNotifier.new,
    );

class EraMasteryNotifier extends AsyncNotifier<List<EraMasteryItemResponse>>
    with TaskRunnerMixin<List<EraMasteryItemResponse>> {
  @override
  Future<List<EraMasteryItemResponse>> build() async {
    final user = ref.watch(authUserProvider.select((s) => s.valueOrNull));
    if (user == null) {
      return [];
    }

    return getEraMastery();
  }

  Future<List<EraMasteryItemResponse>> getEraMastery() async {
    return runTask(
      flowName: 'EraMasteryFlow',
      startMessage: 'Obteniendo maestría de eras...',
      successMessage: 'Maestría obtenida exitosamente',
      errorMessage: 'ERROR al obtener maestría',
      action: () => ref.read(learningRepositoryProvider).getEraMastery(),
    );
  }
}
