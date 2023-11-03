import 'package:flutter/material.dart';
import 'package:med_senior_mobile/routes.dart';
import '../components/button_footer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(125, 153, 253, 1.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 115),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(child: Column(
                  children: [
                    SizedBox(
                      width: 350,
                      child: Image.asset("assets/img/icone_MedSenior_2.png"),
                    ),
                    const Text("Bem-vindo(a)", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35
                    ),),
                  ],
                )),
                ButtonFooter("Entrar", RouteGenerator.loginPage),
              ],
            ),
          ),
        ));
  }
}
