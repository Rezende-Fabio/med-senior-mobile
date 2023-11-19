import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/carousel.dart';
import '../components/line.dart';
import '../components/card_more_informations.dart';
import '../components/buttons_more_information.dart';

class MoreInformationMed extends StatefulWidget {
  const MoreInformationMed({super.key});

  @override
  State<MoreInformationMed> createState() => _MoreInformationMedState();
}

class _MoreInformationMedState extends State<MoreInformationMed> {
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
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 5),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CardMoreInformation("Administração", "Gotas"),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Line(top: 15, right: 10, left: 10, bottom: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: isExpanded ? 170 : 40,
                          child: SingleChildScrollView(
                            physics: isExpanded
                                ? const BouncingScrollPhysics()
                                : const NeverScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Detalhes do produto",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: expandirContainer,
                                      icon: isExpanded
                                          ? const Icon(
                                              Icons.keyboard_arrow_down_sharp,
                                              size: 28,
                                            )
                                          : const Icon(
                                              Icons.keyboard_arrow_right_sharp,
                                              size: 28,
                                            ),
                                    )
                                  ],
                                ),
                                Opacity(
                                  opacity: isExpanded ? 1 : 0,
                                  child: const Text(
                                    "Lorem ipsum dolor sit amet. Ut cumque dolore 33 omnis exercitationem ut sint ipsum vel optio magnam et natus expedita qui debitis delectus eum tempore voluptas. Qui voluptatem temporibus in odit dolores ut temporibus alias a enim vitae qui consequatur laborum!",
                                    softWrap: true,
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const ButtonsMoreInformation("/cadastro/medicacao", "Editar Medicamento", "Editar Medicamento"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
