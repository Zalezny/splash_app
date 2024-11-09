import 'package:flutter/material.dart';

import '../core/constants/app_assets.dart';
import '../core/constants/app_strings.dart';
import '../models/splash_page_data.dart';

class SplashPageController extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<SplashPageData> pages = const [
    SplashPageData(
      titleFirstLineParts: [
        TextPart(AppStrings.spendTimeTitle),
      ],
      titleSecondLineParts: [
        TextPart(AppStrings.creativelyBold, isBold: true),
        TextPart(AppStrings.exclamationMark),
      ],
      imagePath: AppAssets.image2,
    ),
    SplashPageData(
      titleFirstLineParts: [
        TextPart(AppStrings.participateBold, isBold: true),
      ],
      titleSecondLineParts: [
        TextPart(AppStrings.inEventsSuffix),
      ],
      imagePath: AppAssets.image3,
    ),
    SplashPageData(
      titleFirstLineParts: [
        TextPart(AppStrings.exploreTitle),
      ],
      titleSecondLineParts: [
        TextPart(AppStrings.undiscoveredPrefix),
        TextPart(AppStrings.pathsBold, isBold: true),
        TextPart(AppStrings.exclamationMark),
      ],
      imagePath: AppAssets.image4,
    ),
    SplashPageData(
      titleFirstLineParts: [
        TextPart(AppStrings.setTitle),
      ],
      titleSecondLineParts: [
        TextPart(AppStrings.remindersBold, isBold: true),
        TextPart(AppStrings.exclamationMark),
      ],
      imagePath: AppAssets.image5,
    ),
    SplashPageData(
      titleFirstLineParts: [
        TextPart(AppStrings.stayTitle),
        TextPart(AppStrings.upToDateBold, isBold: true),
        TextPart(AppStrings.exclamationMark),
      ],
      titleSecondLineParts: [],
      imagePath: AppAssets.image6,
    ),
    SplashPageData(
      titleFirstLineParts: [
        TextPart(AppStrings.catchTitle),
        TextPart(AppStrings.yourRhythmBold, isBold: true),
      ],
      titleSecondLineParts: [],
      imagePath: AppAssets.image1,
    ),
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      currentPage++;
      notifyListeners();
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      currentPage--;
      notifyListeners();
    }
  }

  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
