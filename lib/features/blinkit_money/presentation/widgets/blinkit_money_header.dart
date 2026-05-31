import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'circle_icon_button.dart';

/// Top section: navigation, wallet illustration, and brand title.
class BlinkitMoneyHeader extends StatelessWidget {
  const BlinkitMoneyHeader({
    super.key,
    required this.brandLabel,
    required this.brandTitle,
    required this.onBackPressed,
    required this.onSettingsPressed,
  });

  final String brandLabel;
  final String brandTitle;
  final VoidCallback onBackPressed;
  final VoidCallback onSettingsPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleIconButton(
                icon: Icons.arrow_back,
                onPressed: onBackPressed,
              ),
              CircleIconButton(
                icon: Icons.settings_outlined,
                onPressed: onSettingsPressed,
              ),
            ],
          ),
          const SizedBox(height: 24),
          _WalletIllustration(),
          const SizedBox(height: 16),
          Text(brandLabel, style: AppTextStyles.brandLabel),
          Text(brandTitle, style: AppTextStyles.brandTitle),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

/// Placeholder wallet hero until a dedicated asset is added.
class _WalletIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        color: AppColors.blinkitYellow,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.blinkitYellow.withValues(alpha: 0.35),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          '₹',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
