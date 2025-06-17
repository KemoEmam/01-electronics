import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showSnackBar(
    {required BuildContext context,
    String title = "Info",
    required String message,
    IconData icon = Icons.info,
    Color backgroundColor = Colors.blueAccent}) {
  Flushbar(
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(8),
    backgroundColor: backgroundColor,
    icon: Icon(
      icon,
      color: Colors.white,
      size: 28,
    ),
    flushbarPosition: FlushbarPosition.BOTTOM,
    title: title,
    message: message,
    duration: const Duration(seconds: 3),
    animationDuration: const Duration(milliseconds: 230),
    leftBarIndicatorColor: Colors.white,
  ).show(context);
}
