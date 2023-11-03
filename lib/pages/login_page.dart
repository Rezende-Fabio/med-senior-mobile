import 'package:flutter/material.dart';
import '../components/form_login.dart';
import '../components/button_footer.dart';
import '../routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: SizedBox(
              width: 150,
              child: Image.asset("assets/img/icone_MedSenior_1.png"),
            ),
          ),
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
                        "Entrar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      Text(
                        "Entre com o seu E-mail e senha",
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
            child: FormLogin(),
          ),
          const Center(
            child: Column(
              children: [
                ButtonFooter("Entrar", ""),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Não tem conta?  "),
                      Text(
                        "Cadastre-se",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
