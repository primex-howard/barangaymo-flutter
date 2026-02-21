// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:barangaymo_app/main.dart';

void main() {
  testWidgets('renders role gateway', (WidgetTester tester) async {
    await tester.pumpWidget(const BarangayMoApp());
    expect(find.text('BarangayMo'), findsOneWidget);
    expect(find.text('Residents'), findsOneWidget);
    expect(find.text('Barangay Officials'), findsOneWidget);
  });
}
