import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvp_mq/enter_details.dart';

void main() {
  Widget createWidgetUnderTest() {
    return const MaterialApp(
      home: EnterDetails(),
    );
  }

  testWidgets('All input fields and the continue button are present',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Enter Parking Location'), findsOneWidget);
    expect(find.text('Enter Start Time'), findsOneWidget);
    expect(find.text('Enter Duration(In Hours)'), findsOneWidget);
    expect(find.text('Enter Vehicle Number Plate'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });
  testWidgets('Submit data and navigate to ParkingPass',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    Finder findTextFieldByHint(String hintText) {
      return find.byWidgetPredicate(
        (Widget widget) =>
            widget is TextField && widget.decoration?.hintText == hintText,
      );
    }

    await tester.enterText(
        findTextFieldByHint('Carpark - P South 2'), 'P South 2');
    await tester.enterText(findTextFieldByHint('10 AM'), '10 AM');
    await tester.enterText(findTextFieldByHint('2'), '2');
    await tester.enterText(findTextFieldByHint('ABC 6251 ALIA'), 'ABC 6251');

    await tester.tap(find.text('Continue'));
  });
}
