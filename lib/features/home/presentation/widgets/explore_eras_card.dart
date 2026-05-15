import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/app_button.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';
import 'package:flutter_app/features/home/presentation/providers/navigation_provider.dart';

class ExploreErasCard extends ConsumerWidget {
  const ExploreErasCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PaddedCard(
      color: AppColors.surfaceVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          Row(
            spacing: 8,
            children: [
              Icon(Icons.explore, color: AppColors.primary),
              Text(
                "Explorar Eras",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          const Text(
            "Sigue tu rastro por el renacimiento o salta a la revolución industrial",
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: AppButton(
              label: "¡Vamos!",
              onPressed: () {
                ref.read(navigationIndexProvider.notifier).state = 1;
              },
            ),
          ),
        ],
      ),
    );
  }
}
