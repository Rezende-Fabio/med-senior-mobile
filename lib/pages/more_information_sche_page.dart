import 'package:flutter/material.dart';
import 'package:med_senior_mobile/components/carousel.dart';
import 'package:med_senior_mobile/components/line.dart';
import 'package:med_senior_mobile/components/cards/card_more_informations.dart';
import 'package:med_senior_mobile/components/buttons/buttons_more_information.dart';

class MoreInformationSche extends StatefulWidget {
  const MoreInformationSche({super.key});

  @override
  State<MoreInformationSche> createState() => _MoreInformationScheState();
}

class _MoreInformationScheState extends State<MoreInformationSche> {
  final PageController _pageController = PageController();

  int _paginaAtual = 0;
  bool isExpanded = false;
  final _listaImagens = [
    {"id": 0, "imagem": ""},
    {"id": 1, "imagem": ""},
    {"id": 2, "imagem": ""},
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      int prox = _pageController.page!.round();
      if (_paginaAtual != prox) {
        setState(() {
          _paginaAtual = prox;
        });
      }
    });
    super.initState();
  }

  void expandirContainer() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  _showModal(String medicacao, String idMed) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          contentTextStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 25),
          titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 1, 1, 1), fontWeight: FontWeight.bold, fontSize: 16),
          title: const Text("Aviso"),
          content: Text("Deseja excluir a medicação $medicacao?"),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.black),
                  child: const Text("NÃO"),
                ),
                TextButton(
                  onPressed: () {
                  },
                  style: TextButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.red),
                  child: const Text("SIM"),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Carousel(_pageController, _listaImagens,
                Image.asset("assets/img/icone_MedSenior_2.png"), _paginaAtual),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "DIPIRONA",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Line(top: 15, right: 10, left: 10, bottom: 25),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const CardMoreInformation("Gotas", "40"),
                          Line(top: 10, right: 0, left: 0, bottom: 20),
                          const CardMoreInformation(
                              "Intervalo de Horas", "8 Horas"),
                          Line(top: 10, right: 0, left: 0, bottom: 20),
                          const CardMoreInformation("Data Final", "24/12/2023"),
                          Line(top: 10, right: 0, left: 0, bottom: 20),
                          const CardMoreInformation(
                              "Horário do primeiro consumo", "08:00"),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Line(top: 10, right: 10, left: 10, bottom: 15),
            ButtonsMoreInformation(
              "/cadastro/agendamento",
              "Editar Horário",
              "Editar Horário",
              exclusionMedication: _showModal,
              textModal: "",
              idExclusion: "",
            ),
          ],
        ),
      ),
    );
  }
}
