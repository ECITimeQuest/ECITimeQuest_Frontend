import 'package:flutter/material.dart';

class RewardItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final double iconSize;

  const RewardItem({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    this.iconSize = 22,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: iconSize),
        const SizedBox(width: 10),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: color,
              ),
        ),
      ],
    );
  }
}
