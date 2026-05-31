import 'package:flutter/material.dart';

import 'package:flicktv_bhuvaneshwaran/core/constants/animation_timings.dart';
import 'package:flicktv_bhuvaneshwaran/core/widgets/common_app_gradient.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/presentation/viewmodels/blinkit_money_view_model.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/presentation/widgets/blinkit_money_feature_list.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/presentation/widgets/blinkit_money_footer.dart';
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
        body: ListenableBuilder(
          listenable: _viewModel,
          builder: (context, _) {
            return SingleChildScrollView(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  final slideUpAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: AnimationTimings.headerSlideUp,
                    ),
                  );

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
      ),
    );
  }
}
