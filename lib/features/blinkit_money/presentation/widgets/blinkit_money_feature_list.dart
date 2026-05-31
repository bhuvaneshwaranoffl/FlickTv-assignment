import 'package:flutter/material.dart';

import '../../domain/models/feature_card_model.dart';
import 'feature_card_item.dart';

/// Scrollable list of Blinkit Money feature cards.
class BlinkitMoneyFeatureList extends StatelessWidget {
  const BlinkitMoneyFeatureList({
    super.key,
    required this.cards,
  });

  final List<FeatureCardModel> cards;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: cards.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return FeatureCardItem(model: cards[index]);
      },
    );
  }
}
