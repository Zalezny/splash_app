import 'package:flutter/material.dart';
import '../models/splash_page_data.dart';

class StyledRichText extends StatelessWidget {
  final List<TextPart> parts;
  final bool addSpaceAfter;

  const StyledRichText({
    super.key,
    required this.parts,
    this.addSpaceAfter = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        style: textTheme.titleLarge,
        children: [
          ...parts.map((part) {
            return TextSpan(
              text: part.text,
              style: part.isBold ? textTheme.titleMedium : null,
            );
          }),
          if (addSpaceAfter) const TextSpan(text: ' '),
        ],
      ),
    );
  }
} 