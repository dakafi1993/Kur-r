import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_radius.dart';
import '../constants/app_text_styles.dart';

class BankAccountForm extends StatelessWidget {
  final String accountNumber;
  final String selectedBank;
  final List<String> banks;
  final ValueChanged<String> onAccountNumberChanged;
  final ValueChanged<String?> onBankSelected;

  const BankAccountForm({
    super.key,
    required this.accountNumber,
    required this.selectedBank,
    required this.banks,
    required this.onAccountNumberChanged,
    required this.onBankSelected,
  });

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
                Icons.account_balance,
                color: AppColors.secondary,
                size: 20,
              ),
              const SizedBox(width: AppSpacing.small),
              Text(
                'Bankovní účet',
                style: AppTextStyles.subtitle,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.medium),
          
          // Account number
          TextField(
            onChanged: onAccountNumberChanged,
            decoration: InputDecoration(
              hintText: 'Číslo účtu',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.medium),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.medium),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.medium),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: AppSpacing.small),
          
          // Bank selection
          DropdownButtonFormField<String>(
            value: selectedBank.isEmpty ? null : selectedBank,
            decoration: InputDecoration(
              hintText: 'Vyberte banku',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.medium),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.medium),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.medium),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
            items: banks.map((bank) {
              return DropdownMenuItem(
                value: bank,
                child: Text(bank),
              );
            }).toList(),
            onChanged: onBankSelected,
          ),
        ],
      ),
    );
  }
}
