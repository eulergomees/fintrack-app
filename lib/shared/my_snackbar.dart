// 🐦 Flutter imports:
import 'package:flutter/material.dart';

showSnackBar(
    {required BuildContext context,
    required String text,
    bool isError = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(text),
    backgroundColor: (isError) ? Colors.red : Colors.green,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    duration: const Duration(seconds: 4),
    showCloseIcon: true,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
