import 'package:flutter/material.dart';

class TruncateTextWidget extends StatelessWidget {
  final String text;

  const TruncateTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(text: text, style: const TextStyle(fontSize: 16.0)),
          maxLines: 2,
          textDirection: TextDirection.ltr,
        );

        textPainter.layout(maxWidth: constraints.maxWidth);

        if (textPainter.didExceedMaxLines) {
          // Text exceeds two lines, truncate with three dots
          final ellipsisWidth = textPainter.computeLineMetrics()[1].width;
          final maxWidth = constraints.maxWidth - ellipsisWidth;
          final truncatedText = _truncateText(text, textPainter, maxWidth);

          return Text(truncatedText);
        } else {
          return Text(text);
        }
      },
    );
  }

  String _truncateText(String text, TextPainter textPainter, double maxWidth) {
    final words = text.split(' ');
    final buffer = StringBuffer();

    for (var word in words) {
      textPainter.text = TextSpan(text: '$buffer$word...');
      textPainter.layout(maxWidth: maxWidth);

      if (textPainter.width > maxWidth) {
        // Adding this word exceeds the available width, stop and return truncated text
        return '$buffer...';
      }

      buffer.write('$word ');
    }

    // If the loop completes without exceeding the available width, return the original text
    return text;
  }

}