import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildStatCard(
          context,
          icon: Icons.star_rounded,
          iconColor: AppColors.primary,
          iconBgColor: AppColors.surfaceContainer,
          title: 'NIVEL',
          value: '12',
        ),
        const SizedBox(height: 16),
        _buildStatCard(
          context,
          icon: Icons.local_fire_department_rounded,
          iconColor: AppColors.fire,
          iconBgColor: AppColors.fireContainer,
          title: 'RACHA DE',
          value: '15 días',
        ),
        const SizedBox(height: 16),
        _buildStatCard(
          context,
          icon: Icons.monetization_on_rounded,
          iconColor: AppColors.tertiary,
          iconBgColor: AppColors.tertiaryContainer,
          title: 'TOTAL MONEDAS',
          value: '450',
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.black.withValues(alpha: 0.50),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppColors.onSurface),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
