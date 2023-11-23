import 'package:flutter/material.dart';

class AlertStartPage extends StatelessWidget {
  final String message;
  const AlertStartPage(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          message,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 35, right: 35, top: 15),
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Text(
              "Entrar",
              style: const TextStyle(fontSize: 17),
            ),
          ),
        )
      ],
    );
  }
}
