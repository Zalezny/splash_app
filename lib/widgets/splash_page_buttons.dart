import 'package:flutter/material.dart';
import '../core/constants/app_strings.dart';
import '../core/constants/app_colors.dart';
import 'frame_button.dart';

class SplashPageButtons extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final VoidCallback? onStart;

  const SplashPageButtons({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
    required this.onPrevious,
    this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    if (currentPage == totalPages - 1) {
      return FrameButton(onPressed: onStart, text: AppStrings.letsStart);
    }
    return _NavigationButtons(
      currentPage: currentPage,
      onNext: onNext,
      onPrevious: onPrevious,
    );
  }
}

class _NavigationButtons extends StatelessWidget {
  final int currentPage;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const _NavigationButtons({
    required this.currentPage,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: onPrevious,
          child: Text(
            AppStrings.skip,
            style: TextStyle(
              color: currentPage > 0 ? AppColors.textWhite70 : AppColors.textWhite30,
            ),
          ),
        ),
        const SizedBox(width: 24),
        FrameButton(onPressed: onNext, text: AppStrings.next),
      ],
    );
  }
}
