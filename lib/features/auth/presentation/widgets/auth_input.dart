import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';

class AuthInput extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;

  const AuthInput({
    super.key,
    required this.label,
    required this.icon,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.textInputAction,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFD9DDE3)),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    );
    const focusedInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary, width: 1.4),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    );

    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: focusedInputBorder,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
