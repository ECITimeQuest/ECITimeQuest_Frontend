import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/theme/app_gradients.dart';
import 'package:flutter_app/core/widgets/app_toast.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';
import 'package:flutter_app/features/auth/data/models/enums/subscription_plan.dart';
import 'package:flutter_app/features/subscription/domain/subscription_plan.dart';
import 'package:flutter_app/features/subscription/presentation/providers/subscription_provider.dart';
import 'package:flutter_app/features/subscription/presentation/widgets/subscription_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Datos estáticos de los dos planes.
final List<SubscriptionPlanInfo> _plans = [
  SubscriptionPlanInfo(
    plan: SubscriptionPlan.free,
    name: 'Free',
    price: 'Gratis',
    priceSubtitle: 'para siempre',
    description: 'Ideal para comenzar tu viaje histórico.',
    features: const [
      SubscriptionFeature(label: '5 vidas por día', included: true),
      SubscriptionFeature(
        label: 'Acceso a tópicos básicos',
        included: true,
      ),
      SubscriptionFeature(
        label: 'Quizzes con contenido genérico',
        included: true,
      ),
      SubscriptionFeature(
        label: 'Vidas ilimitadas',
        included: false,
      ),
      SubscriptionFeature(
        label: 'Acceso a tópicos premium',
        included: false,
      ),
      SubscriptionFeature(
        label: 'Quizzes adaptados a tus dificultades',
        included: false,
      ),
      SubscriptionFeature(
        label: 'Explicaciones generadas por IA',
        included: false,
      ),
      SubscriptionFeature(
        label: 'Análisis completo de fortalezas y áreas de mejora',
        included: false,
      ),
    ],
  ),
  SubscriptionPlanInfo(
    plan: SubscriptionPlan.premium,
    name: 'Premium',
    price: r'$39.900',
    priceSubtitle: '/mes',
    description: 'La experiencia completa del Maestro del Tiempo.',
    features: const [
      SubscriptionFeature(label: 'Vidas ilimitadas', included: true),
      SubscriptionFeature(
        label: 'Acceso a tópicos premium',
        included: true,
      ),
      SubscriptionFeature(
        label: 'Quizzes adaptados a tus dificultades',
        included: true,
      ),
      SubscriptionFeature(
        label: 'Explicaciones generadas por IA',
        included: true,
      ),
      SubscriptionFeature(
        label: 'Análisis completo de fortalezas y áreas de mejora',
        included: true,
      ),
    ],
  ),
];

class SubscriptionPage extends ConsumerWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(subscriptionProvider);

    return asyncState.when(
      loading: () => const _SubscriptionLoadingView(),
      error: (error, _) => _SubscriptionErrorView(
        message: error.friendlyMessage,
        onRetry: () => ref.invalidate(subscriptionProvider),
      ),
      data: (state) => _SubscriptionContent(
        currentPlan: state.plan,
        onPlanSelected: (newPlan) =>
            _onPlanSelected(context, ref, newPlan),
        isChangingPlan: asyncState.isLoading,
      ),
    );
  }

  Future<void> _onPlanSelected(
    BuildContext context,
    WidgetRef ref,
    SubscriptionPlan newPlan,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => _PlanChangeDialog(newPlan: newPlan),
    );

    if (confirmed != true || !context.mounted) return;

    await ref.read(subscriptionProvider.notifier).changePlan(newPlan);

    if (!context.mounted) return;

    final hasError = ref.read(subscriptionProvider).hasError;
    if (hasError) {
      final errorMsg = ref.read(subscriptionProvider).error?.friendlyMessage ??
          'Error al cambiar el plan.';
      AppToast.error(errorMsg);
    } else {
      AppToast.success('¡Plan actualizado exitosamente!');
    }
  }
}

// ────────────────────────────────────────────────────────────
// Vista de carga
// ────────────────────────────────────────────────────────────
class _SubscriptionLoadingView extends StatelessWidget {
  const _SubscriptionLoadingView();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 300,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            CircularProgressIndicator(),
            Text('Cargando tu plan…'),
          ],
        ),
      ),
    );
  }
}

