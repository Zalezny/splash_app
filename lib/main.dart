import 'package:flutter/material.dart';
import 'package:splash_app/core/constants/app_colors.dart';
import 'package:splash_app/screens/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.primary,
        useMaterial3: false,
      ),
      home: const SplashPage(),
    );
  }
}
