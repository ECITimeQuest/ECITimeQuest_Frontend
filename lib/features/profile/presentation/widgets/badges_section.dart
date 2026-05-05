import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';

class BadgesSection extends StatelessWidget {
  const BadgesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedCard(
      elevation: 0,
      color: AppColors.surfaceContainer,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Insignias', style: Theme.of(context).textTheme.titleMedium),
              Text(
                'Ver todas',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildBadgeCard(
                  context,
                  icon: Icons.account_balance,
                  iconBgColor: const Color(0xFFE6E6FA),
                  iconColor: AppColors.primary,
                  title: 'Maestro de\nRoma',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildBadgeCard(
                  context,
                  icon: Icons.lightbulb,
                  iconBgColor: const Color(0xFFFFE4FE),
                  iconColor: const Color(0xFF9B59B6),
                  title: 'Curioso de la\nIlustración',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeCard(
    BuildContext context, {
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
  }) {
    return PaddedCard(
      verticalPadding: 25,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 32),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
