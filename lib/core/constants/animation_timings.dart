import 'package:flutter/animation.dart';

abstract final class AnimationTimings {
  static const totalDuration = Duration(milliseconds: 4500);

  static const walletImageFadeIn = Interval(0.0, 0.10, curve: Curves.easeOut);
  static const confettiBurst = Interval(0.10, 0.25, curve: Curves.easeOut);
  
  static const titleFadeIn = Interval(0.35, 0.45, curve: Curves.easeOut);
  static const subtitleFadeIn = Interval(0.45, 0.55, curve: Curves.easeOut);

  static const featureListFadeInStart = 0.70;
  static const featureListFadeInEnd = 0.85;

  static const footerFadeIn = Interval(0.85, 1.0, curve: Curves.easeOut);
  static const headerButtonsFadeIn = Interval(
    0.85,
    1.0,
    curve: Curves.easeOut,
  );
}
