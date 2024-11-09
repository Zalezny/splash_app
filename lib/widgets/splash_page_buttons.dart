import 'package:flutter/material.dart';
import '../core/constants/app_strings.dart';
import '../core/constants/app_colors.dart';

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
      return _StartButton(onStart: onStart);
    }
    return _NavigationButtons(
      currentPage: currentPage,
      onNext: onNext,
      onPrevious: onPrevious,
    );
  }
}

class _StartButton extends StatelessWidget {
  final VoidCallback? onStart;

  const _StartButton({this.onStart});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onStart,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        padding: const EdgeInsets.symmetric(
          horizontal: 48,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: AppColors.borderWhite, width: 2),
        ),
        elevation: 0,
      ),
      child: const Text(
        AppStrings.letsStart,
        style: TextStyle(
          color: AppColors.textWhite,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
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
        GestureDetector(
          onTap: onPrevious,
          child: Text(
            AppStrings.skip,
            style: TextStyle(
              color: currentPage > 0 ? AppColors.textWhite70 : AppColors.textWhite30,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 24),
        ElevatedButton(
          onPressed: onNext,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryDark,
            padding: const EdgeInsets.symmetric(
              horizontal: 48,
              vertical: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: const BorderSide(color: AppColors.borderWhite, width: 2),
            ),
            elevation: 0,
          ),
          child: const Text(
            AppStrings.next,
            style: TextStyle(
              color: AppColors.textWhite,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
