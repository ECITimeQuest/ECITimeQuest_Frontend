import 'package:flutter/material.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_form.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_switch_text.dart';

class AuthPageShell extends StatelessWidget {
  final AuthForm authForm;
  final AuthSwitchText? switchText;
  final VoidCallback? onSwitchTap;

  const AuthPageShell({
    super.key,
    required this.authForm,
    this.switchText,
    this.onSwitchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Center(
                    child: Column(
                      spacing: 50,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AuthHeader(
                          title: 'TimeQuest',
                          subtitle:
                              'Explora el pasado para entender el presente',
                        ),
                        authForm,
                        if (switchText != null)
                          GestureDetector(
                            onTap: onSwitchTap,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: switchText!,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
