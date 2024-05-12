import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mvp_mq/service_button.dart';

class MockFunction extends Mock {
  call();
}

void main() {
  group('ServiceButton - Unit Tests', () {
    test('nextPage function is callable', () {
      var mockFunction = MockFunction();

      final button = ServiceButton(
        text: 'Click Me',
        nextPage: mockFunction.call,
      );

      button.nextPage();

      verify(mockFunction()).called(1);
    });
  });
}
