import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash_app/controllers/splash_page_controller.dart';

void main() {
  late SplashPageController controller;

  setUp(() {
    controller = SplashPageController();
  });

  tearDown(() {
    controller.dispose();
  });

  group('SplashPageController', () {
    testWidgets('should initialize with correct default values', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PageView(
            controller: controller.pageController,
            children: const [SizedBox()],
          ),
        ),
      );

      expect(controller.currentPage, 0);
      expect(controller.pages.length, 6);
    });

    testWidgets('nextPage should increment currentPage when not at last page', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PageView(
            controller: controller.pageController,
            children: const [SizedBox(), SizedBox()],
          ),
        ),
      );

      controller.nextPage();
      await tester.pumpAndSettle();
      expect(controller.currentPage, 1);
    });

    testWidgets('nextPage should not increment currentPage when at last page', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PageView(
            controller: controller.pageController,
            children: List.generate(6, (index) => const SizedBox()),
          ),
        ),
      );

      // Przejdź do ostatniej strony
      for (var i = 0; i < controller.pages.length - 1; i++) {
        controller.nextPage();
        await tester.pumpAndSettle();
      }
      final lastPage = controller.currentPage;
      controller.nextPage();
      await tester.pumpAndSettle();
      expect(controller.currentPage, lastPage);
    });

    testWidgets('previousPage should decrement currentPage when not at first page', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PageView(
            controller: controller.pageController,
            children: const [SizedBox(), SizedBox()],
          ),
        ),
      );

      controller.nextPage();
      await tester.pumpAndSettle();
      controller.previousPage();
      await tester.pumpAndSettle();
      expect(controller.currentPage, 0);
    });

    testWidgets('previousPage should not decrement currentPage when at first page', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PageView(
            controller: controller.pageController,
            children: const [SizedBox()],
          ),
        ),
      );

      controller.previousPage();
      await tester.pumpAndSettle();
      expect(controller.currentPage, 0);
    });

    test('onPageChanged should update currentPage', () {
      controller.onPageChanged(2);
      expect(controller.currentPage, 2);
    });
  });
}
