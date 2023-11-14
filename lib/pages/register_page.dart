import 'package:flutter/material.dart';
import '../components/form_register.dart';
import '../components/button_footer.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    width: double.infinity,
                    child: const Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cadastrar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            Text(
                              "Entre com as suas credenciais e continue",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 109, 109, 109),
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Center(
                  child: FormRegister(),
                ),
                Center(
                  child: Column(
                    children: [
                      const ButtonFooter("Cadastrar", "", {}),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Já possui conta?  "),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed("/login");
                              },
                              child: const Text(
                                "Entar",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
