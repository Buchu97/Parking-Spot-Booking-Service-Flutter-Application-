import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvp_mq/parking_history.dart';

void main() {
  testWidgets('Initial state - Loading indicator shown', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ParkingHistoryScreen()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('App bar shown', (WidgetTester tester) async {
Widget createWidgetUnderTest() {
    return const MaterialApp(
      home: ParkingHistoryScreen(),
    );
  }
    await tester.pumpWidget(createWidgetUnderTest());

    await tester.pump();

    expect(find.text('Parking History'), findsOneWidget);
  });

  
}
