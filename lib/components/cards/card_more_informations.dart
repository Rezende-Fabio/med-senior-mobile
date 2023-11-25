import 'package:flutter/material.dart';

class CardMoreInformation extends StatelessWidget {
  final String text;
  final String valor;
  const CardMoreInformation(this.text, this.valor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 25, left: 25, top: 8, bottom: 8),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  valor,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
