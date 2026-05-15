import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/features/learning/presentation/providers/era_mastery_notifier.dart';

class MasterySection extends ConsumerStatefulWidget {
  const MasterySection({super.key});

  @override
  ConsumerState<MasterySection> createState() => _MasterySectionState();
}

class _MasterySectionState extends ConsumerState<MasterySection> {
  bool _showAll = false;
  static const int _initialLimit = 3;

  @override
  Widget build(BuildContext context) {
    final masteryAsync = ref.watch(eraMasteryProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Maestría en eras',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 20),
        masteryAsync.when(
          data: (masteries) {
            if (masteries.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text('Comienza a aprender para medir tu maestría.'),
                ),
              );
            }

            // Ordenamos por porcentaje de maestría (de mayor a menor)
            final sortedMasteries = [...masteries]
              ..sort(
                (a, b) => b.masteryPercentage.compareTo(a.masteryPercentage),
              );

            final displayedMasteries = _showAll
                ? sortedMasteries
                : sortedMasteries.take(_initialLimit).toList();

            return Column(
              children: [
                ...displayedMasteries.map((mastery) {
                  final percentageStr =
                      '${(mastery.masteryPercentage).toInt()}%';
                  return Column(
                    children: [
                      _buildProgressBar(
                        context,
                        title: mastery.periodName,
                        progress: mastery.masteryPercentage / 100,
                        percentage: percentageStr,
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                }),
                if (masteries.length > _initialLimit)
                  Center(
                    child: TextButton.icon(
                      onPressed: () => setState(() => _showAll = !_showAll),
                      icon: Icon(
                        _showAll
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                      ),
                      label: Text(
                        _showAll
                            ? 'Ver menos'
                            : 'Ver todas (${masteries.length})',
                      ),
                    ),
                  ),
              ],
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
