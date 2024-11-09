class SplashPageData {
  final String titleFirstLine;
  final List<TextPart> titleFirstLineParts;
  final String titleSecondLine;
  final List<TextPart> titleSecondLineParts;
  final String imagePath;

  const SplashPageData({
    this.titleFirstLine = '',
    this.titleFirstLineParts = const [],
    this.titleSecondLine = '',
    this.titleSecondLineParts = const [],
    required this.imagePath,
  });
}

class TextPart {
  final String text;
  final bool isBold;

  const TextPart(this.text, {this.isBold = false});
} 