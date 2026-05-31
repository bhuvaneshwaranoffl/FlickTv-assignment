import 'package:flutter/material.dart';

import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/domain/models/feature_card_model.dart';

/// Provides static content for the Blinkit Money onboarding screen.
abstract final class BlinkitMoneyRepository {
  static const brandLabel = 'blinkit';
  static const brandTitle = 'MONEY';
  static const footerHeadline = 'Enjoy seamless one tap payments';
  static const addMoneyLabel = 'Add Money';
  static const giftCardTitle = 'Claim Gift Card';
  static const giftCardSubtitle =
      'Enter gift card details to claim your gift card.';

  static const List<FeatureCardModel> featureCards = [
    FeatureCardModel(
      title: 'Single tap payments',
      subtitle: 'Enjoy seamless payments without the wait for OTPs.',
      icon: Icons.touch_app_outlined,
    ),
    FeatureCardModel(
      title: 'Zero failures',
      subtitle: 'Zero payment failures ensure you never miss an order.',
      icon: Icons.signal_cellular_alt,
    ),
    FeatureCardModel(
      title: 'Real-time refunds',
      subtitle:
          'No need to wait for refunds. Blinkit Money refunds are instant!',
      icon: Icons.currency_rupee,
    ),
  ];
}
