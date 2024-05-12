import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvp_mq/map_view.dart';
import 'package:mvp_mq/select_campus.dart';
import 'package:provider/provider.dart';
import 'package:mvp_mq/mq_home.dart';
import 'package:mvp_mq/theme_provider.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(),
        child: const MQHome(),
      ),
    );
  }

  testWidgets('MQHome builds correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Welcome to MQ APP'), findsOneWidget);
    expect(find.byIcon(Icons.dark_mode_rounded), findsOneWidget);
    expect(find.text('Parking Spot'), findsOneWidget);
  });

  testWidgets('Navigates to SelectCampus on tapping Parking Spot button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    final parkingSpotButton = find.text('Parking Spot');
    await tester.tap(parkingSpotButton);
    await tester.pumpAndSettle();

    expect(find.byType(SelectCampus), findsOneWidget);
  });

  testWidgets(
      'Navigates to MapWidget on tapping Wallumattagal Campus Map button',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    final mapButton = find.text('Wallumattagal Campus Map');
    await tester.tap(mapButton);
    await tester.pumpAndSettle();
    expect(find.byType(MapWidget), findsOneWidget);
  });
}
