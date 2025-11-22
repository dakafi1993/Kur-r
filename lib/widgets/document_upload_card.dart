import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_radius.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_gradients.dart';
import '../models/document_type.dart';

class DocumentUploadCard extends StatelessWidget {
  final DocumentType document;
  final bool isUploaded;
  final VoidCallback onUpload;
  final VoidCallback onRemove;

  const DocumentUploadCard({
    super.key,
    required this.document,
    required this.isUploaded,
    required this.onUpload,
    required this.onRemove,
  });

  IconData _getIcon() {
    if (document.id.contains('idCard')) return Icons.badge;
    if (document.id.contains('driverLicense')) return Icons.credit_card;
    if (document.id.contains('profilePhoto')) return Icons.person;
    return Icons.description;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isUploaded ? AppColors.primary.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.large),
        border: Border.all(
          color: isUploaded ? AppColors.primary : Colors.grey.shade200,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppSpacing.medium),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: isUploaded ? AppGradients.primary : null,
              color: isUploaded ? null : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(AppRadius.medium),
            ),
            child: Icon(
              _getIcon(),
              color: isUploaded ? Colors.white : Colors.grey.shade400,
              size: 24,
            ),
          ),
          const SizedBox(width: AppSpacing.medium),
          
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title row
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        document.title,
                        style: AppTextStyles.subtitle,
                      ),
                    ),
                    if (document.required && !isUploaded)
                      Text(
                        '*povinné',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.accent,
                        ),
                      ),
                    if (isUploaded)
                      const Icon(
                        Icons.check_circle,
                        color: AppColors.primary,
                        size: 18,
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xSmall),
                
                // Description
                Text(
                  document.description,
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: AppSpacing.medium),
                
                // Upload button or status
                if (!isUploaded)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: onUpload,
                      icon: const Icon(Icons.upload, size: 18),
                      label: const Text('Nahrát dokument'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.medium),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.medium,
                          vertical: AppSpacing.small,
                        ),
                      ),
                    ),
                  )
                else
                  Row(
                    children: [
                      TextButton(
                        onPressed: onRemove,
                        child: Text(
                          'Změnit soubor',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.small),
                      Text(
                        '✓ Nahráno',
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
