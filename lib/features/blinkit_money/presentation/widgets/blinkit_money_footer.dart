import 'package:flutter/material.dart';

import 'package:flicktv_bhuvaneshwaran/core/theme/app_colors.dart';
import 'package:flicktv_bhuvaneshwaran/core/theme/app_text_styles.dart';

/// Bottom section: primary CTA, gift card row, and decorative footer text.
class BlinkitMoneyFooter extends StatelessWidget {
  const BlinkitMoneyFooter({
    super.key,
    required this.addMoneyLabel,
    required this.giftCardTitle,
    required this.giftCardSubtitle,
    required this.footerHeadline,
    required this.onAddMoneyPressed,
    required this.onClaimGiftCardPressed,
  });

  final String addMoneyLabel;
  final String giftCardTitle;
  final String giftCardSubtitle;
  final String footerHeadline;
  final VoidCallback onAddMoneyPressed;
  final VoidCallback onClaimGiftCardPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: onAddMoneyPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(addMoneyLabel, style: AppTextStyles.primaryButton),
                ),
              ),
              const SizedBox(height: 12),
              _ClaimGiftCardRow(
                title: giftCardTitle,
                subtitle: giftCardSubtitle,
                onTap: onClaimGiftCardPressed,
              ),
              const SizedBox(height: 56),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -8,
          child: Text(
            footerHeadline,
            textAlign: TextAlign.center,
            style: AppTextStyles.footerHeadline,
          ),
        ),
      ],
    );
  }
}

class _ClaimGiftCardRow extends StatelessWidget {
  const _ClaimGiftCardRow({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.giftCardBackground,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.iconBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.card_giftcard_outlined,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.giftCardTitle),
                    const SizedBox(height: 2),
                    Text(subtitle, style: AppTextStyles.giftCardSubtitle),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: AppColors.arrowColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
