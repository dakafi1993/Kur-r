import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const KuryrApp());
}

class KuryrApp extends StatelessWidget {
  const KuryrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kurýr',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0094D9),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0094D9),
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
