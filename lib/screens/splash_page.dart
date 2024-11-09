import 'package:flutter/material.dart';

import '../controllers/splash_page_controller.dart';
import '../widgets/splash_page_buttons.dart';
import '../widgets/splash_page_image.dart';
import '../widgets/splash_title_section.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashPageController _controller;
  // The key is used to preserve the page index when the app is rotated
  final _pageViewKey = const PageStorageKey('splash_page_view');

  @override
  void initState() {
    super.initState();
    _controller = SplashPageController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (!isLandscape) const Spacer(flex: 1),
            Expanded(
              flex: isLandscape ? 10 : 8,
              child: PageView.builder(
                key: _pageViewKey,
                controller: _controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: _controller.onPageChanged,
                itemCount: _controller.pages.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SplashTitleSection(page: _controller.pages[index]),
                      if (!isLandscape) const SizedBox(height: 20),
                      SplashPageImage(
                        imagePath: _controller.pages[index].imagePath,
                      ),
                    ],
                  );
                },
              ),
            ),
            if (!isLandscape) const Spacer(flex: 1),
            SplashPageButtons(
              currentPage: _controller.currentPage,
              totalPages: _controller.pages.length,
              onNext: _controller.nextPage,
              onPrevious: _controller.previousPage,
              onStart: () {
                _controller.previousPage();
              },
            ),
            SizedBox(height: isLandscape ? 20 : 40),
            if (!isLandscape) const Spacer(),
          ],
        ),
      ),
    );
  }
}
