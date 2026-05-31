import 'package:flutter_test/flutter_test.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/presentation/viewmodels/blinkit_money_view_model.dart';

void main() {
  group('BlinkitMoneyViewModel', () {
    late BlinkitMoneyViewModel viewModel;

    setUp(() {
      viewModel = BlinkitMoneyViewModel();
    });

    tearDown(() {
      viewModel.dispose();
    });

    test('exposes brand labels from repository', () {
      expect(viewModel.brandLabel, 'blinkit');
      expect(viewModel.brandTitle, 'MONEY');
    });

    test('exposes three feature cards', () {
      expect(viewModel.featureCards, hasLength(3));
      expect(viewModel.featureCards.first.title, 'Single tap payments');
    });

    test('onAddMoneyPressed updates tap state', () {
      expect(viewModel.addMoneyTapped, isFalse);

      viewModel.onAddMoneyPressed();

      expect(viewModel.addMoneyTapped, isTrue);
    });

    test('onClaimGiftCardPressed updates tap state', () {
      viewModel.onClaimGiftCardPressed();

      expect(viewModel.giftCardTapped, isTrue);
    });

    test('onBackPressed updates tap state', () {
      viewModel.onBackPressed();

      expect(viewModel.backTapped, isTrue);
    });

    test('onSettingsPressed updates tap state', () {
      viewModel.onSettingsPressed();

      expect(viewModel.settingsTapped, isTrue);
    });
  });
}
