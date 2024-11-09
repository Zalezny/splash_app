import 'package:flutter/material.dart';
import '../models/splash_page_data.dart';
import '../core/constants/app_assets.dart';
import '../core/constants/app_strings.dart';

class SplashPageController extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<SplashPageData> pages = const [
    SplashPageData(
      titleFirstLine: AppStrings.spendTimeTitle,
      titleSecondLine: AppStrings.spendTimeSubtitle,
      imagePath: AppAssets.image2,
    ),
    SplashPageData(
      titleFirstLine: AppStrings.discoverTitle,
      titleSecondLine: AppStrings.discoverSubtitle,
      imagePath: AppAssets.image3,
    ),
    SplashPageData(
      titleFirstLine: AppStrings.haveTitle,
      titleSecondLine: AppStrings.haveSubtitle,
      imagePath: AppAssets.image4,
    ),
    SplashPageData(
      titleFirstLine: AppStrings.catchTitle,
      titleSecondLine: AppStrings.catchSubtitle,
      imagePath: AppAssets.image5,
    ),
    SplashPageData(
      titleFirstLine: "Bądź na bieżąco",
      titleSecondLine: "",
      imagePath: AppAssets.image6,
    ),
    SplashPageData(
      titleFirstLine: "Złap swój rytm",
      titleSecondLine: "",
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
