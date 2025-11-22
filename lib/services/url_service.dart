import 'package:url_launcher/url_launcher.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'dart:io' show Platform;

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
    if (Platform.isAndroid) {
      // Android - použijeme Intent přímo
      final AndroidIntent intent = AndroidIntent(
        action: 'android.intent.action.SENDTO',
        data: 'mailto:$email',
        arguments: {
          if (subject != null) 'android.intent.extra.SUBJECT': subject,
          if (body != null) 'android.intent.extra.TEXT': body,
        },
      );
      await intent.launch();
    } else {
      // iOS a ostatní platformy
      final String? encodedSubject = subject != null ? Uri.encodeComponent(subject) : null;
      final String? encodedBody = body != null ? Uri.encodeComponent(body) : null;
      
      String query = '';
      if (encodedSubject != null || encodedBody != null) {
        final List<String> params = [];
        if (encodedSubject != null) params.add('subject=$encodedSubject');
        if (encodedBody != null) params.add('body=$encodedBody');
        query = params.join('&');
      }
      
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: email,
        query: query.isNotEmpty ? query : null,
      );
      
      try {
        final launched = await launchUrl(
          emailLaunchUri,
          mode: LaunchMode.externalApplication,
        );
        if (!launched) {
          throw Exception('Email klient není na zařízení nainstalován');
        }
      } catch (e) {
        throw Exception('Nelze otevřít email: $e');
      }
    }
  }

  // Open URL in browser
  Future<void> openUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      throw Exception('Nelze otevřít URL: $e');
    }
  }
}
