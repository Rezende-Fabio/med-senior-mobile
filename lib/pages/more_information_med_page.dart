import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/carousel.dart';
import '../components/line.dart';

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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Administração",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text(
                                        "Gotas",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
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
                                      "/cadastro/medicacao",
                                      arguments: {
                                        "title": "Editar Medicamento",
                                        "text": "Editar Medicamento"
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
