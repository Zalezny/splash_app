import 'package:flutter/material.dart';

import '../controllers/splash_page_controller.dart';
import '../models/splash_page_data.dart';
import '../widgets/splash_page_buttons.dart';
import '../widgets/splash_page_image.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashPageController _controller;

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

  Widget _buildRichText(List<TextPart> parts) {
    final textTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        style: textTheme.titleLarge,
        children: parts.map((part) {
          return TextSpan(
            text: part.text,
            style: part.isBold ? textTheme.titleMedium : null,
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 1),
            Expanded(
              flex: 8,
              child: PageView.builder(
                controller: _controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: _controller.onPageChanged,
                itemCount: _controller.pages.length,
                itemBuilder: (context, index) {
                  final page = _controller.pages[index];
                  return Column(
                    children: [
                      _buildRichText(page.titleFirstLineParts),
                      if (page.titleSecondLineParts.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        _buildRichText(page.titleSecondLineParts),
                      ],
                      const SizedBox(height: 20),
                      SplashPageImage(
                        imagePath: page.imagePath,
                      ),
                    ],
                  );
                },
              ),
            ),
            const Spacer(flex: 1),
            SplashPageButtons(
              currentPage: _controller.currentPage,
              totalPages: _controller.pages.length,
              onNext: _controller.nextPage,
              onPrevious: _controller.previousPage,
              onStart: () {
                _controller.previousPage();
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
