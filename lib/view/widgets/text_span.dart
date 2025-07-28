import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';

class TextSpanWidget extends StatelessWidget {
  final String text;
  final String clickableText;
  final String? continueText;
  final bool underline;
  final Function function;
  final TextAlign alignment;
  const TextSpanWidget({
    super.key,
    required this.text,
    required this.clickableText,
    required this.underline,
    required this.function,
    this.continueText,
    this.alignment = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: alignment,
      text: TextSpan(
        text: text,
        style: faintTextStyle,
        children: [
          TextSpan(
            text: clickableText,
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              decoration:
                  underline ? TextDecoration.underline : TextDecoration.none,
            ),
            recognizer: TapGestureRecognizer()..onTap = () => function(),
          ),
          TextSpan(text: continueText, style: faintTextStyle),
        ],
      ),
    );
  }
}
