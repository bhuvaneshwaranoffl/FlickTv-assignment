import 'package:flutter/foundation.dart';

import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/data/repositories/blinkit_money_repository.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/domain/models/feature_card_model.dart';

/// ViewModel for [BlinkitMoneyPage].
///
/// Keeps UI state and user actions separate from widgets (MVVM).
class BlinkitMoneyViewModel extends ChangeNotifier {
  String get brandLabel => BlinkitMoneyRepository.brandLabel;
  String get brandTitle => BlinkitMoneyRepository.brandTitle;
  String get footerHeadline => BlinkitMoneyRepository.footerHeadline;
  String get addMoneyLabel => BlinkitMoneyRepository.addMoneyLabel;
  String get giftCardTitle => BlinkitMoneyRepository.giftCardTitle;
  String get giftCardSubtitle => BlinkitMoneyRepository.giftCardSubtitle;

  List<FeatureCardModel> get featureCards =>
      List<FeatureCardModel>.unmodifiable(BlinkitMoneyRepository.featureCards);

  bool addMoneyTapped = false;
  bool giftCardTapped = false;
  bool backTapped = false;
  bool settingsTapped = false;

  void onBackPressed() {
    backTapped = true;
    notifyListeners();
  }

  void onSettingsPressed() {
    settingsTapped = true;
    notifyListeners();
  }

  void onAddMoneyPressed() {
    addMoneyTapped = true;
    notifyListeners();
  }

  void onClaimGiftCardPressed() {
    giftCardTapped = true;
    notifyListeners();
  }
}
