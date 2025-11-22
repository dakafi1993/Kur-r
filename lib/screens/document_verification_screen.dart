import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_radius.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_gradients.dart';
import '../models/document_type.dart';
import '../widgets/document_upload_card.dart';
import '../widgets/bank_account_form.dart';
import '../widgets/verification_info_box.dart';

class DocumentVerificationScreen extends StatefulWidget {
  const DocumentVerificationScreen({super.key});

  @override
  State<DocumentVerificationScreen> createState() => _DocumentVerificationScreenState();
}

class _DocumentVerificationScreenState extends State<DocumentVerificationScreen> {
  final Map<String, bool> _uploadedDocs = {
    'idCardFront': false,
    'idCardBack': false,
    'driverLicenseFront': false,
    'driverLicenseBack': false,
    'profilePhoto': false,
  };

  String _accountNumber = '';
  String _selectedBank = '';

  bool get _allDocsUploaded => _uploadedDocs.values.every((uploaded) => uploaded);
  bool get _bankAccountFilled => _accountNumber.trim().isNotEmpty && _selectedBank.isNotEmpty;
  bool get _allCompleted => _allDocsUploaded && _bankAccountFilled;

  int get _uploadedCount => _uploadedDocs.values.where((uploaded) => uploaded).length;
  int get _totalDocs => DocumentType.allDocuments.length;
  double get _progress => _uploadedCount / _totalDocs;

  void _handleFileUpload(String docId) {
    setState(() {
      _uploadedDocs[docId] = true;
    });
  }

  void _handleFileRemove(String docId) {
    setState(() {
      _uploadedDocs[docId] = false;
    });
  }

  void _handleSubmit() {
    if (!_allCompleted) return;

    // TODO: Implement document upload to backend
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.large),
        ),
        title: const Text('Dokumenty odeslány'),
        content: const Text('Vaše dokumenty byly úspěšně odeslány k ověření. Budeme vás informovat e-mailem.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Return to previous screen
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          // Header with gradient
          Container(
            decoration: BoxDecoration(
              gradient: AppGradients.primary,
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.large,
                  AppSpacing.xxLarge,
                  AppSpacing.large,
                  AppSpacing.large,
                ),
                child: Column(
                  children: [
                    // Icon
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.verified_user,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.medium),
                    
                    // Title
                    Text(
                      'Ověření dokumentů',
                      style: AppTextStyles.h1.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: AppSpacing.small),
                    
                    // Subtitle
                    Text(
                      'Nahrajte potřebné dokumenty pro dokončení registrace',
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white.withOpacity(0.8),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.large),
                    
                    // Progress bar
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: _progress,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.accent,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.small),
                    
                    // Progress text
                    Text(
                      '$_uploadedCount z $_totalDocs dokumentů',
                      style: AppTextStyles.caption.copyWith(
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.large),
              children: [
                // Documents list
                ...DocumentType.allDocuments.map((doc) {
                  final isUploaded = _uploadedDocs[doc.id] ?? false;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.medium),
                    child: DocumentUploadCard(
                      document: doc,
                      isUploaded: isUploaded,
                      onUpload: () => _handleFileUpload(doc.id),
                      onRemove: () => _handleFileRemove(doc.id),
                    ),
                  );
                }),
                
                const SizedBox(height: AppSpacing.medium),
                
                // Bank account form
                BankAccountForm(
                  accountNumber: _accountNumber,
                  selectedBank: _selectedBank,
                  banks: DocumentType.czechBanks,
                  onAccountNumberChanged: (value) {
                    setState(() => _accountNumber = value);
                  },
                  onBankSelected: (value) {
                    setState(() => _selectedBank = value ?? '');
                  },
                ),
                
                const SizedBox(height: AppSpacing.large),
                
                // Info box
                const VerificationInfoBox(),
              ],
            ),
          ),
          
          // Submit button
          Container(
            padding: const EdgeInsets.all(AppSpacing.large),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _allCompleted ? _handleSubmit : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _allCompleted ? null : Colors.grey.shade300,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.medium),
                        ),
                        elevation: _allCompleted ? 4 : 0,
                      ).copyWith(
                        backgroundColor: _allCompleted
                            ? WidgetStateProperty.all(null)
                            : WidgetStateProperty.all(Colors.grey.shade300),
                      ),
                      child: Container(
                        decoration: _allCompleted
                            ? BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [AppColors.accent, Color(0xFFFFC72C)],
                                ),
                                borderRadius: BorderRadius.circular(AppRadius.medium),
                              )
                            : null,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _allCompleted
                                  ? 'Odeslat k ověření'
                                  : 'Nahrajte všechny dokumenty',
                              style: AppTextStyles.button,
                            ),
                            if (_allCompleted) ...[
                              const SizedBox(width: AppSpacing.small),
                              const Icon(Icons.arrow_forward, size: 20),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (_allCompleted) ...[
                    const SizedBox(height: AppSpacing.medium),
                    Text(
                      'Po ověření vás informujeme e-mailem',
                      style: AppTextStyles.caption.copyWith(
                        color: Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
