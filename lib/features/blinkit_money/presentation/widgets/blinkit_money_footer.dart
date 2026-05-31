import 'package:flutter/material.dart';

import 'package:flicktv_bhuvaneshwaran/core/constants/animation_timings.dart';
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
    required this.animation,
  });

  final String addMoneyLabel;
  final String giftCardTitle;
  final String giftCardSubtitle;
  final String footerHeadline;
  final VoidCallback onAddMoneyPressed;
  final VoidCallback onClaimGiftCardPressed;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final footerAnimation = CurvedAnimation(
      parent: animation,
      curve: AnimationTimings.footerFadeIn,
    );

    final slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(footerAnimation);

    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: footerAnimation,
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
            const SizedBox(height: 24),
            _ClaimGiftCardRow(
              title: giftCardTitle,
              subtitle: giftCardSubtitle,
              onTap: onClaimGiftCardPressed,
            ),
            const SizedBox(height: 32),
            Text(
              footerHeadline,
              textAlign: TextAlign.center,
              style: AppTextStyles.footerHeadline,
            ),
          ],
        ),
      ),
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
              const Icon(Icons.chevron_right, color: AppColors.arrowColor),
            ],
          ),
        ),
      ),
    );
  }
}
