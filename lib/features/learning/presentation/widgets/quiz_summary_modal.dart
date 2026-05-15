import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/features/learning/data/models/responses/learning_session_response.dart';
import 'package:flutter_app/features/learning/presentation/widgets/reward_item.dart';

class QuizSummaryModal extends StatelessWidget {
  final LearningSessionResponse summary;
  final int correctAnswers;
  final int wrongAnswers;
  final VoidCallback onFinish;

  const QuizSummaryModal({
    super.key,
    required this.summary,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            summary.completed ? Icons.emoji_events : Icons.heart_broken_rounded,
            color: summary.completed ? Colors.amber : AppColors.error,
            size: 80,
          ),
          const SizedBox(height: 24),
          Text(
            summary.completed ? "¡Misión Completada!" : "Te quedaste sin vidas",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: summary.completed ? null : AppColors.error,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStat(
                context,
                Icons.check_circle,
                "$correctAnswers",
                "Correctas",
                AppColors.success,
              ),
              _buildStat(
                context,
                Icons.cancel,
                "$wrongAnswers",
                "Incorrectas",
                AppColors.error,
              ),
            ],
          ),
          const SizedBox(height: 40),
          RewardItem(
            icon: Icons.bolt,
            label: "+${summary.xpGained} XP Totales",
            color: Colors.orange,
            iconSize: 24,
          ),
          const SizedBox(height: 12),
          RewardItem(
            icon: Icons.monetization_on,
            label: "+${summary.coinsGained} Monedas Totales",
            color: Colors.amber,
            iconSize: 24,
          ),
          const SizedBox(height: 12),
          RewardItem(
            icon: summary.livesLost > 0
                ? Icons.favorite
                : Icons.favorite_border,
            label: summary.livesLost > 0
                ? "-${summary.livesLost} Vidas perdidas"
                : "¡Vidas intactas!",
            color: summary.livesLost > 0 ? AppColors.error : AppColors.success,
            iconSize: 24,
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onFinish,
              child: const Text("Volver al inicio"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(
    BuildContext context,
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(label, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}
