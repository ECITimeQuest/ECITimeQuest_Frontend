import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/utils/error_handler.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';
import 'package:flutter_app/core/widgets/upgrade_plan_widget.dart';
import 'package:flutter_app/features/home/presentation/providers/navigation_provider.dart';
import 'package:flutter_app/features/content/data/models/responses/historical_period_response.dart';
import 'package:flutter_app/features/content/presentation/pages/topics_list_page.dart';
import 'package:flutter_app/features/content/presentation/providers/content_notifier.dart';
import 'package:flutter_app/features/learning/presentation/providers/user_progress_notifier.dart';
import 'package:flutter_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PeriodsListPage extends ConsumerStatefulWidget {
  const PeriodsListPage({super.key});

  @override
  ConsumerState<PeriodsListPage> createState() => _PeriodsListPageState();
}

class _PeriodsListPageState extends ConsumerState<PeriodsListPage> {
  bool _isLoading = true;
  String? _errorMessage;
  List<HistoricalPeriodResponse> _periods = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadPeriods();
    });
  }

  Future<void> _loadPeriods() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final periods = await ref
          .read(contentControllerProvider.notifier)
          .listPeriods();

      setState(() {
        _periods = periods;
      });
    } catch (e) {
      setState(() {
        _errorMessage = ErrorHandler.getMessage(e);
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _goToTopics(HistoricalPeriodResponse period) {
    final user = ref.read(authUserProvider).valueOrNull;
    final isPremium = user?.subscriptionPlan.isPremium ?? false;
    final progress = ref.read(userProgressProvider).valueOrNull;

    if (!isPremium && progress != null && progress.lives <= 0) {
      showDialog(
        context: context,
        builder: (context) => const UpgradePlanWidget(
          title: '¡Te quedaste sin vidas!',
          message:
              'Pásate a Premium para tener vidas infinitas y seguir aprendiendo sin interrupciones.',
        ),
      );
      return;
    }

    ref.read(homeOverlayProvider.notifier).state = TopicsListPage(
      periodId: period.id,
      periodName: period.name,
      periodDescription: period.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Períodos Históricos',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 20),
        if (_isLoading)
          const Center(child: CircularProgressIndicator())
        else if (_errorMessage != null)
          Center(
            child: Column(
              children: [
                Icon(Icons.error_outline, color: AppColors.error, size: 48),
                const SizedBox(height: 16),
                Text(
                  _errorMessage!,
                  style: TextStyle(color: AppColors.error),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _loadPeriods,
                  child: const Text('Reintentar'),
                ),
              ],
            ),
          )
        else if (_periods.isEmpty)
          const Center(
            child: Text('No hay períodos disponibles en este momento.'),
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _periods.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final period = _periods[index];
              return InkWell(
                onTap: () => _goToTopics(period),
                borderRadius: BorderRadius.circular(16),
                child: PaddedCard(
                  verticalPadding: 20,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.history_edu,
                          color: AppColors.secondary,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              period.name,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              period.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (period.startYear != null &&
                                period.endYear != null) ...[
                              const SizedBox(height: 15),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceVariant,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '${period.startYear} - ${period.endYear}',
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.chevron_right,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
