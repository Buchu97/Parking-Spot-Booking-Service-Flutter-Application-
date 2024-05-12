
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mvp_mq/service_button.dart';


// Create a mock class for the navigator function
class MockFunction extends Mock {
  call();
}

void main() {
  group('ServiceButton - Unit Tests', () {
    test('nextPage function is callable', () {
      // Create a mock function
      var mockFunction = MockFunction();

      // Create an instance of ServiceButton
      final button = ServiceButton(
        text: 'Click Me',
        nextPage: mockFunction.call,
      );

      // Simulate button press
      button.nextPage();

      // Verify that the function was called
      verify(mockFunction()).called(1);
    });
  });
}
