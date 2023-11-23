import 'package:flutter/material.dart';
import 'package:med_senior_mobile/pages/start_page/start_controller.dart';
import 'package:provider/provider.dart';
import '../../components/alert_start_page.dart';
import '../../components/button_footer.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<StartController>(
        create: (context) => StartController(),
        child: Builder(
          builder: (context) {
            final local = context.watch<StartController>();
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color.fromRGBO(125, 153, 253, 1.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 115),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 350,
                          child:
                              Image.asset("assets/img/icone_MedSenior_2.png"),
                        ),
                        const Text(
                          "Bem-vindo(a)",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35),
                        ),
                      ],
                    ),
                    Container(
                      child: local.erro == ""
                          ? const ButtonFooter("Entrar", "/login", {})
                          : AlertStartPage(local.erro),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
