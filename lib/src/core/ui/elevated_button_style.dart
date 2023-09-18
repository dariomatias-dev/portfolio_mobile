import 'package:flutter/material.dart';

class ElevatedButtonStyle {
  static final ButtonStyle defaultStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.grey.withOpacity(0.1),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}
