import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/carousel.dart';
import '../components/line.dart';
import '../components/card_more_informations.dart';

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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 22, right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5)),
                              child: IconButton(
                                onPressed: () => {},
                                icon: const Icon(
                                  Icons.restore_from_trash_rounded,
                                  size: 28,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () => {
                                  Navigator.of(context).pushNamed(
                                      "/cadastro/agendamento",
                                      arguments: {
                                        "title": "Editar Horário",
                                        "text": "Editar Horário"
                                      })
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(85, 101, 238, 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Text(
                                  "Editar",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
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
