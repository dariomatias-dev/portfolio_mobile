import 'package:flutter/material.dart';

class ShowAlertDialog {
  void show(
    BuildContext screenContext,
    String title,
    String content,
  ) {
    showDialog(
      context: screenContext,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          content: Text(
            content,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
