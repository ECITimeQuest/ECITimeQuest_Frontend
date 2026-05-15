import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/app_toast.dart';
import 'package:flutter_app/core/widgets/app_button.dart';
import 'package:flutter_app/core/widgets/padded_card.dart';
import 'package:flutter_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_input.dart';

typedef AuthSubmitCallback =
    Future<void> Function(String email, String password);

class AuthForm extends ConsumerStatefulWidget {
  final String submitText;
  final AuthSubmitCallback onSubmit;
  final bool isSubmitLoading;
  final bool showSocialOptions;
  final String socialDividerText;

  const AuthForm({
    super.key,
    required this.submitText,
    required this.onSubmit,
    this.isSubmitLoading = false,
    this.showSocialOptions = true,
    this.socialDividerText = 'O CONTINUAR CON',
  });

  @override
  ConsumerState<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends ConsumerState<AuthForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isCredentialsLoading = false;
  bool _isGoogleLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      AppToast.error('Completa correo y contraseña');
      return;
    }

    try {
      setState(() {
        _isCredentialsLoading = true;
      });
      await widget.onSubmit(email, password);
    } finally {
      if (mounted) {
        setState(() {
          _isCredentialsLoading = false;
        });
      }
    }
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      setState(() {
        _isGoogleLoading = true;
      });
      await ref.read(authUserProvider.notifier).signInWithGoogle();
    } finally {
      if (mounted) {
        setState(() {
          _isGoogleLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final socialProviders = <_SocialAuthProvider>[
      _SocialAuthProvider(
        label: 'Google',
        icon: const Icon(Icons.g_mobiledata, size: 18),
        loadingLabel: 'Iniciando...',
        isLoading: _isGoogleLoading,
        onPressed: _handleGoogleSignIn,
      ),
      _SocialAuthProvider(label: 'Apple', icon: Icon(Icons.apple, size: 18)),
    ];

    return PaddedCard(
      elevation: 1,
      verticalPadding: 40,
      child: Column(
        spacing: 40,
        children: [
          Column(
            spacing: 20,
            children: [
              AuthInput(
                label: 'Correo electrónico',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: _emailController,
              ),
              AuthInput(
                label: 'Contraseña',
                icon: Icons.lock_outlined,
                obscureText: true,
                textInputAction: TextInputAction.done,
                controller: _passwordController,
              ),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  label: widget.submitText,
                  onPressed: _handleSubmit,
                  isLoading: _isCredentialsLoading,
                  loadingLabel: 'Iniciando...',
                ),
              ),
            ],
          ),
          if (widget.showSocialOptions && socialProviders.isNotEmpty) ...[
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppColors.onSurfaceVariant.withValues(alpha: 0.25),
                    thickness: 1,
                    height: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.socialDividerText,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: AppColors.onSurfaceVariant.withValues(alpha: 0.25),
                    thickness: 1,
                    height: 1,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                for (int i = 0; i < socialProviders.length; i++) ...[
                  Expanded(
                    child: AppButton(
                      label: socialProviders[i].label,
                      icon: socialProviders[i].icon,
                      style: _socialButtonStyle(context),
                      onPressed: socialProviders[i].onPressed,
                      loadingLabel: socialProviders[i].loadingLabel,
                      isLoading: socialProviders[i].isLoading,
                    ),
                  ),
                  if (i < socialProviders.length - 1) SizedBox(width: 15),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _SocialAuthProvider {
  final String label;
  final Widget icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final String loadingLabel;

  const _SocialAuthProvider({
    required this.label,
    required this.icon,
    this.onPressed,
    this.isLoading = false,
    this.loadingLabel = 'Cargando...',
  });
}

ButtonStyle _socialButtonStyle(BuildContext context) {
  return ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(AppColors.surfaceVariant),
    foregroundColor: WidgetStatePropertyAll(Colors.black87),
    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 14)),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
