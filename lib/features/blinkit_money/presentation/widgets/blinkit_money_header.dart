import 'package:flutter/material.dart';

import 'package:flicktv_bhuvaneshwaran/core/constants/animation_timings.dart';
import 'package:flicktv_bhuvaneshwaran/core/theme/app_text_styles.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/presentation/widgets/circle_icon_button.dart';

/// Top section: navigation, wallet illustration, and brand title.
class BlinkitMoneyHeader extends StatelessWidget {
  const BlinkitMoneyHeader({
    super.key,
    required this.brandLabel,
    required this.brandTitle,
    required this.onBackPressed,
    required this.onSettingsPressed,
    required this.animation,
  });

  final String brandLabel;
  final String brandTitle;
  final VoidCallback onBackPressed;
  final VoidCallback onSettingsPressed;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final imageFade = CurvedAnimation(parent: animation, curve: AnimationTimings.walletImageFadeIn);
    final textFade = CurvedAnimation(parent: animation, curve: AnimationTimings.brandTextFadeIn);
    final buttonsFade = CurvedAnimation(parent: animation, curve: AnimationTimings.headerButtonsFadeIn);

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          FadeTransition(
            opacity: buttonsFade,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleIconButton(
                  icon: Icons.arrow_back,
                  onPressed: onBackPressed,
                ),
                CircleIconButton(
                  icon: Icons.settings_outlined,
                  onPressed: onSettingsPressed,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          FadeTransition(opacity: imageFade, child: _WalletIllustration()),
          const SizedBox(height: 16),
          FadeTransition(opacity: textFade, child: Text(brandLabel, style: AppTextStyles.brandLabel)),
          FadeTransition(opacity: textFade, child: Text(brandTitle, style: AppTextStyles.brandTitle)),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

/// Placeholder wallet hero until a dedicated asset is added.
class _WalletIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/wallet_icon.png',
        width: 135,
        height: 123,
        fit: BoxFit.contain,
        semanticLabel: 'Wallet icon',
      ),
    );
  }
}
