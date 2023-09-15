import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/elevated_button_style.dart';
import 'package:portfolio/src/core/ui/helpers/open_url.dart';

class LinkButtonWidget extends StatelessWidget {
  const LinkButtonWidget({
    super.key,
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        OpenUrl(
          context: context,
        ).launch(url);
      },
      style: ElevatedButtonStyle.defaultStyle,
      child: Text(
        name,
      ),
    );
  }
}
