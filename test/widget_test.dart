// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:apitutorial/main.dart';

void main() {
  testWidgets('Home loads and shows Fruit Delivery UI', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // App bar title
    expect(find.text('Fruit Delivery'), findsOneWidget);

    // Search field present
    expect(find.byType(TextField), findsOneWidget);

    // Cart icon present
    expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);
  });
}
