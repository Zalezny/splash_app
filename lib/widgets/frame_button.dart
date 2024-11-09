import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class FrameButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const FrameButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.textWhite,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
