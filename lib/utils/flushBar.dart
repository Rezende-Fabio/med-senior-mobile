import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Alert {
  static showToast(context, String message, Color cor) {
    return Flushbar(
      duration: const Duration(seconds: 5),
      title: "Aviso",
      titleSize: 25,
      message: message,
      messageSize: 15,
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.only(top: 35, left: 10, right: 10),
      borderRadius: BorderRadius.circular(25),
      backgroundColor: cor,
    )..show(context);
  }
}
