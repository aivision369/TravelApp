import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class TwoLineTextWithReadMore extends StatelessWidget {
  final String text;
  final int maxLines;
  final Color readMoreColor;

  TwoLineTextWithReadMore({
    required this.text,
    this.maxLines = 2,
    this.readMoreColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final readMoreText = ' Read More';
        final readMoreSpan = TextSpan(
          text: readMoreText,
          style: TextStyle(color: readMoreColor),
        );

        final textSpan = TextSpan(text: text, style: TextStyle(color: Colors.black));
        final tp = TextPainter(
          text: textSpan,
          maxLines: maxLines,
          textDirection: TextDirection.ltr,
        );

        tp.layout(maxWidth: constraints.maxWidth);

        if (tp.didExceedMaxLines) {
          String truncatedText = text;
          while (tp.didExceedMaxLines) {
            truncatedText = truncatedText.substring(0, truncatedText.length - 1);
            final truncatedSpan = TextSpan(
              text: truncatedText + readMoreText,
              style: TextStyle(color: Colors.black),
            );
            tp.text = truncatedSpan;
            tp.layout(maxWidth: constraints.maxWidth);
          }

          final displayText = truncatedText;
          return RichText(
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              text: displayText,
              style: kTextDesGrey,
              children: [readMoreSpan],
            ),
          );
        } else {
          return RichText(
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              text: text,
              style: kTextDesGrey,
              children: [readMoreSpan],
            ),
          );
        }
      },
    );
  }
}