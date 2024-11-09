import 'package:flutter_test/flutter_test.dart';
import 'package:splash_app/models/splash_page_data.dart';

void main() {
  group('SplashPageData', () {
    test('should create instance with default values', () {
      const data = SplashPageData(imagePath: 'test.png');

      expect(data.titleFirstLine, '');
      expect(data.titleFirstLineParts, isEmpty);
      expect(data.titleSecondLine, '');
      expect(data.titleSecondLineParts, isEmpty);
      expect(data.imagePath, 'test.png');
    });

    test('should create instance with all values', () {
      const data = SplashPageData(
        titleFirstLine: 'First',
        titleFirstLineParts: [TextPart('Test', isBold: true)],
        titleSecondLine: 'Second',
        titleSecondLineParts: [TextPart('Test2')],
        imagePath: 'test.png',
      );

      expect(data.titleFirstLine, 'First');
      expect(data.titleFirstLineParts.length, 1);
      expect(data.titleFirstLineParts.first.text, 'Test');
      expect(data.titleFirstLineParts.first.isBold, true);
      expect(data.titleSecondLine, 'Second');
      expect(data.titleSecondLineParts.length, 1);
      expect(data.titleSecondLineParts.first.text, 'Test2');
      expect(data.titleSecondLineParts.first.isBold, false);
      expect(data.imagePath, 'test.png');
    });
  });

  group('TextPart', () {
    test('should create instance with default isBold value', () {
      const part = TextPart('Test');
      expect(part.text, 'Test');
      expect(part.isBold, false);
    });

    test('should create instance with custom isBold value', () {
      const part = TextPart('Test', isBold: true);
      expect(part.text, 'Test');
      expect(part.isBold, true);
    });
  });
}
