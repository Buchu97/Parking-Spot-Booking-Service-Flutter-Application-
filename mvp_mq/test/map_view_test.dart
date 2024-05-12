import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvp_mq/map_view.dart';
import 'package:mvp_mq/mq_home.dart';

void main() {
  const testImagePath = 'lib/assets/mq_campus_map.jpeg';

  Widget createWidgetUnderTest() {
    return const MaterialApp(
      home: MapWidget(imagePath: testImagePath),
    );
  }

  testWidgets('Image loads correctly with the given path', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    final image = tester.widget<Image>(find.byType(Image));
    expect(image.image, isA<AssetImage>());
    expect((image.image as AssetImage).assetName, equals(testImagePath));
  });

    
}
