import 'package:flutter/material.dart';
import 'package:med_senior_mobile/components/buttons/button_footer.dart';
import 'package:med_senior_mobile/components/line.dart';
import 'package:med_senior_mobile/components/cards/card_list_schedules.dart';
import 'package:med_senior_mobile/components/loadings/loading.dart';

class Schedules extends StatefulWidget {
  const Schedules({super.key});

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  List<String> lista = ["1", "2", "3", "4", "5", "6"];
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
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
                  child: ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (ctx, index) {
                      final fv = lista[index];
                      return _isLoading
                          ? lodingCard(context)
                          : CardListSchadules(fv);
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
      ),
    );
  }
}
