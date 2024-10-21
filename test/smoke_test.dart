import 'package:chose_your_price/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('smoke test', (widgetTester) async {
    await widgetTester.pumpWidget(const MainApp());
  });
}
