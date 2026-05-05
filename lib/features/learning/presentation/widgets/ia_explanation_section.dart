import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/reinforcement_card.dart';
import 'package:flutter_app/features/learning/data/models/responses/ia_task_data.dart';
import 'package:flutter_app/features/learning/data/models/responses/ia_task_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IAExplanationSection extends StatelessWidget {
  final AsyncValue<IATaskResponse?> iaState;

  const IAExplanationSection({super.key, required this.iaState});

  @override
  Widget build(BuildContext context) {
    if (iaState.isLoading) {
      return const Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text("La IA está analizando tu respuesta..."),
        ],
      );
    }

    if (iaState.hasError) {
      return const Text("No se pudo cargar la explicación en este momento.");
    }

    final taskResponse = iaState.value;

    if (taskResponse != null &&
        taskResponse.data is AnswerExplanationResponse) {
      final data = taskResponse.data as AnswerExplanationResponse;

      return ReinforcementCard(
        title: "Análisis de tu Tutor IA",
        subtitle: "Basado en tu respuesta anterior",
        children: [
          Text(
            data.explanation,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.lightbulb,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        data.keyConcept,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                if (data.tip.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    data.tip,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ],
            ),
          ),
        ],
      );
    }

    return const Text("Cargando explicación...");
  }
}
