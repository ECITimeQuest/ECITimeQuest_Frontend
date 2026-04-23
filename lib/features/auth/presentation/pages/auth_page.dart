import 'package:flutter/material.dart';
import 'package:flutter_app/core/widgets/app_toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/core/utils/error_handler.dart';
import 'package:flutter_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_form.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_page_shell.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_switch_text.dart';
import 'package:flutter_app/features/home/presentation/pages/home_page.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  bool _isLogin = true;

  void _toggleAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<dynamic>>(authUserProvider, (_, next) {
      next.whenOrNull(
        error: (error, _) => AppToast.error(ErrorHandler.getMessage(error)),
        data: (user) {
          if (user != null) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          }
        },
      );
    });

    return AuthPageShell(
      authForm: AuthForm(
        submitText: _isLogin ? 'Iniciar sesión' : 'Registrarme',
        onSubmit: (email, password) async {
          final notifier = ref.read(authUserProvider.notifier);
          if (_isLogin) {
            await notifier.signInWithCredentials(email, password);
          } else {
            await notifier.signUpWithCredentials(email, password);
          }
        },
      ),
      switchText: AuthSwitchText(
        prefixText: _isLogin
            ? '¿No tienes una cuenta? '
            : '¿Ya tienes una cuenta? ',
        actionText: _isLogin ? 'Regístrate' : 'Inicia sesión',
      ),
      onSwitchTap: _toggleAuthMode,
    );
  }
}
