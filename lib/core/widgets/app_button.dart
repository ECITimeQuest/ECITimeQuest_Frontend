import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Widget? icon;
  final ButtonStyle? style;
  final VoidCallback? onPressed;
  final bool isLoading;
  final String loadingLabel;

  const AppButton({
    super.key,
    required this.label,
    this.icon,
    this.style,
    required this.onPressed,
    this.isLoading = false,
    this.loadingLabel = 'Cargando...',
  });

  @override
  Widget build(BuildContext context) {
    final Widget? effectiveIcon = isLoading
        ? const SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primary,
            ),
          )
        : icon;

    final child = Text(isLoading ? loadingLabel : label);

    return AnimatedOpacity(
      opacity: isLoading ? 0.65 : 1,
      duration: const Duration(milliseconds: 200),
      child: effectiveIcon != null
          ? FilledButton.icon(
              onPressed: isLoading ? null : onPressed,
              icon: effectiveIcon,
              label: child,
              style: style,
            )
          : FilledButton(
              onPressed: isLoading ? null : onPressed,
              style: style,
              child: child,
            ),
    );
  }
}
