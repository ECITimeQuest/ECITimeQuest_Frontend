import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';
import 'package:flutter_app/features/learning/presentation/providers/user_badges_notifier.dart';

class BadgesSection extends ConsumerWidget {
  const BadgesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final badgesAsync = ref.watch(userBadgesProvider);

    return PaddedCard(
      elevation: 0,
      color: AppColors.surfaceContainer,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Insignias',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 20),
          badgesAsync.when(
            data: (badges) {
              if (badges.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text('¡Empieza a aprender para ganar insignias!'),
                );
              }
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Row(
                  children: badges.map((badge) {
                    final isLast = badges.last == badge;
                    return Padding(
                      padding: EdgeInsets.only(right: isLast ? 0 : 16),
                      child: SizedBox(
                        width: 150,
                        child: _buildBadgeCard(context, title: badge.badgeName),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (err, _) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeCard(BuildContext context, {required String title}) {
    return PaddedCard(
      // verticalPadding: 16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.tertiaryContainer,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.emoji_events,
              color: AppColors.tertiary,
              size: 32,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
