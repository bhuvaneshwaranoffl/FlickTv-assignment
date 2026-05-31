import 'package:flutter/material.dart';

import 'package:flicktv_bhuvaneshwaran/core/theme/app_colors.dart';
import 'package:flicktv_bhuvaneshwaran/core/theme/app_text_styles.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/domain/models/feature_card_model.dart';

/// Single feature card shown in the Blinkit Money feature list.
class FeatureCardItem extends StatelessWidget {
  const FeatureCardItem({super.key, required this.model});

  final FeatureCardModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.iconBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(model.icon, color: AppColors.iconYellow),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.title, style: AppTextStyles.cardTitle),
                const SizedBox(height: 4),
                Text(model.subtitle, style: AppTextStyles.cardSubtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
