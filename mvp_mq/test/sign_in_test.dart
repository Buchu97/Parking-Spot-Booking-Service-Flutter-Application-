import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvp_mq/mq_home.dart';
import 'package:mvp_mq/sign_in.dart';
import 'package:mvp_mq/sign_up.dart'; 

void main() {
  Widget createTestableWidget() {
    return  MaterialApp(
      home: const LoginScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          return MaterialPageRoute(builder: (_) => const MQHome());
        }
        return null;
      },
    );
  }

  testWidgets('Email and password fields accept input', (WidgetTester tester) async {
    await tester.pumpWidget(createTestableWidget());

    const emailText = 'test@example.com';
    const passwordText = 'password123';

    await tester.enterText(find.widgetWithText(TextFormField, 'Email'), emailText);
    await tester.enterText(find.widgetWithText(TextFormField, 'Password'), passwordText);
    await tester.pump();

    expect(find.text(emailText), findsOneWidget);
    expect(find.text(passwordText), findsOneWidget);
  });
  
   testWidgets('Navigates to SignupScreen when signup link is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(createTestableWidget());

    final signupLink = find.text("Don't have an account? Sign up");
    expect(signupLink, findsOneWidget);  
    await tester.tap(signupLink);

    await tester.pumpAndSettle();  

    expect(find.byType(SignupScreen), findsOneWidget);
  });
}
