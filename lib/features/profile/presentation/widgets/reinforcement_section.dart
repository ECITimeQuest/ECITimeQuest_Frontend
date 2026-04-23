import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';

class ReinforcementSection extends StatelessWidget {
  const ReinforcementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedCard(
      elevation: 0,
      color: AppColors.secondaryContainer,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.smart_toy,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Temas para reforzar',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Recomendaciones personalizadas\nde tu IA Tutor',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.black.withValues(alpha: 0.50),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildReinforcementCard(
            context,
            icon: Icons.palette,
            iconBgColor: AppColors.surfaceContainer,
            iconColor: AppColors.primary,
            title: 'Revolución\nFrancesa',
            subtitle: 'Próxima meta: 60%\nmaestría',
          ),
          const SizedBox(height: 12),
          _buildReinforcementCard(
            context,
            icon: Icons.history,
            iconBgColor: AppColors.surfaceContainer,
            iconColor: AppColors.primary,
            title: 'Era Industrial',
            subtitle: 'Repasar inventos clave',
          ),
        ],
      ),
    );
  }

  Widget _buildReinforcementCard(
    BuildContext context, {
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return PaddedCard(
      elevation: 0,
      verticalPadding: 20,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.black.withValues(alpha: 0.50),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.black.withValues(alpha: 0.50),
          ),
        ],
      ),
    );
  }
}
