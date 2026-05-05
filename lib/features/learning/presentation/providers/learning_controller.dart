import 'dart:developer' as developer;
import 'package:flutter_app/features/learning/data/models/requests/finish_session_request.dart';
import 'package:flutter_app/features/learning/data/models/requests/start_session_request.dart';
import 'package:flutter_app/features/learning/data/models/requests/submit_answer_request.dart';
import 'package:flutter_app/features/learning/data/models/responses/learning_session_response.dart';
import 'package:flutter_app/features/learning/data/models/responses/submit_answer_response.dart';
import 'package:flutter_app/features/learning/data/providers/learning_provider.dart';
import 'package:flutter_app/features/learning/data/repositories/learning_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final learningControllerProvider =
    AsyncNotifierProvider<LearningNotifier, dynamic>(LearningNotifier.new);

class LearningNotifier extends AsyncNotifier<dynamic> {
  @override
  Future<dynamic> build() async => null;

  Future<LearningSessionResponse> startSession(
    StartSessionRequest request,
  ) async {
    return _runTask<LearningSessionResponse>(
      startMessage: 'Iniciando sesión de aprendizaje...',
      successMessage: 'Sesión iniciada exitosamente',
      errorMessage: 'ERROR al iniciar sesión',
      action: (repo) => repo.startSession(request),
    );
  }

  Future<SubmitAnswerResponse> submitAnswer(SubmitAnswerRequest request) async {
    return _runTask<SubmitAnswerResponse>(
      startMessage: 'Enviando respuesta...',
      successMessage: 'Respuesta procesada',
      errorMessage: 'ERROR al enviar respuesta',
      action: (repo) => repo.submitAnswer(request),
    );
  }

  Future<LearningSessionResponse> finishSession(
    FinishSessionRequest request,
    String sessionId,
  ) async {
    return _runTask<LearningSessionResponse>(
      startMessage: 'Finalizando sesión...',
      successMessage: 'Sesión finalizada exitosamente',
      errorMessage: 'ERROR al finalizar sesión',
      action: (repo) => repo.finishSession(request, sessionId),
    );
  }

  Future<T> _runTask<T>({
    required String startMessage,
    required String successMessage,
    required String errorMessage,
    required Future<T> Function(LearningRepository repo) action,
  }) async {
    final repo = ref.read(learningRepositoryProvider);
    state = const AsyncLoading<dynamic>();

    developer.log(startMessage, name: "LearningFlow", level: 800);

    final result = await AsyncValue.guard<T>(() async {
      return await action(repo);
    });

    if (result.hasError) {
      developer.log(
        errorMessage,
        name: "LearningFlow",
        error: result.error,
        stackTrace: result.stackTrace,
        level: 1000,
      );
    } else {
      developer.log(successMessage, name: "LearningFlow", level: 800);
    }

    state = result;

    return result.requireValue;
  }
}
