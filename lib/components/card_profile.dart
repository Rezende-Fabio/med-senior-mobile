import 'package:flutter/material.dart';

class CardProfile extends StatelessWidget {
  final String title;
  final String value;
  const CardProfile(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 220, 220, 220),
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
