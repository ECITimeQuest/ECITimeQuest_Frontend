import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';

class QuizOptionItem extends StatelessWidget {
  final String letter;
  final String text;
  final bool selected;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;

  const QuizOptionItem({
    super.key,
    required this.letter,
    required this.text,
    this.selected = false,
    this.onTap,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardColor =
        backgroundColor ?? (selected ? AppColors.primary : Colors.white);
    final Color contentColor =
        textColor ?? (selected ? Colors.white : AppColors.onSurface);
    final Color badgeColor = selected
        ? Colors.white.withValues(alpha: 0.16)
        : AppColors.surfaceVariant;
    final Color badgeTextColor = selected ? Colors.white : AppColors.primary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  letter,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: badgeTextColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: contentColor,
                    fontWeight: FontWeight.w600,
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
