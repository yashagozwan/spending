import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static void showMessage(
    BuildContext context, {
    String message = 'message',
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
