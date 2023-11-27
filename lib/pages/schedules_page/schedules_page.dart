import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:med_senior_mobile/components/buttons/button_footer.dart';
import 'package:med_senior_mobile/components/line.dart';
import 'package:med_senior_mobile/components/cards/card_list_schedules.dart';
import 'package:med_senior_mobile/components/loadings/loading.dart';
import 'package:med_senior_mobile/data/models/LoginProvider.dart';
import 'package:med_senior_mobile/data/repositories/implementations/http_api_repo_usoMedicacao.dart';
import 'package:med_senior_mobile/pages/schedules_page/schedules_controller.dart';
import 'package:med_senior_mobile/utils/flushBar.dart';
import 'package:provider/provider.dart';

class Schedules extends StatefulWidget {
  final Map? alert;
  const Schedules(this.alert, {super.key});

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  late SchedulesController _schedulesController;
  List<dynamic> listaMed = [];

  @override
  void initState() {
    super.initState();
    _schedulesController =
        SchedulesController(HttpApiReposirotyUsoMedicacao(dio: Dio()));
    _loadMedications();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (widget.alert!.isNotEmpty) {
        Alert.showToast(context, widget.alert!["message"], widget.alert!["cor"]);
      }
    });
  }

  Future<void> _loadMedications() async {
    String userId = context.read<LoginProvider>().iduser;
    String token = context.read<LoginProvider>().token;

    List<dynamic>? result =
        await _schedulesController.consultarUsoMedicamentos(userId, token);

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
      child: ChangeNotifierProvider<SchedulesController>(
        create: (context) => _schedulesController,
        child: Builder(
          builder: (context) {
            final local = context.watch<SchedulesController>();
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
                            "Medicamentos Agendados",
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
                                  final usoMed = listaMed[index];
                                  return CardListSchadules(usoMed);
                                },
                              ),
                      ),
                    ],
                  ),
                ),
                const ButtonFooter(
                  "Cadastrar Novo Agendamento",
                  "/cadastro/agendamento",
                  {"title": "Cadastrar Horário", "text": "Cadastrar Horário"},
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
