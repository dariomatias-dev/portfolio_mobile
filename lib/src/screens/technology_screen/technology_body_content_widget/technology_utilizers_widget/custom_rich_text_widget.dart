import 'package:flutter/material.dart';

class CustomRichTextWidget extends StatelessWidget {
  const CustomRichTextWidget({
    super.key,
    required this.title,
    required this.names,
  });

  final String title;
  final String names;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '$title ',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: names,
          ),
        ],
      ),
    );
  }
}
