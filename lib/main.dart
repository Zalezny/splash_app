import 'package:flutter/material.dart';
import 'core/constants/app_strings.dart';
import 'core/themes/app_theme.dart';
import 'screens/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.theme,
      home: const SplashPage(),
    );
  }
}
