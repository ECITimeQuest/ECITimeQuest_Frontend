import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:flutter_app/features/profile/presentation/widgets/profile_stats.dart';
import 'package:flutter_app/features/profile/presentation/widgets/mastery_section.dart';
import 'package:flutter_app/features/profile/presentation/widgets/badges_section.dart';
import 'package:flutter_app/core/widgets/reinforcement_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfileHeader(),
        const SizedBox(height: 40),
        ProfileStats(),
        const SizedBox(height: 40),
        MasterySection(),
        const SizedBox(height: 32),
        BadgesSection(),
        const SizedBox(height: 32),
        ReinforcementCard(
          title: 'Temas para reforzar',
          subtitle: 'Recomendaciones personalizadas\nde tu IA Tutor',
          children: [
            ReinforcementCard.buildReinforcementCard(
              context,
              icon: Icons.palette,
              iconBgColor: AppColors.surfaceContainer,
              iconColor: AppColors.primary,
              title: 'Revolución\nFrancesa',
              subtitle: 'Próxima meta: 60%\nmaestría',
            ),
            const SizedBox(height: 12),
            ReinforcementCard.buildReinforcementCard(
              context,
              icon: Icons.history,
              iconBgColor: AppColors.surfaceContainer,
              iconColor: AppColors.primary,
              title: 'Era Industrial',
              subtitle: 'Repasar inventos clave',
            ),
          ],
        ),
      ],
    );
  }
}
