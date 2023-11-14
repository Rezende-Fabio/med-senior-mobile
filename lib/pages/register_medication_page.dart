import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/button_footer.dart';

class RegisterMedication extends StatefulWidget {
  final String titlePage;
  final String textButton;
  const RegisterMedication(this.titlePage, this.textButton, {super.key});

  @override
  State<RegisterMedication> createState() => _RegisterMedicationState();
}

class _RegisterMedicationState extends State<RegisterMedication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 25, left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => {Navigator.of(context).pop()},
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                  Text(
                    widget.titlePage,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const Text(
                    "",
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0)),
                    color: Color.fromARGB(255, 192, 192, 192)),
                child: Column(
                  children: [
                    ButtonFooter(widget.textButton, "", const {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
