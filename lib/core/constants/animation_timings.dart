import 'package:flutter/animation.dart';

abstract final class AnimationTimings {
  static const totalDuration = Duration(milliseconds: 3200);

  static const walletImageFadeIn = Interval(0.0, 0.15, curve: Curves.easeOut);
  static const brandTextFadeIn = Interval(0.15, 0.30, curve: Curves.easeOut);
  static const headerSlideUp = Interval(
    0.35,
    0.55,
    curve: Curves.easeInOutCubic,
  );

  static const featureListFadeInStart = 0.50;
  static const featureListFadeInEnd = 0.75;

  static const footerFadeIn = Interval(0.75, 0.90, curve: Curves.easeOut);
  static const headerButtonsFadeIn = Interval(
    0.75,
    0.90,
    curve: Curves.easeOut,
  );
}
