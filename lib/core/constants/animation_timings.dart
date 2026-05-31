import 'package:flutter/animation.dart';

abstract final class AnimationTimings {
  static const totalDuration = Duration(milliseconds: 2500);

  static const walletImageFadeIn = Interval(0.0, 0.15, curve: Curves.easeOut);
  static const brandTextFadeIn = Interval(0.15, 0.30, curve: Curves.easeOut);
  static const headerSlideUp = Interval(0.40, 0.65, curve: Curves.easeInOutCubic);
  static const headerButtonsFadeIn = Interval(0.50, 0.65, curve: Curves.easeOut);
  
  static const featureListFadeInStart = 0.65;
  static const featureListFadeInEnd = 0.85;

  static const footerFadeIn = Interval(0.85, 1.0, curve: Curves.easeOut);
}
