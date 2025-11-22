import 'package:flutter/material.dart';
import '../constants/app_spacing.dart';
import '../constants/app_radius.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../services/url_service.dart';
import 'contact_card.dart';

class HelpModal extends StatelessWidget {
  final UrlService _urlService = UrlService();

  HelpModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.medium),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Potřebujete pomoc?',
              style: AppTextStyles.heading2,
            ),
            const SizedBox(height: AppSpacing.xxLarge),
            
            ContactCard(
              icon: Icons.phone,
              iconColor: AppColors.primary,
              title: 'Telefonní podpora',
              subtitle: '+420 123 456 789',
              onTap: () => _urlService.makePhoneCall('+420123456789'),
            ),
            
            const SizedBox(height: AppSpacing.medium),
            
            ContactCard(
              icon: Icons.email,
              iconColor: AppColors.accent,
              title: 'Email support',
              subtitle: 'support@kuryr.cz',
              onTap: () => _urlService.sendEmail(
                email: 'support@kuryr.cz',
                subject: 'Podpora - Kurýr App',
              ),
            ),
            
            const SizedBox(height: AppSpacing.xxLarge),
            
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Zavřít',
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
