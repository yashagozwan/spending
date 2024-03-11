import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  static String dateFormat(String createdAt) {
    return DateFormat("dd-MM-yyyy").format(DateTime.parse(createdAt));
  }
}
