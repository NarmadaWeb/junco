import 'package:flutter/material.dart';

class MarkdownText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double scaleFactor;

  const MarkdownText(this.text, {super.key, this.style, this.scaleFactor = 1.0});

  @override
  Widget build(BuildContext context) {
    final defaultStyle = style ?? Theme.of(context).textTheme.bodyMedium!;
    final boldStyle = defaultStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: (defaultStyle.fontSize ?? 14.0) * 1.2 * scaleFactor, // Larger and bold
    );

    List<TextSpan> spans = [];
    final RegExp exp = RegExp(r'\*\*(.*?)\*\*');
    int start = 0;

    for (final match in exp.allMatches(text)) {
      // Add text before the match
      if (match.start > start) {
        spans.add(TextSpan(
          text: text.substring(start, match.start),
          style: defaultStyle,
        ));
      }
      // Add the matched text (without **)
      spans.add(TextSpan(
        text: match.group(1),
        style: boldStyle,
      ));
      start = match.end;
    }

    // Add remaining text
    if (start < text.length) {
      spans.add(TextSpan(
        text: text.substring(start),
        style: defaultStyle,
      ));
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}
