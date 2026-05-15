import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';

class AppGradients {
  static const primaryCTA = LinearGradient(
    colors: [AppColors.primary, AppColors.tertiary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const aiSignature = LinearGradient(
    colors: [AppColors.secondary, AppColors.secondaryContainer],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
