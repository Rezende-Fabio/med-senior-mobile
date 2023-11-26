import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:med_senior_mobile/components/loadings/loding_information_med.dart';
import 'package:med_senior_mobile/data/models/Medicacao.dart';
import 'package:med_senior_mobile/data/repositories/implementations/http_api_repo_medicacao.dart';
import 'package:med_senior_mobile/pages/more_information_med_page/information_med_controller.dart';
import 'package:provider/provider.dart';
import 'package:med_senior_mobile/components/carousel.dart';
import 'package:med_senior_mobile/components/line.dart';
import 'package:med_senior_mobile/components/cards/card_more_informations.dart';
import 'package:med_senior_mobile/components/buttons/buttons_more_information_med.dart';
import 'package:med_senior_mobile/data/models/LoginProvider.dart';

class MoreInformationMed extends StatefulWidget {
  final String medicamentoId;
  const MoreInformationMed(this.medicamentoId, {super.key});

  @override
  State<MoreInformationMed> createState() => _MoreInformationMedState();
}

class _MoreInformationMedState extends State<MoreInformationMed> {
  late InformationMedController _informationMedController;
  final PageController _pageController = PageController();
  Medicacao? medicacao;

  int _paginaAtual = 0;
  bool isExpanded = false;
  final _listaImagens = [
    {"id": 0, "imagem": ""},
    {"id": 1, "imagem": ""},
    {"id": 2, "imagem": ""},
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int prox = _pageController.page!.round();
      if (_paginaAtual != prox) {
        setState(() {
          _paginaAtual = prox;
        });
      }
    });
    _informationMedController =
        InformationMedController(HttpApiReposirotyMedicacao(dio: Dio()));
    _loadMedication();
  }

  Future<void> _loadMedication() async {
    String token = context.read<LoginProvider>().token;

    Medicacao? result = await _informationMedController.consultarMedicamento(
        widget.medicamentoId, token);

    if (result != null) {
      setState(() {
        medicacao = result;
      });
    }
  }

  Future<void> _exclusionMedication(String idMed) async {
    String token = context.read<LoginProvider>().token;

    await _informationMedController.excluirMedicacao(
        widget.medicamentoId, token);

    if (_informationMedController.isLoading == false &&
          _informationMedController.errorApi.isEmpty) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed("/home", arguments: {
          "alert": {
            "message": "Excluído com sucesso!",
            "cor": const Color.fromARGB(255, 22, 133, 0)
          },
          "paginaAtual": 0
        });
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed("/home", arguments: {
          "alert": {
            "message": _informationMedController.errorApi,
            "cor": const Color.fromARGB(255, 133, 0, 0)
          },
          "paginaAtual": 0
        });
      }
  }

  void _expandirContainer() {
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
                    _exclusionMedication(idMed);
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
        child: ChangeNotifierProvider<InformationMedController>(
          create: (context) => _informationMedController,
          child: Builder(
            builder: (context) {
              final local = context.watch<InformationMedController>();
              return local.isLoading
                  ? lodingInformationMed(context)
                  : Column(
                      children: [
                        Carousel(
                            _pageController,
                            _listaImagens,
                            Image.asset("assets/img/remedio.png"),
                            _paginaAtual),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    medicacao!.nome,
                                    style: const TextStyle(
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 5),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CardMoreInformation(
                                        "Administração", medicacao!.modoAdm),
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
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 5),
                                    child: AnimatedContainer(
                                      duration: const Duration(seconds: 1),
                                      height: isExpanded ? 170 : 40,
                                      color: isExpanded
                                          ? Colors.grey.withOpacity(0.2)
                                          : const Color.fromARGB(
                                              255, 250, 250, 250),
                                      child: SingleChildScrollView(
                                        physics: isExpanded
                                            ? const BouncingScrollPhysics()
                                            : const NeverScrollableScrollPhysics(),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "Detalhes do produto",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: _expandirContainer,
                                                  icon: isExpanded
                                                      ? const Icon(
                                                          Icons
                                                              .keyboard_arrow_down_sharp,
                                                          size: 28,
                                                        )
                                                      : const Icon(
                                                          Icons
                                                              .keyboard_arrow_right_sharp,
                                                          size: 28,
                                                        ),
                                                )
                                              ],
                                            ),
                                            Opacity(
                                              opacity: isExpanded ? 1 : 0,
                                              child: Text(
                                                medicacao!.descricao,
                                                softWrap: true,
                                                style: const TextStyle(
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
                                  ButtonsMoreInformationMed(
                                      "/cadastro/medicacao",
                                      "Editar Medicamento",
                                      "Editar Medicamento",
                                      medicacao: medicacao,
                                      exclusionMedication: _showModal,
                                      textModal: medicacao!.nome,
                                      idExclusion: medicacao!.id,
                                      ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
