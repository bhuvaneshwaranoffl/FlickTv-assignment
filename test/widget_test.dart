import 'package:flutter_test/flutter_test.dart';
import 'package:flicktv_bhuvaneshwaran/main.dart';

void main() {
  testWidgets('app launches Blinkit Money screen', (WidgetTester tester) async {
    await tester.pumpWidget(const BhuvaneshwaranApp());

    expect(find.text('MONEY'), findsOneWidget);
    expect(find.text('Add Money'), findsOneWidget);
  });
}
