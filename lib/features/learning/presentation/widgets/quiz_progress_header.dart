import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';

class QuizProgressHeader extends StatelessWidget {
  final String moduleName;
  final String chipContent;
  final double progress;

  const QuizProgressHeader({
    super.key,
    required this.moduleName,
    required this.chipContent,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Text(
                    'MÓDULO: $moduleName',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.black.withValues(alpha: 0.50),
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    'Progreso del desafío',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Chip(
              label: Text(chipContent),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
        LinearProgressIndicator(value: progress),
      ],
    );
  }
}
