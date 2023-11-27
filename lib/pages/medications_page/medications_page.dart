import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:med_senior_mobile/data/models/LoginProvider.dart';
import 'package:med_senior_mobile/data/repositories/implementations/http_api_repo_medicacao.dart';
import 'package:med_senior_mobile/pages/medications_page/medications_controller.dart';
import 'package:provider/provider.dart';
import 'package:med_senior_mobile/components/buttons/button_footer.dart';
import 'package:med_senior_mobile/components/line.dart';
import 'package:med_senior_mobile/components/cards/card_list_medications.dart';
import 'package:med_senior_mobile/components/loadings/loading.dart';
import 'package:another_flushbar/flushbar.dart';

class Medications extends StatefulWidget {
  final Map? alert;
  const Medications(this.alert, {super.key});

  @override
  State<Medications> createState() => _MedicationsState();
}

class _MedicationsState extends State<Medications> {
  late MedicationsController _medicationsController;
  List<dynamic> listaMed = [];

  @override
  void initState() {
    super.initState();
    _medicationsController =
        MedicationsController(HttpApiReposirotyMedicacao(dio: Dio()));
    _loadMedications();
  
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (widget.alert!.isNotEmpty) {
        showToast(widget.alert!["message"], widget.alert!["cor"]);
      }
    });
  }

  void showToast(String message, Color cor) => Flushbar(
        duration: const Duration(seconds: 5),
        title: "Aviso",
        titleSize: 25,
        message: message,
        messageSize: 15,
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.only(top: 35, left: 10, right: 10),
        borderRadius: BorderRadius.circular(25),
        backgroundColor: cor,
      )..show(context);

  Future<void> _loadMedications() async {
    String userId = context.read<LoginProvider>().iduser;
    String token = context.read<LoginProvider>().token;

    List<dynamic>? result =
        await _medicationsController.consultarMedicamentos(userId, token);

    if (result != null) {
      setState(() {
        listaMed = result;
      });
    } else {
      setState(() {
        listaMed = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider<MedicationsController>(
        create: (context) => _medicationsController,
        child: Builder(
          builder: (context) {
            final local = context.watch<MedicationsController>();
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 25),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Medicações",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      Line(top: 10, right: 0, bottom: 15, left: 0),
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: local.isLoading
                            ? lodingCard(context)
                            : ListView.builder(
                                itemCount: listaMed.length,
                                itemBuilder: (ctx, index) {
                                  final med = listaMed[index];
                                  return CardListMedications(med);
                                },
                              ),
                      ),
                    ],
                  ),
                ),
                const ButtonFooter(
                    "Cadastrar Novo Medicamento", "/cadastro/medicacao", {
                  "title": "Cadastrar Medicamento",
                  "text": "Cadastrar Medicamento",
                  "medicacao": null
                }),
              ],
            );
          },
        ),
      ),
    );
  }
}
