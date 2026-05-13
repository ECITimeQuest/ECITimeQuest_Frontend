import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/features/learning/presentation/providers/user_progress_notifier.dart';

class NavbarItem extends ConsumerWidget {
  const NavbarItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressState = ref.watch(userProgressProvider);
    final progress = progressState.valueOrNull;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Row(
        spacing: 15,
        children: [
          _NavbarStatItem(
            value: progress?.streakDay.toString() ?? '0',
            icon: Icons.local_fire_department,
            iconColor: AppColors.fire,
          ),
          _NavbarStatItem(
            value: progress?.lives.toString() ?? '5',
            icon: Icons.favorite,
            iconColor: AppColors.heart,
          ),
          _NavbarStatItem(
            value: progress?.coins.toString() ?? '0',
            icon: Icons.monetization_on,
            iconColor: AppColors.tertiary,
          ),
        ],
      ),
    );
  }
}

class _NavbarStatItem extends StatelessWidget {
  final String value;
  final IconData icon;
  final Color iconColor;

  const _NavbarStatItem({
    required this.value,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 3,
      children: [
        Text(value),
        Icon(icon, color: iconColor, size: 18),
      ],
    );
  }
}
