import 'package:flutter/material.dart';

import 'package:flicktv_bhuvaneshwaran/core/constants/animation_timings.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/domain/models/feature_card_model.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/presentation/widgets/feature_card_item.dart';

/// Scrollable list of Blinkit Money feature cards.
class BlinkitMoneyFeatureList extends StatelessWidget {
  const BlinkitMoneyFeatureList({
    super.key, 
    required this.cards,
    required this.animation,
  });

  final List<FeatureCardModel> cards;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: cards.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final start = AnimationTimings.featureListFadeInStart + (index * 0.05);
        final end = start + 0.10;
        final clampedEnd = end > AnimationTimings.featureListFadeInEnd 
            ? AnimationTimings.featureListFadeInEnd 
            : end;

        final itemAnimation = CurvedAnimation(
          parent: animation,
          curve: Interval(start, clampedEnd, curve: Curves.easeOut),
        );
        
        final slideAnimation = Tween<Offset>(
          begin: const Offset(0.0, 0.2), 
          end: Offset.zero
        ).animate(itemAnimation);

        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(
            opacity: itemAnimation,
            child: FeatureCardItem(model: cards[index]),
          ),
        );
      },
    );
  }
}
