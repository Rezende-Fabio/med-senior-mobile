import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/carousel.dart';
import '../components/line.dart';
import '../components/cards/card_more_informations.dart';
import '../components/buttons/buttons_more_information.dart';

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
                          const CardMoreInformation("Intervalo de Horas", "8 Horas"),
                          Line(top: 10, right: 0, left: 0, bottom: 20),
                          const CardMoreInformation("Data Final", "24/12/2023"),
                          Line(top: 10, right: 0, left: 0, bottom: 20),
                          const CardMoreInformation("Horário do primeiro consumo", "08:00"),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Line(top: 10, right: 10, left: 10, bottom: 15),
            const ButtonsMoreInformation("/cadastro/agendamento", "Editar Horário", "Editar Horário"),
          ],
        ),
      ),
    );
  }
}
