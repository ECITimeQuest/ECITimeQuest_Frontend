import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int) onTabChange;
  const BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: GNav(
        gap: 8,
        color: AppColors.onSurface,
        activeColor: AppColors.primary,
        tabBackgroundColor: AppColors.surfaceVariant,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onTabChange: (value) => onTabChange(value),
        tabs: [
          GButton(icon: Icons.castle, text: 'HOME'),
          GButton(icon: Icons.map, text: 'MAP'),
          GButton(icon: Icons.smart_toy, text: 'TUTOR'),
          GButton(icon: Icons.person, text: 'PROFILE'),
        ],
      ),
    );
  }
}
