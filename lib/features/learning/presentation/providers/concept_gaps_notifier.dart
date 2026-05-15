import 'package:flutter_app/core/utils/task_runner_mixin.dart';
import 'package:flutter_app/features/learning/data/models/responses/concept_gap_response.dart';
import 'package:flutter_app/features/learning/data/providers/learning_provider.dart';
import 'package:flutter_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final conceptGapsProvider =
    AsyncNotifierProvider<ConceptGapsNotifier, List<ConceptGapResponse>>(
      ConceptGapsNotifier.new,
    );

class ConceptGapsNotifier extends AsyncNotifier<List<ConceptGapResponse>>
    with TaskRunnerMixin<List<ConceptGapResponse>> {
  Future<List<ConceptGapResponse>>? _ongoingFetch;

  @override
  Future<List<ConceptGapResponse>> build() async {
    final userId = ref.watch(authUserProvider.select((s) => s.valueOrNull?.id));
    if (userId == null) return [];
    return getConceptGaps();
  }

  Future<List<ConceptGapResponse>> getConceptGaps() async {
    if (_ongoingFetch != null) return _ongoingFetch!;

    _ongoingFetch = runTask(
      flowName: 'ConceptGapsFlow',
      startMessage: 'Obteniendo vacíos conceptuales...',
      successMessage: 'Vacíos conceptuales obtenidos exitosamente',
      errorMessage: 'ERROR al obtener vacíos conceptuales',
      action: () => ref.read(learningRepositoryProvider).getConceptGaps(),
    );

    try {
      return await _ongoingFetch!;
    } finally {
      _ongoingFetch = null;
    }
  }
}
