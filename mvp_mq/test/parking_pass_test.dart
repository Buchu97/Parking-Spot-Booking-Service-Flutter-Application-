import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mvp_mq/extension.dart';
import 'package:mvp_mq/mq_home.dart';

import 'package:mvp_mq/parking_pass.dart';
import 'package:mvp_mq/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  Widget createWidgetUnderTest() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()), 
    ],
    child: const MaterialApp(
      home: ParkingPass(id: 1),
    ),
  );
}



  testWidgets('All buttons are present', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Extend Time'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    
  });

  testWidgets('Navigates to Extension Widget on tapping Extend Time button', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());


    final mapButton = find.text('Extend Time');
    await tester.tap(mapButton);
    await tester.pumpAndSettle();
    expect(find.byType( Extension), findsOneWidget);
    
  });

   testWidgets('Navigates to MQHome Widget on tapping Home button', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());


     


    final mapButton = find.text('Home');
    await tester.tap(mapButton);
    await tester.pumpAndSettle();
    expect(find.byType( MQHome), findsOneWidget);
    
  });
    
  
}
