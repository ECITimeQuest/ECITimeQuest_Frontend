import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';

class NavbarItem extends StatelessWidget {
  const NavbarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Row(
        spacing: 15,
        children: const [
          _NavbarStatItem(
            value: '5',
            icon: Icons.local_fire_department,
            iconColor: AppColors.fire,
          ),
          _NavbarStatItem(
            value: '3',
            icon: Icons.favorite,
            iconColor: AppColors.heart,
          ),
          _NavbarStatItem(
            value: '120',
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
