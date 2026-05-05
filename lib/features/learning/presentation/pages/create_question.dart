import 'package:flutter/material.dart';
import 'package:flutter_app/features/home/presentation/providers/navigation_provider.dart';
import 'package:flutter_app/features/learning/data/models/enums/task_type.dart';
import 'package:flutter_app/features/learning/data/models/requests/ia_task_context.dart';
import 'package:flutter_app/features/learning/data/models/requests/ia_task_request.dart';
import 'package:flutter_app/features/learning/data/models/requests/start_session_request.dart';
import 'package:flutter_app/features/learning/presentation/providers/ia_controller.dart';
import 'package:flutter_app/features/learning/presentation/providers/learning_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateQuestionPage extends ConsumerWidget {
  const CreateQuestionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iaState = ref.watch(iaProvider);
    final learningState = ref.watch(learningControllerProvider);

    final isLoading = iaState.isLoading || learningState.isLoading;
    final hasTaskId = iaState.hasValue && iaState.value?.taskId != null;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.psychology, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Generador de Quizzes con IA',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Paso 1: Generar la tarea de IA.\nPaso 2: Iniciar la sesión de aprendizaje.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),
            if (isLoading)
              const CircularProgressIndicator()
            else ...[
              ElevatedButton.icon(
                onPressed: () => _handleCreateTask(context, ref),
                icon: const Icon(Icons.auto_awesome),
                label: const Text('1. Generar Tarea IA'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 50),
                ),
              ),
              const SizedBox(height: 20),
              if (hasTaskId)
                ElevatedButton.icon(
                  onPressed: () => _handleStartQuiz(context, ref),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('2. Iniciar Quiz'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(250, 50),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _handleCreateTask(BuildContext context, WidgetRef ref) async {
    const quizContext = QuizContext(
      topicName: "Arte Renacentista",
      summary:
          "El Renacimiento fue una época fascinante que comenzó en Italia en el siglo XV y se extendió por toda Europa. Durante este tiempo, el arte floreció con nuevas ideas y técnicas. Los artistas se inspiraron en la naturaleza y en la antigüedad clásica, buscando representar la belleza y la realidad de una manera más precisa. Un ejemplo famoso de esta época es la Mona Lisa, pintada por Leonardo da Vinci en 1503, que se ha convertido en un símbolo del arte renacentista y es conocida por su misteriosa sonrisa.\n\nLos grandes maestros como Leonardo da Vinci, Miguel Ángel y Rafael, no solo eran artistas, sino también pensadores e inventores que exploraron muchas disciplinas. El arte renacentista se caracteriza por el uso de la perspectiva, que permite crear una ilusión de profundidad en las pinturas. Además, se prestó mucha atención a la anatomía humana y al uso de la luz y la sombra para dar volumen a las figuras. Este enfoque en el realismo y la belleza refleja un cambio en la manera de ver el mundo y el lugar del ser humano en él.",
      keyFacts: [
        "El Renacimiento comenzó en Italia en el siglo XV.",
        "La Mona Lisa fue pintada por Leonardo da Vinci en 1503.",
        "El arte renacentista se caracteriza por el uso de la perspectiva.",
        "Los grandes maestros del Renacimiento incluyen a Leonardo da Vinci, Miguel Ángel y Rafael.",
        "Los artistas se inspiraron en la naturaleza y en la antigüedad clásica.",
      ],
      funFact:
          "Leonardo da Vinci no solo fue un gran pintor, sino también un inventor que diseñó máquinas voladoras y otros dispositivos futuristas.",
    );

    final request = IATaskRequest(
      taskType: TaskType.quizGeneration,
      referenceId: "20000000-0000-0000-0000-000000000001",
      context: quizContext,
    );

    try {
      await ref.read(iaProvider.notifier).requestIATask(request);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('¡Tarea generada! Ahora puedes iniciar.'),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  Future<void> _handleStartQuiz(BuildContext context, WidgetRef ref) async {
    final iaState = ref.read(iaProvider);
    final taskId = iaState.value!.taskId!;

    try {
      // 1. Obtenemos la tarea terminada (con las preguntas)
      await ref.read(iaProvider.notifier).getIATask(taskId);

      // 2. Iniciamos la sesión de aprendizaje
      await ref
          .read(learningControllerProvider.notifier)
          .startSession(
            const StartSessionRequest(
              tipicId: "20000000-0000-0000-0000-000000000001",
            ),
          );

      // 3. "Redirigimos" cambiando el índice de navegación global
      ref.read(navigationIndexProvider.notifier).state =
          1; // Index de QuestionPage
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al iniciar: $e')));
      }
    }
  }
}
