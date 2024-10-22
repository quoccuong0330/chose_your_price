import 'package:chose_your_price/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Home page test', () {
    testWidgets('Check change product after each click check',
        (widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(home: HomePage()));

      expect(find.text(products[0].name), findsOneWidget);

      for (var i = 1; i < products.length - 1; i++) {
        await widgetTester.tap(find.byKey(const Key('nextBtn')));
        await widgetTester.pump();
        expect(find.text(products[i].name), findsOneWidget);
      }
    });
  });
}
