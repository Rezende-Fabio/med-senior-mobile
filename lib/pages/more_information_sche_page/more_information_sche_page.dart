import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:med_senior_mobile/components/buttons/buttons_more_information_sche.dart';
import 'package:med_senior_mobile/components/carousel.dart';
import 'package:med_senior_mobile/components/line.dart';
import 'package:med_senior_mobile/components/cards/card_more_informations.dart';
import 'package:med_senior_mobile/components/loadings/loding_information_sche.dart';
import 'package:med_senior_mobile/data/models/LoginProvider.dart';
import 'package:med_senior_mobile/data/models/UsoMedicacao.dart';
import 'package:med_senior_mobile/data/repositories/implementations/http_api_repo_usoMedicacao.dart';
import 'package:med_senior_mobile/pages/more_information_sche_page/information_sche_controller.dart';
import 'package:med_senior_mobile/utils/formatDate.dart';
import 'package:provider/provider.dart';

class MoreInformationSche extends StatefulWidget {
  final String usoMedicamentoId;
  const MoreInformationSche(this.usoMedicamentoId, {super.key});

  @override
  State<MoreInformationSche> createState() => _MoreInformationScheState();
}

class _MoreInformationScheState extends State<MoreInformationSche> {
  late InformationScheController _informationScheController;
  final PageController _pageController = PageController();
  UsoMedicacao? usoMedicacao;

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
    _informationScheController =
        InformationScheController(HttpApiReposirotyUsoMedicacao(dio: Dio()));
    _loadMedication();
  }

  Future<void> _loadMedication() async {
    String token = context.read<LoginProvider>().token;

    UsoMedicacao? result = await _informationScheController
        .consultarUsoMedicamento(widget.usoMedicamentoId, token);

    if (result != null) {
      setState(() {
        usoMedicacao = result;
      });
    }
  }

  void expandirContainer() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  Future<void> _exclusionMedication(String idMed) async {
    String token = context.read<LoginProvider>().token;

    await _informationScheController.excluirMedicacao(
        widget.usoMedicamentoId, token);

    if (_informationScheController.isLoading == false &&
          _informationScheController.errorApi.isEmpty) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed("/home", arguments: {
          "alert": {
            "message": "Excluído com sucesso!",
            "cor": const Color.fromARGB(255, 22, 133, 0)
          },
          "paginaAtual": 1
        });
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed("/home", arguments: {
          "alert": {
            "message": _informationScheController.errorApi,
            "cor": const Color.fromARGB(255, 133, 0, 0)
          },
          "paginaAtual": 1
        });
      }
  }

  _showModal(String medicacao, String idMed) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          contentTextStyle: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), fontSize: 25),
          titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 1, 1, 1),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          title: const Text("Aviso"),
          content: Text("Deseja excluir o uso da medicação $medicacao?"),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black),
                  child: const Text("NÃO"),
                ),
                TextButton(
                  onPressed: () {
                    _exclusionMedication(idMed);
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red),
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
        child: ChangeNotifierProvider<InformationScheController>(
          create: (context) => _informationScheController,
          child: Builder(
            builder: (context) {
              final local = context.watch<InformationScheController>();
              return local.isLoading
                  ? lodingInformationSche(context)
                  : Column(
                      children: [
                        Carousel(
                          _pageController,
                          _listaImagens,
                          Image.asset("assets/img/agendamento.png"),
                          _paginaAtual,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10, right: 10, top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    usoMedicacao!.medicacao.nome,
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
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      CardMoreInformation(
                                          "Gotas", "${usoMedicacao!.dosagem}"),
                                      Line(
                                          top: 10,
                                          right: 0,
                                          left: 0,
                                          bottom: 20),
                                      CardMoreInformation(
                                          "Intervalo de Horas", "${usoMedicacao!.intervalo}"),
                                      Line(
                                          top: 10,
                                          right: 0,
                                          left: 0,
                                          bottom: 20),
                                      CardMoreInformation(
                                          "Data Final", dateTimeToDateString(usoMedicacao!.dataFinal)),
                                      Line(
                                          top: 10,
                                          right: 0,
                                          left: 0,
                                          bottom: 20),
                                      CardMoreInformation(
                                          "Horário do primeiro consumo",
                                          dateTimeToTimeString(usoMedicacao!.horaInicial)),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Line(top: 10, right: 10, left: 10, bottom: 15),
                        ButtonsMoreInformationSche(
                          "/cadastro/agendamento",
                          "Editar Horário",
                          "Editar Horário",
                          exclusionMedication: _showModal,
                          textModal: usoMedicacao!.medicacao.nome,
                          idExclusion: usoMedicacao!.id,
                          medicacao: usoMedicacao,
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
