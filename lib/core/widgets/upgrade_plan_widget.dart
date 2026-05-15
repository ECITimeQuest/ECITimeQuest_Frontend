import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/app_button.dart';
import 'package:flutter_app/features/home/presentation/providers/navigation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpgradePlanWidget extends ConsumerWidget {
  final String title;
  final String message;
  final VoidCallback? onUpgradeTap;
  final bool isDialog;
  final bool showButtons;

  const UpgradePlanWidget({
    super.key,
    this.title = 'Desbloquea el Poder de la IA',
    required this.message,
    this.onUpgradeTap,
    this.isDialog = true,
    this.showButtons = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final card = Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Decorative AI Glass effect
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.aiGlass,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.workspace_premium,
                  color: AppColors.tertiary,
                  size: 64,
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (showButtons) ...[
                  const SizedBox(height: 32),
                  AppButton(
                    label: 'Mejorar a Premium',
                    icon: const Icon(Icons.star, color: AppColors.primary),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.tertiary,
                      foregroundColor: AppColors.primary,
                    ),
                    onPressed:
                        onUpgradeTap ??
                        () {
                          // Navegar al tab de suscripción (índice 2)
                          ref.read(navigationIndexProvider.notifier).state = 2;
                          ref.read(homeOverlayProvider.notifier).state = null;
                          if (isDialog && Navigator.of(context).canPop()) {
                            Navigator.of(context).pop();
                          }
                        },
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      if (isDialog && Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                    },
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    child: const Text('Quizás más tarde'),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
    if (!isDialog) {
      return card;
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: card,
    );
  }
}
