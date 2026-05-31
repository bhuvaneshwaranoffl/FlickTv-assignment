import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../viewmodels/blinkit_money_view_model.dart';
import '../widgets/blinkit_money_feature_list.dart';
import '../widgets/blinkit_money_footer.dart';
import '../widgets/blinkit_money_header.dart';

/// Blinkit Money onboarding screen composed of header, cards, and footer.
class BlinkitMoneyPage extends StatefulWidget {
  const BlinkitMoneyPage({super.key, this.viewModel});

  /// Optional injection for tests.
  final BlinkitMoneyViewModel? viewModel;

  @override
  State<BlinkitMoneyPage> createState() => _BlinkitMoneyPageState();
}

class _BlinkitMoneyPageState extends State<BlinkitMoneyPage> {
  late final BlinkitMoneyViewModel _viewModel;
  late final bool _ownsViewModel;

  @override
  void initState() {
    super.initState();
    _ownsViewModel = widget.viewModel == null;
    _viewModel = widget.viewModel ?? BlinkitMoneyViewModel();
  }

  @override
  void dispose() {
    if (_ownsViewModel) {
      _viewModel.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListenableBuilder(
        listenable: _viewModel,
        builder: (context, _) {
          return Column(
            children: [
              // Header: app bar actions, wallet image, and brand typography.
              BlinkitMoneyHeader(
                brandLabel: _viewModel.brandLabel,
                brandTitle: _viewModel.brandTitle,
                onBackPressed: _viewModel.onBackPressed,
                onSettingsPressed: _viewModel.onSettingsPressed,
              ),

              // Feature cards list.
              Expanded(
                child: BlinkitMoneyFeatureList(cards: _viewModel.featureCards),
              ),

              // Footer: CTA buttons and decorative headline.
              BlinkitMoneyFooter(
                addMoneyLabel: _viewModel.addMoneyLabel,
                giftCardTitle: _viewModel.giftCardTitle,
                giftCardSubtitle: _viewModel.giftCardSubtitle,
                footerHeadline: _viewModel.footerHeadline,
                onAddMoneyPressed: _viewModel.onAddMoneyPressed,
                onClaimGiftCardPressed: _viewModel.onClaimGiftCardPressed,
              ),
            ],
          );
        },
      ),
    );
  }
}
