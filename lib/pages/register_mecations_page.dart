import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/button_footer.dart';

class RegisterMedciations extends StatefulWidget {
  const RegisterMedciations({super.key});

  @override
  State<RegisterMedciations> createState() => _RegisterMedciationsState();
}

class _RegisterMedciationsState extends State<RegisterMedciations> {
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
                    "Cadastrar Medicamento",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    "",
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0)),
                    color: const Color.fromARGB(255, 192, 192, 192)),
                child: Column(
                  children: [
                    const ButtonFooter("Cadastrar Medicamento", ""),
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
