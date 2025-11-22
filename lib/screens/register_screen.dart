import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/app_background.dart';
import '../widgets/light_status_bar.dart';
import '../widgets/gradient_header.dart';
import '../widgets/register_card.dart';
import '../widgets/register_form.dart';
import '../widgets/rich_text_link.dart';
import 'document_verification_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authService = AuthService();
  
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await _authService.register(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      );
      
      if (mounted) {
        // Navigate to document verification
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const DocumentVerificationScreen(),
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
    return Scaffold(
      body: AppBackground(
        child: LightStatusBar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const GradientHeader(
                  title: 'Registrace',
                  height: 280,
                ),
                RegisterCard(
                  child: Column(
                    children: [
                      RegisterForm(
                        formKey: _formKey,
                        nameController: _nameController,
                        emailController: _emailController,
                        phoneController: _phoneController,
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                        showPassword: _showPassword,
                        showConfirmPassword: _showConfirmPassword,
                        onTogglePassword: () => setState(() => _showPassword = !_showPassword),
                        onToggleConfirmPassword: () => setState(() => _showConfirmPassword = !_showConfirmPassword),
                        onSubmit: _handleRegister,
                        isLoading: _isLoading,
                      ),
                      const SizedBox(height: 24),
                      RichTextLink(
                        normalText: 'Již máte účet? ',
                        linkText: 'Přihlásit se',
                        onTap: () => Navigator.pop(context),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
