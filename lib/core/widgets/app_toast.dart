import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';

class AppToast {
  static void success(String message) {
    _show(message, color: AppColors.success, icon: Icons.check_circle);
  }

  static void error(String message) {
    _show(message, color: AppColors.error, icon: Icons.error);
  }

  static void info(String message) {
    _show(message, color: AppColors.tertiary, icon: Icons.info);
  }

  static CancelFunc loading([String message = "Cargando..."]) {
    return BotToast.showCustomLoading(
      toastBuilder: (_) => _ToastContainer(
        color: Colors.black87,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 12),
            Text(message, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
      backgroundColor: Colors.black.withValues(alpha: 0.3),
    );
  }

  static void _show(
    String message, {
    required Color color,
    required IconData icon,
  }) {
    BotToast.showCustomNotification(
      toastBuilder: (_) => _ToastContainer(
        color: color,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      duration: const Duration(seconds: 6),
      align: Alignment.topCenter,
      onlyOne: true,
    );
  }
}

class _ToastContainer extends StatelessWidget {
  final Widget child;
  final Color color;

  const _ToastContainer({required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black26,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
