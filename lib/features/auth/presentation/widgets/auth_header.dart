import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon = Icons.castle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Card(
          color: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Icon(icon, color: Colors.white),
          ),
        ),
        Column(
          spacing: 5,
          children: [
            Text(title, style: Theme.of(context).textTheme.displayMedium),
            Text(subtitle),
          ],
        ),
      ],
    );
  }
}
