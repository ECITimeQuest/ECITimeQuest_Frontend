import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';
import 'package:flutter_app/features/home/presentation/providers/navigation_provider.dart';

class AiTutorCard extends ConsumerWidget {
  const AiTutorCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PaddedCard(
      color: AppColors.secondaryContainer,
      child: Row(
        spacing: 35,
        children: [
          Icon(Icons.person, color: AppColors.secondary, size: 40),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  "TUTOR DE IA",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '"¡Hola!, Haz un seguimiento de tu progreso y debilidades"',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    ref.read(navigationIndexProvider.notifier).state = 2;
                  },
                  child: Row(
                    spacing: 8,
                    children: [
                      Text(
                        "Hacer seguimiento",
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Icon(
                        Icons.arrow_forward_outlined,
                        color: AppColors.secondary,
                        size: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
