import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash_app/models/splash_page_data.dart';
import 'package:splash_app/widgets/styled_rich_text.dart';
import 'package:splash_app/core/themes/app_theme.dart';

void main() {
  Widget createWidgetUnderTest({
    required List<TextPart> parts,
    bool addSpaceAfter = false,
  }) {
    return MaterialApp(
      theme: AppTheme.theme,
      home: Scaffold(
        body: StyledRichText(
          parts: parts,
          addSpaceAfter: addSpaceAfter,
        ),
      ),
    );
  }

  group('StyledRichText', () {
    testWidgets('should display single non-bold text correctly',
        (WidgetTester tester) async {
      const testText = 'Test Text';
      const parts = [TextPart(testText)];

      await tester.pumpWidget(createWidgetUnderTest(parts: parts));

      final richTextFinder = find.byType(RichText);
      expect(richTextFinder, findsOneWidget);

      final richText = tester.widget<RichText>(richTextFinder);
      final textSpan = richText.text as TextSpan;
      
      expect(textSpan.children!.length, 1);
      expect((textSpan.children![0] as TextSpan).text, testText);
      expect((textSpan.children![0] as TextSpan).style?.fontWeight, null);
    });

    testWidgets('should display single bold text correctly',
        (WidgetTester tester) async {
      const testText = 'Bold Text';
      const parts = [TextPart(testText, isBold: true)];

      await tester.pumpWidget(createWidgetUnderTest(parts: parts));

      final richTextFinder = find.byType(RichText);
      expect(richTextFinder, findsOneWidget);

      final richText = tester.widget<RichText>(richTextFinder);
      final textSpan = richText.text as TextSpan;
      
      expect(textSpan.children!.length, 1);
      expect((textSpan.children![0] as TextSpan).text, testText);
      expect((textSpan.children![0] as TextSpan).style?.fontWeight, FontWeight.bold);
    });

    testWidgets('should add space after text when addSpaceAfter is true',
        (WidgetTester tester) async {
      const parts = [TextPart('Text')];

      await tester.pumpWidget(createWidgetUnderTest(
        parts: parts,
        addSpaceAfter: true,
      ));

      final richTextFinder = find.byType(RichText);
      expect(richTextFinder, findsOneWidget);

      final richText = tester.widget<RichText>(richTextFinder);
      final textSpan = richText.text as TextSpan;
      
      expect(textSpan.children!.length, 2);
      expect((textSpan.children![0] as TextSpan).text, 'Text');
      expect((textSpan.children![1] as TextSpan).text, ' ');
    });

    testWidgets('should not add space after text when addSpaceAfter is false',
        (WidgetTester tester) async {
      const parts = [TextPart('Text')];

      await tester.pumpWidget(createWidgetUnderTest(
        parts: parts,
        addSpaceAfter: false,
      ));

      final richTextFinder = find.byType(RichText);
      expect(richTextFinder, findsOneWidget);

      final richText = tester.widget<RichText>(richTextFinder);
      final textSpan = richText.text as TextSpan;
      
      expect(textSpan.children!.length, 1);
      expect((textSpan.children![0] as TextSpan).text, 'Text');
    });
  });
} 