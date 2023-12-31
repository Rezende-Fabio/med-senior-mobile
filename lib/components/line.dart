import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Line extends StatelessWidget {
  double top = 0;
  double left = 0;
  double right = 0;
  double bottom = 0;
  Line({super.key, required this.top, required this.right, required this.bottom, required this.left});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, right: right, bottom: bottom, left: left),
      child: Container(
        height: 1,
        color: const Color.fromARGB(255, 154, 154, 154),
      ),
    );
  }
}
