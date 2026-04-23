import 'package:avatar_stack/animated_avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';

class ExploreErasCard extends StatelessWidget {
  const ExploreErasCard({super.key});

  @override
  Widget build(BuildContext context) {
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
          Text(
            "Sigue tu rastro por la ilustración o salta a la era de los Samuráis",
          ),
          AnimatedAvatarStack(
            height: 40,
            width: 120,
            settings: RestrictedPositions(maxCoverage: 0.45, minCoverage: 0.25),
            infoWidgetBuilder: (surplus, context) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                alignment: Alignment.center,
                child: Text(
                  '+$surplus',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            avatars: List.generate(
              15,
              (n) => NetworkImage('https://i.pravatar.cc/150?img=$n'),
            ),
          ),
        ],
      ),
    );
  }
}
