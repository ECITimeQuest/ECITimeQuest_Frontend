import 'dart:developer' as developer;

import 'package:flutter_app/features/learning/data/models/requests/ia_task_request.dart';
import 'package:flutter_app/features/learning/data/models/enums/task_status.dart';
import 'package:flutter_app/features/learning/data/models/responses/ia_task_response.dart';
import 'package:flutter_app/features/learning/data/providers/ia_provider.dart';
import 'package:flutter_app/features/learning/data/repositories/ia_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final iaProvider = AsyncNotifierProvider<IANotifier, IATaskResponse?>(
  IANotifier.new,
);

class IANotifier extends AsyncNotifier<IATaskResponse?> {
  @override
  Future<IATaskResponse?> build() async => null;

  Future<IATaskResponse> requestIATask(IATaskRequest request) async {
    return _runIATask(
      startMessage: 'Iniciando solicitud crear tarea con IA...',
      successMessage: 'Tarea creada exitosamente',
      errorMessage: 'ERROR en el flujo de creación de tarea',
      action: (repo) => repo.requestIATask(request),
    );
  }

  Future<IATaskResponse> getIATask(String taskId) async {
    return _runIATask(
      startMessage: 'Iniciando solicitud obtener tarea con IA...',
      successMessage: 'Tarea obtenida exitosamente',
      errorMessage: 'ERROR en el flujo de obtención de tarea',
      action: (repo) => repo.getIATask(taskId),
    );
  }

  Future<IATaskResponse> pollIATask(
    String taskId, {
    int maxRetries = 10,
  }) async {
    int retries = 0;
    IATaskResponse response;

    while (retries < maxRetries) {
      response = await getIATask(taskId);

      if (response.taskStatus == TaskStatus.completed) {
        return response;
      }

      if (response.taskStatus == TaskStatus.failed) {
        throw Exception(response.error ?? 'La tarea de IA falló');
      }

      await Future.delayed(const Duration(seconds: 2));
      retries++;
    }

    throw Exception('Tiempo de espera agotado para la tarea de IA');
  }

  Future<IATaskResponse> _runIATask({
    required String startMessage,
    required String successMessage,
    required String errorMessage,
    required Future<IATaskResponse> Function(IARepository repo) action,
  }) async {
    final repo = ref.read(iaRepositoryProvider);
    state = const AsyncLoading<IATaskResponse>();

    developer.log(startMessage, name: "IATaskFlow", level: 800);

    final result = await AsyncValue.guard<IATaskResponse>(() async {
      return await action(repo);
    });

    if (result.hasError) {
      developer.log(
        errorMessage,
        name: "IATaskFlow",
        stackTrace: result.stackTrace,
        level: 1000,
      );
    } else {
      developer.log(successMessage, name: "IATaskFlow", level: 800);
    }

    state = result;

    return result.requireValue;
  }
}
