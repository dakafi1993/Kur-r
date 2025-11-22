import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/app_background.dart';
import '../widgets/light_status_bar.dart';
import '../widgets/gradient_header.dart';
import '../widgets/login_card.dart';
import '../widgets/login_form.dart';
import '../widgets/bottom_links.dart';
import '../widgets/rich_text_link.dart';
import '../widgets/text_link.dart';
import '../widgets/help_modal.dart';
import '../widgets/forgot_password_modal.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  
  bool _showPassword = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await _authService.login(
        email: _emailController.text,
        password: _passwordController.text,
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Přihlášení úspěšné!'),
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

  void _showForgotPasswordModal() => showDialog(
    context: context,
    builder: (context) => const ForgotPasswordModal(),
  );

  void _showHelpModal() => showDialog(
    context: context,
    builder: (context) => HelpModal(),
  );

  void _navigateToRegister() => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const RegisterScreen()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: LightStatusBar(
          child: Stack(
            children: [
              // Background
              _buildBackground(),

              // Login Card
              LoginCard(
                child: LoginForm(
                  formKey: _formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  showPassword: _showPassword,
                  onTogglePassword: () => setState(() => _showPassword = !_showPassword),
                  onSubmit: _handleLogin,
                  onForgotPassword: _showForgotPasswordModal,
                  isLoading: _isLoading,
                ),
              ),

              // Bottom Links
              BottomLinks(
                children: [
                  RichTextLink(
                    normalText: 'Ještě nejste kurýř? ',
                    linkText: 'Zaregistrujte se',
                    onTap: _navigateToRegister,
                  ),
                  TextLink(
                    text: 'Potřebujete pomoc?',
                    onTap: _showHelpModal,
                    underline: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Column(
      children: [
        const GradientHeader(
          title: 'Přihlášení',
          height: 280,
        ),
        Expanded(child: Container()),
      ],
    );
  }
}
