import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';
import 'package:flutter_app/features/learning/presentation/providers/home_summary_notifier.dart';
import 'package:flutter_app/features/learning/presentation/providers/user_progress_notifier.dart';

class MissionStateCard extends ConsumerStatefulWidget {
  const MissionStateCard({super.key});

  @override
  ConsumerState<MissionStateCard> createState() => _MissionStateCardState();
}

class _MissionStateCardState extends ConsumerState<MissionStateCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.invalidate(homeSummaryProvider);
      ref.invalidate(userProgressProvider);
    });
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours > 0) return "${difference.inHours} horas";
      if (difference.inMinutes > 0) return "${difference.inMinutes} min";
      return "Ahora";
    } else if (difference.inDays == 1) {
      return "Ayer";
    } else {
      return "${date.day}/${date.month}";
    }
  }

  @override
  Widget build(BuildContext context) {
    final summaryAsync = ref.watch(homeSummaryProvider);
    final progressAsync = ref.watch(userProgressProvider);

    return summaryAsync.when(
      data: (summary) {
        if (summary == null) {
          return const SizedBox.shrink();
        }

        return PaddedCard(
          elevation: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ESTADO DE LA MISIÓN",
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: Colors.black.withValues(alpha: 0.50),
                                letterSpacing: 1.5,
                              ),
                        ),
                        Text(
                          summary.lastStudiedEra?.periodName ??
                              "Inicia tu viaje",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  Chip(
                    label: Text(
                      "Nivel ${progressAsync.maybeWhen(data: (p) => p?.level ?? 1, orElse: () => 1)}",
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Progreso actual",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        "${(summary.lastStudiedEra?.completionPercentage ?? 0.0).toStringAsFixed(0)}%",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  LinearProgressIndicator(
                    value:
                        (summary.lastStudiedEra?.completionPercentage ?? 0.0) /
                        100,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _MissionStateCardItem(
                      text: "Ultima vez que estudiaste",
                      value: summary.lastStudiedEra != null
                          ? _formatDate(summary.lastStudiedEra!.lastStudiedAt)
                          : "---",
                    ),
                  ),
                  Expanded(
                    child: _MissionStateCardItem(
                      text: "Eras completadas",
                      value:
                          "${summary.completedErasCount}/${summary.totalErasCount}",
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (err, stack) => const SizedBox.shrink(),
    );
  }
}

class _MissionStateCardItem extends StatelessWidget {
  final String text;
  final String value;

  const _MissionStateCardItem({required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return PaddedCard(
      verticalPadding: 20,
      color: AppColors.surfaceVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(text),
          Text(value, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
