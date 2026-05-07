import 'package:flutter_app/core/utils/task_runner_mixin.dart';
import 'package:flutter_app/features/learning/data/models/requests/ia_task_request.dart';
import 'package:flutter_app/features/learning/data/models/enums/task_status.dart';
import 'package:flutter_app/features/learning/data/models/responses/ia_task_response.dart';
import 'package:flutter_app/features/learning/data/providers/ia_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final iaProvider = AsyncNotifierProvider<IANotifier, IATaskResponse?>(
  IANotifier.new,
);

class IANotifier extends AsyncNotifier<IATaskResponse?>
    with TaskRunnerMixin<IATaskResponse?> {
  @override
  Future<IATaskResponse?> build() async => null;

  Future<IATaskResponse> requestIATask(IATaskRequest request) async {
    return runTask(
      flowName: 'IATaskFlow',
      startMessage: 'Iniciando solicitud crear tarea con IA...',
      successMessage: 'Tarea creada exitosamente',
      errorMessage: 'ERROR en el flujo de creación de tarea',
      action: () => ref.read(iaRepositoryProvider).requestIATask(request),
    );
  }

  Future<IATaskResponse> getIATask(String taskId) async {
    return runTask(
      flowName: 'IATaskFlow',
      startMessage: 'Iniciando solicitud obtener tarea con IA...',
      successMessage: 'Tarea obtenida exitosamente',
      errorMessage: 'ERROR en el flujo de obtención de tarea',
      action: () => ref.read(iaRepositoryProvider).getIATask(taskId),
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

  Future<IATaskResponse> requestAndPollTask<T>(
    IATaskRequest request, {
    int maxRetries = 15,
  }) async {
    final taskResponse = await requestIATask(request);

    if (taskResponse.source == 'cache' ||
        taskResponse.taskStatus == TaskStatus.completed) {
      if (taskResponse.data is! T) {
        throw Exception('El tipo de dato retornado no es $T');
      }
      return taskResponse;
    }

    if (taskResponse.taskId == null) {
      throw Exception('No se recibió un ID de tarea para hacer polling');
    }

    final completedTask = await pollIATask(
      taskResponse.taskId!,
      maxRetries: maxRetries,
    );

    if (completedTask.data is! T) {
      throw Exception('El tipo de dato retornado no es $T');
    }

    return completedTask;
  }
}
