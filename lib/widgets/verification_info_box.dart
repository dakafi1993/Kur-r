import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_radius.dart';
import '../constants/app_text_styles.dart';

class VerificationInfoBox extends StatelessWidget {
  const VerificationInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.secondary.withOpacity(0.1),
            AppColors.primary.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(AppRadius.large),
        border: Border.all(
          color: AppColors.secondary.withOpacity(0.2),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.camera_alt,
                color: AppColors.secondary,
                size: 20,
              ),
              const SizedBox(width: AppSpacing.small),
              Text(
                'Důležité informace',
                style: AppTextStyles.subtitle,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.medium),
          _buildInfoItem('Dokumenty musí být čitelné a platné'),
          _buildInfoItem('Ověření obvykle trvá 24-48 hodin'),
          _buildInfoItem('Po schválení obdržíte e-mail'),
          _buildInfoItem('Vaše data jsou v bezpečí a šifrovaná'),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xSmall),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: AppTextStyles.body.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.body.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
