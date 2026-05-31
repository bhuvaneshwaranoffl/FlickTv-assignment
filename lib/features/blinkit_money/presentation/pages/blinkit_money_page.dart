import 'package:flutter/material.dart';

import 'package:flicktv_bhuvaneshwaran/core/constants/animation_timings.dart';
import 'package:flicktv_bhuvaneshwaran/core/widgets/common_app_gradient.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/presentation/viewmodels/blinkit_money_view_model.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/presentation/widgets/blinkit_money_feature_list.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/presentation/widgets/blinkit_money_footer.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/presentation/widgets/confetti_overlay.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/presentation/widgets/blinkit_money_header.dart';

/// Blinkit Money onboarding screen composed of header, cards, and footer.
class BlinkitMoneyPage extends StatefulWidget {
  const BlinkitMoneyPage({super.key, this.viewModel});

  /// Optional injection for tests.
  final BlinkitMoneyViewModel? viewModel;

  @override
  State<BlinkitMoneyPage> createState() => _BlinkitMoneyPageState();
}

class _BlinkitMoneyPageState extends State<BlinkitMoneyPage> with SingleTickerProviderStateMixin {
  late final BlinkitMoneyViewModel _viewModel;
  late final bool _ownsViewModel;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _ownsViewModel = widget.viewModel == null;
    _viewModel = widget.viewModel ?? BlinkitMoneyViewModel();

    _animationController = AnimationController(
      vsync: this,
      duration: AnimationTimings.totalDuration,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    if (_ownsViewModel) {
      _viewModel.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonAppGradient(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            ListenableBuilder(
              listenable: _viewModel,
              builder: (context, _) {
                return SingleChildScrollView(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      final slideUpAnimation = TweenSequence<double>([
                        TweenSequenceItem(
                          tween: ConstantTween<double>(1.0),
                          weight: 25, // 0.00 to 0.25 (Wait for image and confetti)
                        ),
                        TweenSequenceItem(
                          tween: Tween<double>(begin: 1.0, end: 0.8).chain(CurveTween(curve: Curves.easeInOut)),
                          weight: 10, // 0.25 to 0.35 (Shift up slightly to make room for title)
                        ),
                        TweenSequenceItem(
                          tween: ConstantTween<double>(0.8),
                          weight: 25, // 0.35 to 0.60 (Wait for title and subtitle to fade in)
                        ),
                        TweenSequenceItem(
                          tween: Tween<double>(begin: 0.8, end: 0.0).chain(CurveTween(curve: Curves.easeInOutCubic)),
                          weight: 15, // 0.60 to 0.75 (Slide all the way up together)
                        ),
                        TweenSequenceItem(
                          tween: ConstantTween<double>(0.0),
                          weight: 25, // 0.75 to 1.00 (Stay at top)
                        ),
                      ]).animate(_animationController);

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            SizedBox(height: MediaQuery.sizeOf(context).height * 0.25 * slideUpAnimation.value),
                            
                            // Header: app bar actions, wallet image, and brand typography.
                            BlinkitMoneyHeader(
                              brandLabel: _viewModel.brandLabel,
                              brandTitle: _viewModel.brandTitle,
                              onBackPressed: _viewModel.onBackPressed,
                              onSettingsPressed: _viewModel.onSettingsPressed,
                              animation: _animationController,
                            ),

                            // Feature cards list.
                            BlinkitMoneyFeatureList(
                              cards: _viewModel.featureCards,
                              animation: _animationController,
                            ),
                            const SizedBox(height: 24),

                            // Footer: CTA buttons and decorative headline.
                            BlinkitMoneyFooter(
                              addMoneyLabel: _viewModel.addMoneyLabel,
                              giftCardTitle: _viewModel.giftCardTitle,
                              giftCardSubtitle: _viewModel.giftCardSubtitle,
                              footerHeadline: _viewModel.footerHeadline,
                              onAddMoneyPressed: _viewModel.onAddMoneyPressed,
                              onClaimGiftCardPressed: _viewModel.onClaimGiftCardPressed,
                              animation: _animationController,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            IgnorePointer(
              child: ConfettiOverlay(
                animation: CurvedAnimation(
                  parent: _animationController,
                  curve: AnimationTimings.confettiBurst,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
