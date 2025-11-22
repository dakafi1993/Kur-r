import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_radius.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_input_decorations.dart';
import '../constants/app_icon_sizes.dart';
import '../services/auth_service.dart';
import '../utils/validators.dart';
import 'gradient_button.dart';

class ForgotPasswordModal extends StatefulWidget {
  const ForgotPasswordModal({super.key});

  @override
  State<ForgotPasswordModal> createState() => _ForgotPasswordModalState();
}

class _ForgotPasswordModalState extends State<ForgotPasswordModal> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleReset() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await _authService.resetPassword(email: _emailController.text);
      
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Link pro obnovení hesla byl odeslán na váš email'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.medium),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxLarge),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Zapomenuté heslo',
                style: AppTextStyles.heading2,
              ),
              const SizedBox(height: AppSpacing.small),
              const Text(
                'Zadejte svůj email a my vám pošleme',
                style: AppTextStyles.bodySmall,
              ),
              const Text(
                'odkaz pro obnovení hesla.',
                style: AppTextStyles.bodySmall,
              ),
              const SizedBox(height: AppSpacing.xxLarge),
              
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: AppInputDecorations.standard(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email, size: AppIconSizes.regular),
                ),
                validator: Validators.email,
              ),
              
              const SizedBox(height: AppSpacing.xxLarge),
              
              GradientButton(
                text: 'Obnovit heslo',
                onPressed: _handleReset,
                isLoading: _isLoading,
              ),
              
              const SizedBox(height: AppSpacing.medium),
              
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Zrušit',
                    style: TextStyle(color: AppColors.grey),
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
