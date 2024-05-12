import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvp_mq/service_button.dart';
import 'package:mvp_mq/sign_up.dart';

void main() {
  testWidgets('Signup screen should render correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SignupScreen(),
        ),
      ),
    );

    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.byType(ServiceButton), findsOneWidget);
  });

  testWidgets('Entering User Information in Signup Form',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SignupScreen(),
        ),
      ),
    );

    await tester.enterText(find.byKey(const Key('username')), 'testuser');
    await tester.enterText(find.byKey(const Key('email')), 'test@example.com');
    await tester.enterText(find.byKey(const Key('password')), 'password');
  });

  testWidgets('Signup form validation', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SignupScreen(),
        ),
      ),
    );

    expect(find.text('Sign Up Failed. Try Again!'), findsNothing);

    await tester.enterText(find.byKey(const Key('username')), '');
    await tester.enterText(find.byKey(const Key('email')), '');
    await tester.enterText(find.byKey(const Key('password')), '');

    await tester.tap(find.byType(ServiceButton));
    await tester.pump();

    expect(find.text('Username cannot be empty'), findsOneWidget);
    expect(find.text('Email cannot be empty'), findsOneWidget);
    expect(find.text('Password cannot be empty'), findsOneWidget);
  });
}
