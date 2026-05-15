import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';
import 'package:flutter_app/core/widgets/reinforcement_card.dart';
import 'package:flutter_app/features/auth/data/models/enums/subscription_plan.dart';
import 'package:flutter_app/features/home/presentation/providers/navigation_provider.dart';
import 'package:flutter_app/features/profile/presentation/widgets/badges_section.dart';
import 'package:flutter_app/features/profile/presentation/widgets/mastery_section.dart';
import 'package:flutter_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:flutter_app/features/profile/presentation/widgets/profile_stats.dart';
import 'package:flutter_app/features/subscription/presentation/pages/subscription_page.dart';
import 'package:flutter_app/features/subscription/presentation/providers/subscription_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Usamos la extensión currentPlanOrFree para obtener el plan sin manejar AsyncValue aquí.
    final currentPlan = ref.watch(subscriptionProvider).currentPlanOrFree;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ProfileHeader(),
        const SizedBox(height: 40),
        const ProfileStats(),
        const SizedBox(height: 40),
        const MasterySection(),
        const SizedBox(height: 32),
        const BadgesSection(),
        const SizedBox(height: 32),
        // ── Subscription access card ──────────────────────────────
        _SubscriptionAccessCard(
          currentPlan: currentPlan,
          onTap: () {
            ref.read(homeOverlayProvider.notifier).state =
                const SubscriptionPage();
          },
        ),
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

class _SubscriptionAccessCard extends StatelessWidget {
  final SubscriptionPlan currentPlan;
  final VoidCallback onTap;

  const _SubscriptionAccessCard({
    required this.currentPlan,
    required this.onTap,
  });

  String get _planLabel {
    return switch (currentPlan) {
      SubscriptionPlan.free => 'Free',
      SubscriptionPlan.premium => 'Premium',
    };
  }

  Color get _planColor {
    return switch (currentPlan) {
      SubscriptionPlan.free => AppColors.onSurfaceVariant,
      SubscriptionPlan.premium => AppColors.primary,
    };
  }

  IconData get _planIcon {
    return switch (currentPlan) {
      SubscriptionPlan.free => Icons.lock_open_rounded,
      SubscriptionPlan.premium => Icons.workspace_premium_rounded,
    };
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: PaddedCard(
        verticalPadding: 20,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _planColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(_planIcon, color: _planColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mi suscripción',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Plan actual: $_planLabel',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: _planColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.black.withValues(alpha: 0.40),
            ),
          ],
        ),
      ),
    );
  }
}