// ────────────────────────────────────────────────────────────
// Vista de error
// ────────────────────────────────────────────────────────────
class _SubscriptionErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _SubscriptionErrorView({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: 48,
              color: AppColors.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: const Text('Reintentar'),
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ────────────────────────────────────────────────────────────
// Contenido principal
// ────────────────────────────────────────────────────────────
class _SubscriptionContent extends StatelessWidget {
  final SubscriptionPlan currentPlan;
  final void Function(SubscriptionPlan) onPlanSelected;
  final bool isChangingPlan;

  const _SubscriptionContent({
    required this.currentPlan,
    required this.onPlanSelected,
    required this.isChangingPlan,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header ──────────────────────────────────────────────────
        _SubscriptionHeader(currentPlan: currentPlan),
        const SizedBox(height: 28),

        // ── Plan cards ──────────────────────────────────────────────
        ...List.generate(_plans.length, (i) {
          final planInfo = _plans[i];
          final isCurrent = planInfo.plan == currentPlan;

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SubscriptionCard(
              planInfo: planInfo,
              isCurrent: isCurrent,
              isLoading: isChangingPlan && !isCurrent,
              onTap: isCurrent ? null : () => onPlanSelected(planInfo.plan),
            ),
          );
        }),

        const SizedBox(height: 8),

        // ── Footer note ─────────────────────────────────────────────
        Center(
          child: Text(
            'Puedes cancelar o cambiar tu plan en cualquier momento.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.onSurfaceVariant.withValues(alpha: 0.7),
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

// ────────────────────────────────────────────────────────────
// Header con gradiente y tarjeta del plan actual
// ────────────────────────────────────────────────────────────
class _SubscriptionHeader extends StatelessWidget {
  final SubscriptionPlan currentPlan;

  const _SubscriptionHeader({required this.currentPlan});

  String get _planDisplayName {
    return switch (currentPlan) {
      SubscriptionPlan.free => 'Free',
      SubscriptionPlan.premium => 'Premium',
    };
  }

  IconData get _planIcon {
    return switch (currentPlan) {
      SubscriptionPlan.free => Icons.lock_open_rounded,
      SubscriptionPlan.premium => Icons.workspace_premium_rounded,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title block
        Text(
          'Suscripción',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        Text(
          'Elige el plan que mejor se adapte a tus necesidades.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 20),

        // Current plan highlight card
        PaddedCard(
          verticalPadding: 20,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            gradient: AppGradients.primaryCTA,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(_planIcon, color: Colors.white, size: 26),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TU PLAN ACTUAL',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                        letterSpacing: 1.5,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _planDisplayName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  spacing: 4,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 14,
                    ),
                    Text(
                      'Activo',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        Text(
          'Planes disponibles',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: AppColors.onSurface,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

// ────────────────────────────────────────────────────────────
// Modal de confirmación mejorado
// ────────────────────────────────────────────────────────────
class _PlanChangeDialog extends StatelessWidget {
  final SubscriptionPlan newPlan;

  const _PlanChangeDialog({required this.newPlan});

  bool get _isUpgrade => newPlan == SubscriptionPlan.premium;

  String get _planName => _isUpgrade ? 'Premium' : 'Free';

  IconData get _planIcon =>
      _isUpgrade ? Icons.workspace_premium_rounded : Icons.lock_open_rounded;

  String get _subtitle => _isUpgrade
      ? 'Obtén acceso a tópicos premium, quizzes personalizados y explicaciones de IA.'
      : 'Volverás al plan gratuito con acceso limitado.';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Cabecera con gradiente ──────────────────────────────
          Container(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
            decoration: const BoxDecoration(gradient: AppGradients.primaryCTA),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(_planIcon, color: Colors.white, size: 32),
                ),
                const SizedBox(height: 12),
                Text(
                  'Cambiar a $_planName',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // ── Cuerpo ─────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Text(
                  _subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
                Row(
                  spacing: 12,
                  children: [
                    // Cancelar
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: BorderSide(
                            color: AppColors.onSurfaceVariant.withValues(
                              alpha: 0.3,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text('Cancelar'),
                      ),
                    ),
                    // Confirmar
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.primary, AppColors.secondary],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: FilledButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'Confirmar',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
