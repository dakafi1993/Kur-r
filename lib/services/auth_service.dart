class AuthService {
  // Singleton pattern
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  // Login
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    // TODO: Implementovat API call
    await Future.delayed(const Duration(seconds: 1));
    
    // Validace
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email a heslo jsou povinné');
    }
    
    if (!email.contains('@')) {
      throw Exception('Neplatný formát emailu');
    }
    
    if (password.length < 6) {
      throw Exception('Heslo musí mít alespoň 6 znaků');
    }
    
    // Simulace úspěšného přihlášení
    return true;
  }

  // Register
  Future<bool> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    // TODO: Implementovat API call
    await Future.delayed(const Duration(seconds: 1));
    
    // Validace
    if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty) {
      throw Exception('Všechna pole jsou povinná');
    }
    
    if (!email.contains('@')) {
      throw Exception('Neplatný formát emailu');
    }
    
    if (password.length < 6) {
      throw Exception('Heslo musí mít alespoň 6 znaků');
    }
    
    if (password != confirmPassword) {
      throw Exception('Hesla se neshodují');
    }
    
    // Simulace úspěšné registrace
    return true;
  }

  // Reset password
  Future<bool> resetPassword({required String email}) async {
    // TODO: Implementovat API call
    await Future.delayed(const Duration(seconds: 1));
    
    if (email.isEmpty) {
      throw Exception('Email je povinný');
    }
    
    if (!email.contains('@')) {
      throw Exception('Neplatný formát emailu');
    }
    
    return true;
  }

  // Logout
  Future<void> logout() async {
    // TODO: Implementovat clear tokens, atd.
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
