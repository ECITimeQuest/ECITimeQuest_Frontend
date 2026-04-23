import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';

class AuthSwitchText extends StatelessWidget {
  final String prefixText;
  final String actionText;

  const AuthSwitchText({
    super.key,
    required this.prefixText,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: prefixText,
        style: Theme.of(context).textTheme.labelMedium,
        children: [
          TextSpan(
            text: actionText,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
