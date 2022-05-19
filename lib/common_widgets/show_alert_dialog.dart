import 'package:flutter/material.dart';

Future<void> showAlertDialog(
    {required BuildContext context,
    required String title,
    required String defaultText}) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(defaultText),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              )
            ],
          ));
}
