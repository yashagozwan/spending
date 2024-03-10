import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static void show(
    String message, {
    bool isError = false,
  }) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: isError ? Colors.red : Colors.green,
      fontSize: 14,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
    );
  }
}
