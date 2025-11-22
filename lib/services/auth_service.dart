import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Singleton pattern
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  // Backend URL
  static const String _baseUrl = 'https://kuryr-backend-production-edb7.up.railway.app/api';
  
  String? _token;
  Map<String, dynamic>? _user;

  // Get token
  String? get token => _token;
  
  // Get user
  Map<String, dynamic>? get user => _user;
  
  // Check if authenticated
  bool get isAuthenticated => _token != null;

  // Load token from storage
  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('auth_token');
    final userJson = prefs.getString('user_data');
    if (userJson != null) {
      _user = jsonDecode(userJson);
    }
  }

  // Save token to storage
  Future<void> _saveToken(String token, Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
    await prefs.setString('user_data', jsonEncode(user));
    _token = token;
    _user = user;
  }

  // Clear token
  Future<void> _clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('user_data');
    _token = null;
    _user = null;
  }

  // Login
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await _saveToken(data['token'], data['user']);
        return true;
      } else {
        final error = jsonDecode(response.body);
        throw Exception(error['error'] ?? 'Chyba při přihlášení');
      }
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception('Chyba spojení se serverem');
    }
  }

  // Register
  Future<bool> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    // Local validation
    if (password != confirmPassword) {
      throw Exception('Hesla se neshodují');
    }

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await _saveToken(data['token'], data['user']);
        return true;
      } else {
        final error = jsonDecode(response.body);
        throw Exception(error['error'] ?? 'Chyba při registraci');
      }
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception('Chyba spojení se serverem');
    }
  }

  // Reset password
  Future<bool> resetPassword({required String email}) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/reset-password'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        final error = jsonDecode(response.body);
        throw Exception(error['error'] ?? 'Chyba při obnově hesla');
      }
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception('Chyba spojení se serverem');
    }
  }

  // Get user data
  Future<Map<String, dynamic>?> getUserData() async {
    if (_token == null) return null;

    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/user'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _user = data['user'];
        return _user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  // Logout
  Future<void> logout() async {
    await _clearToken();
  }
}
