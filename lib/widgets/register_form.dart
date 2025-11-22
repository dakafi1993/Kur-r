import 'package:flutter/material.dart';
import '../constants/app_spacing.dart';
import '../constants/app_text_styles.dart';
import '../utils/validators.dart';
import 'custom_text_field.dart';
import 'gradient_button.dart';
import 'password_toggle_icon.dart';

class RegisterForm extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool showPassword;
  final bool showConfirmPassword;
  final VoidCallback onTogglePassword;
  final VoidCallback onToggleConfirmPassword;
  final VoidCallback onSubmit;
  final bool isLoading;
  final GlobalKey<FormState> formKey;

  const RegisterForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.showPassword,
    required this.showConfirmPassword,
    required this.onTogglePassword,
    required this.onToggleConfirmPassword,
    required this.onSubmit,
    required this.isLoading,
    required this.formKey,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text('Vytvořte si účet', style: AppTextStyles.heading2),
          ),
          const SizedBox(height: AppSpacing.xxLarge),

          CustomTextField(
            controller: widget.nameController,
            hintText: 'Celé jméno',
            prefixIcon: Icons.person,
            validator: Validators.name,
          ),

          const SizedBox(height: AppSpacing.large),

          CustomTextField(
            controller: widget.emailController,
            hintText: 'Email',
            prefixIcon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            validator: Validators.email,
          ),

          const SizedBox(height: AppSpacing.large),

          CustomTextField(
            controller: widget.phoneController,
            hintText: 'Telefon',
            prefixIcon: Icons.phone,
            keyboardType: TextInputType.phone,
            validator: Validators.phone,
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

          const SizedBox(height: AppSpacing.large),

          CustomTextField(
            controller: widget.confirmPasswordController,
            hintText: 'Potvrdit heslo',
            prefixIcon: Icons.lock,
            obscureText: !widget.showConfirmPassword,
            suffixIcon: PasswordToggleIcon(
              isVisible: widget.showConfirmPassword,
              onToggle: widget.onToggleConfirmPassword,
            ),
            validator: Validators.confirmPassword(widget.passwordController.text),
          ),

          const SizedBox(height: AppSpacing.xxLarge),

          GradientButton(
            text: 'Pokračovat k ověření',
            onPressed: widget.onSubmit,
            isLoading: widget.isLoading,
          ),
        ],
      ),
    );
  }
}
