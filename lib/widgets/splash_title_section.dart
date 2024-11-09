import 'package:flutter/material.dart';
import '../models/splash_page_data.dart';
import 'styled_rich_text.dart';

class SplashTitleSection extends StatelessWidget {
  final SplashPageData page;

  const SplashTitleSection({
    super.key,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    if (isLandscape) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StyledRichText(
            parts: page.titleFirstLineParts,
            addSpaceAfter: page.titleSecondLineParts.isNotEmpty,
          ),
          if (page.titleSecondLineParts.isNotEmpty)
            StyledRichText(parts: page.titleSecondLineParts),
        ],
      );
    }

    return Column(
      children: [
        StyledRichText(parts: page.titleFirstLineParts),
        if (page.titleSecondLineParts.isNotEmpty) ...[
          const SizedBox(height: 8),
          StyledRichText(parts: page.titleSecondLineParts),
        ],
      ],
    );
  }
} 