import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';

class MasterySection extends StatelessWidget {
  const MasterySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Maestría en eras',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 20),
        _buildProgressBar(
          context,
          title: 'Historia Antigua',
          progress: 0.90,
          percentage: '90%',
        ),
        const SizedBox(height: 16),
        _buildProgressBar(
          context,
          title: 'Edad Media',
          progress: 0.65,
          percentage: '65%',
        ),
        const SizedBox(height: 16),
        _buildProgressBar(
          context,
          title: 'Historia Moderna',
          progress: 0.45,
          percentage: '45%',
        ),
      ],
    );
  }

  Widget _buildProgressBar(
    BuildContext context, {
    required String title,
    required double progress,
    required String percentage,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.bodyMedium),
            Text(percentage, style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: const Color(0xFFE2E8F0),
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.success),
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
