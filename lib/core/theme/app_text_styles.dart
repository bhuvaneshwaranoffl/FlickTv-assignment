import 'package:flutter/material.dart';

import 'package:flicktv_bhuvaneshwaran/core/theme/app_colors.dart';

/// Typography tokens backed by the bundled Inter font family.
abstract final class AppTextStyles {
  static const _fontFamily = 'Inter';

  static const brandLabel = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: AppColors.textPrimary,
  );

  static const brandTitle = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w800,
    fontSize: 40,
    letterSpacing: 1.2,
    color: AppColors.textPrimary,
  );

  static const cardTitle = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 15,
    color: AppColors.textPrimary,
  );

  static const cardSubtitle = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 1.4,
    color: AppColors.textSecondary,
  );

  static const primaryButton = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const giftCardTitle = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 15,
    color: AppColors.textPrimary,
  );

  static const giftCardSubtitle = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.textSecondary,
  );

  static const footerHeadline = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w800,
    fontSize: 28,
    color: AppColors.footerTextColor,
  );
}
