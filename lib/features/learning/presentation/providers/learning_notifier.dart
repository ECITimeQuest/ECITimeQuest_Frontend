import 'package:flutter_app/core/utils/task_runner_mixin.dart';
import 'package:flutter_app/features/learning/data/models/requests/finish_session_request.dart';
import 'package:flutter_app/features/learning/data/models/requests/start_session_request.dart';
import 'package:flutter_app/features/learning/data/models/requests/submit_answer_request.dart';
import 'package:flutter_app/features/learning/data/models/responses/learning_session_response.dart';
import 'package:flutter_app/features/learning/data/models/responses/submit_answer_response.dart';
import 'package:flutter_app/features/learning/data/providers/learning_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final learningControllerProvider =
    AsyncNotifierProvider<LearningNotifier, dynamic>(LearningNotifier.new);

class LearningNotifier extends AsyncNotifier<dynamic>
    with TaskRunnerMixin<dynamic> {
  @override
  Future<dynamic> build() async => null;

  Future<LearningSessionResponse> startSession(
    StartSessionRequest request,
  ) async {
    return runTask(
      flowName: 'LearningFlow',
      startMessage: 'Iniciando sesión de aprendizaje...',
      successMessage: 'Sesión iniciada exitosamente',
      errorMessage: 'ERROR al iniciar sesión',
      action: () => ref.read(learningRepositoryProvider).startSession(request),
    );
  }

  Future<SubmitAnswerResponse> submitAnswer(SubmitAnswerRequest request) async {
    return runTask(
      flowName: 'LearningFlow',
      startMessage: 'Enviando respuesta...',
      successMessage: 'Respuesta procesada',
      errorMessage: 'ERROR al enviar respuesta',
      action: () => ref.read(learningRepositoryProvider).submitAnswer(request),
    );
  }

  Future<LearningSessionResponse> finishSession(
    FinishSessionRequest request,
    String sessionId,
  ) async {
    return runTask(
      flowName: 'LearningFlow',
      startMessage: 'Finalizando sesión...',
      successMessage: 'Sesión finalizada exitosamente',
      errorMessage: 'ERROR al finalizar sesión',
      action: () => ref
          .read(learningRepositoryProvider)
          .finishSession(request, sessionId),
    );
  }
}
