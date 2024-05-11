import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvp_mq/select_campus.dart';
import 'package:mvp_mq/enter_details.dart';

void main() {
  Widget createWidgetUnderTest() {
    return const MaterialApp(
      home: SelectCampus(),
    );
  }
  

  testWidgets('Navigates to EnterDetails when Wallumattagal Campus button is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    
    final wallumattagalButton = find.text('Wallumattagal Campus\nMacquarie Park');
    await tester.tap(wallumattagalButton);
    await tester.pumpAndSettle(); 

    expect(find.byType(EnterDetails), findsOneWidget);
  });
  testWidgets('Macquarie City Campus button is present and can be tapped', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    final cityCampusButton = find.text('Macquarie City Campus\nSydney, Australia');
    expect(cityCampusButton, findsOneWidget); 


    await tester.tap(cityCampusButton);
    await tester.pump();

    expect(find.byType(EnterDetails), findsNothing); 
  });
}
