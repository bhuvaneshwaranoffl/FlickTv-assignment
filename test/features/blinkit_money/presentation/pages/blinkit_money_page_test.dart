import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/presentation/pages/blinkit_money_page.dart';
import 'package:flicktv_bhuvaneshwaran/features/blinkit_money/presentation/viewmodels/blinkit_money_view_model.dart';

void main() {
  group('BlinkitMoneyPage', () {
    late BlinkitMoneyViewModel viewModel;

    setUp(() {
      viewModel = BlinkitMoneyViewModel();
    });

    tearDown(() {
      viewModel.dispose();
    });

    Future<void> pumpPage(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: BlinkitMoneyPage(viewModel: viewModel)),
      );
      await tester.pumpAndSettle();
    }

    testWidgets('renders header brand title', (tester) async {
      await pumpPage(tester);

      expect(find.text('blinkit'), findsOneWidget);
      expect(find.text('MONEY'), findsOneWidget);
    });

    testWidgets('renders all feature cards', (tester) async {
      await pumpPage(tester);

      expect(find.text('Single tap payments'), findsOneWidget);

      await tester.scrollUntilVisible(
        find.text('Zero failures'),
        120,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.text('Zero failures'), findsOneWidget);

      await tester.scrollUntilVisible(
        find.text('Real-time refunds'),
        120,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.text('Real-time refunds'), findsOneWidget);
    });

    testWidgets('renders footer actions', (tester) async {
      await pumpPage(tester);

      expect(find.text('Add Money'), findsOneWidget);
      expect(find.text('Claim Gift Card'), findsOneWidget);
      expect(find.text('Enjoy seamless one tap payments'), findsOneWidget);
    });

    testWidgets('Add Money tap delegates to view model', (tester) async {
      await pumpPage(tester);

      final addMoneyButton = find.text('Add Money');
      await tester.ensureVisible(addMoneyButton);
      await tester.tap(addMoneyButton);
      await tester.pump();

      expect(viewModel.addMoneyTapped, isTrue);
    });

    testWidgets('Claim Gift Card tap delegates to view model', (tester) async {
      await pumpPage(tester);

      final giftCardButton = find.text('Claim Gift Card');
      await tester.ensureVisible(giftCardButton);
      await tester.tap(giftCardButton);
      await tester.pump();

      expect(viewModel.giftCardTapped, isTrue);
    });
  });
}
