
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mvp_mq/service_button.dart';
import 'package:mvp_mq/extension.dart';
void main(){
Widget createExtensionWidgetUnderTest(int id) {
  return MaterialApp(
    home: Extension(id: id),
  );
}
testWidgets('Initial state of Extension widget', (WidgetTester tester) async {
  await tester.pumpWidget(createExtensionWidgetUnderTest(1));

  expect(find.text('Enter how many hours you want to extend'), findsOneWidget);
  expect(find.byType(TextField), findsOneWidget);
  expect(find.byType(ServiceButton), findsOneWidget);
});
 

 testWidgets('Displays error SnackBar for invalid hours input', (WidgetTester tester) async {
    await tester.pumpWidget(createExtensionWidgetUnderTest(1));

    await tester.enterText(find.byType(TextField), 'abc');

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle(); 

    expect(find.text('Please enter a valid number of hours.'), findsOneWidget);
  });
}