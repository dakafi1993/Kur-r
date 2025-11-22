import 'package:flutter/material.dart';
import '../constants/app_spacing.dart';
import '../constants/app_text_styles.dart';
import '../utils/validators.dart';
import 'custom_text_field.dart';
import 'gradient_button.dart';
import 'password_toggle_icon.dart';
import 'text_link.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool showPassword;
  final VoidCallback onTogglePassword;
  final VoidCallback onSubmit;
  final VoidCallback onForgotPassword;
  final bool isLoading;
  final GlobalKey<FormState> formKey;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.showPassword,
    required this.onTogglePassword,
    required this.onSubmit,
    required this.onForgotPassword,
    required this.isLoading,
    required this.formKey,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text('Vítejte zpět', style: AppTextStyles.heading2),
          ),
          const SizedBox(height: AppSpacing.xxLarge),

          CustomTextField(
            controller: widget.emailController,
            hintText: 'Email',
            prefixIcon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            validator: Validators.email,
          ),

          const SizedBox(height: AppSpacing.large),

          CustomTextField(
            controller: widget.passwordController,
            hintText: 'Heslo',
            prefixIcon: Icons.lock,
            obscureText: !widget.showPassword,
            suffixIcon: PasswordToggleIcon(
              isVisible: widget.showPassword,
              onToggle: widget.onTogglePassword,
            ),
            validator: Validators.password,
          ),

          const SizedBox(height: AppSpacing.medium),

          Align(
            alignment: Alignment.centerRight,
            child: TextLink(
              text: 'Zapomenuté heslo?',
              onTap: widget.onForgotPassword,
            ),
          ),

          const SizedBox(height: AppSpacing.large),

          GradientButton(
            text: 'Přihlásit se',
            onPressed: widget.onSubmit,
            isLoading: widget.isLoading,
          ),
        ],
      ),
    );
  }
}
