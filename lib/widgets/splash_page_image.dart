import 'package:flutter/material.dart';

class SplashPageImage extends StatelessWidget {
  final String imagePath;

  const SplashPageImage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
