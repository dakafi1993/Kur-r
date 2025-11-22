import 'package:url_launcher/url_launcher.dart';

class UrlService {
  // Singleton pattern
  static final UrlService _instance = UrlService._internal();
  factory UrlService() => _instance;
  UrlService._internal();

  // Open phone dialer
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri url = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception('Nelze otevřít telefon');
    }
  }

  // Open email client
  Future<void> sendEmail({
    required String email,
    String? subject,
    String? body,
  }) async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: email,
      query: _encodeQueryParameters({
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      }),
    );
    
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception('Nelze otevřít email');
    }
  }

  // Open URL in browser
  Future<void> openUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Nelze otevřít URL');
    }
  }

  // Helper method to encode query parameters
  String? _encodeQueryParameters(Map<String, String> params) {
    if (params.isEmpty) return null;
    
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
