import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/features/subscription/domain/subscription_plan.dart';

/// Badge que aparece sobre la tarjeta del plan actual.
class CurrentPlanBanner extends StatelessWidget {
  const CurrentPlanBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          const Icon(Icons.check_circle, color: Colors.white, size: 13),
          Text(
            'Plan actual',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

/// Fila de beneficio individual de un plan.
class FeatureItem extends StatelessWidget {
  final String label;
  final bool included;

  const FeatureItem({super.key, required this.label, required this.included});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            included ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: included ? AppColors.success : Colors.black26,
            size: 18,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: included
                    ? AppColors.onSurface
                    : AppColors.onSurface.withValues(alpha: 0.45),
                decoration: included ? null : TextDecoration.lineThrough,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Tarjeta de plan de suscripción.
class SubscriptionCard extends StatefulWidget {
  final SubscriptionPlanInfo planInfo;
  final bool isCurrent;
  final bool isLoading;
  final VoidCallback? onTap;

  const SubscriptionCard({
    super.key,
    required this.planInfo,
    required this.isCurrent,
    this.isLoading = false,
    this.onTap,
  });

  @override
  State<SubscriptionCard> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
      lowerBound: 0.97,
      upperBound: 1.0,
      value: 1.0,
    );
    _scaleAnim = _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails _) => _controller.reverse();
  void _onTapUp(TapUpDetails _) => _controller.forward();
  void _onTapCancel() => _controller.forward();

  Color get _accentColor {
    return switch (widget.planInfo.plan) {
      SubscriptionPlan.free => AppColors.onSurfaceVariant,
      SubscriptionPlan.premium => AppColors.primary,
    };
  }

  Color get _badgeColor {
    return switch (widget.planInfo.plan) {
      SubscriptionPlan.free => AppColors.surfaceVariant,
      SubscriptionPlan.premium => AppColors.tertiaryContainer,
    };
  }

  IconData get _planIcon {
    return switch (widget.planInfo.plan) {
      SubscriptionPlan.free => Icons.lock_open_rounded,
      SubscriptionPlan.premium => Icons.workspace_premium_rounded,
    };
  }

  String get _buttonLabel {
    if (widget.isCurrent) return 'Plan actual';
    return switch (widget.planInfo.plan) {
      SubscriptionPlan.free => 'Cambiar a Free',
      SubscriptionPlan.premium => 'Actualizar a Premium',
    };
  }

  @override
  Widget build(BuildContext context) {
    final isHighlighted = widget.isCurrent;

    return GestureDetector(
      onTapDown: widget.isCurrent ? null : _onTapDown,
      onTapUp: widget.isCurrent ? null : _onTapUp,
      onTapCancel: widget.isCurrent ? null : _onTapCancel,
      child: ScaleTransition(
        scale: _scaleAnim,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: isHighlighted
                  ? _accentColor
                  : Colors.transparent,
              width: 2.5,
            ),
            boxShadow: [
              BoxShadow(
                color: isHighlighted
                    ? _accentColor.withValues(alpha: 0.18)
                    : Colors.black.withValues(alpha: 0.06),
                blurRadius: isHighlighted ? 24 : 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Plan icon badge
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: _badgeColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(_planIcon, color: _accentColor, size: 22),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.planInfo.name,
                            style: Theme.of(
                              context,
                            ).textTheme.titleSmall?.copyWith(
                              color: _accentColor,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.planInfo.description,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              color: AppColors.onSurfaceVariant,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.isCurrent) const CurrentPlanBanner(),
                  ],
                ),

                const SizedBox(height: 18),
                const Divider(height: 1, color: Color(0xFFEFF3F8)),
                const SizedBox(height: 18),

                // Price
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.planInfo.price,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(color: _accentColor),
                    ),
                    const SizedBox(width: 4),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        widget.planInfo.priceSubtitle,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(
                          color: AppColors.onSurfaceVariant,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // Features list
                ...widget.planInfo.features.map(
                  (f) => FeatureItem(label: f.label, included: f.included),
                ),

                const SizedBox(height: 22),

                // Action button
                SizedBox(
                  width: double.infinity,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: widget.isCurrent ? 0.55 : 1.0,
                    child: FilledButton(
                      onPressed: widget.isCurrent ? null : widget.onTap,
                      style: FilledButton.styleFrom(
                        backgroundColor: widget.isCurrent
                            ? AppColors.surfaceContainer
                            : _accentColor,
                        foregroundColor: widget.isCurrent
                            ? AppColors.onSurfaceVariant
                            : Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: widget.isLoading
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              _buttonLabel,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
