import 'package:flutter/material.dart';

/// Shadow constants for consistent elevation
class AppShadows {
  // Prevent instantiation
  AppShadows._();
  
  // Card shadow
  static BoxShadow get card => BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 20,
    offset: const Offset(0, 4),
  );
  
  // Logo shadow
  static BoxShadow get logo => BoxShadow(
    color: Colors.black.withOpacity(0.2),
    blurRadius: 15,
    offset: const Offset(0, 4),
  );
  
  // Button shadow
  static BoxShadow get button => BoxShadow(
    color: Colors.black.withOpacity(0.15),
    blurRadius: 10,
    offset: const Offset(0, 2),
  );
  
  // Light shadow
  static BoxShadow get light => BoxShadow(
    color: Colors.black.withOpacity(0.05),
    blurRadius: 8,
    offset: const Offset(0, 2),
  );
}
