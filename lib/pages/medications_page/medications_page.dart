import 'package:flutter/material.dart';
import '../../components/button_footer.dart';
import '../../components/line.dart';
import '../../components/card_list_medications.dart';
import '../../components/loading.dart';

class Medications extends StatefulWidget {
  const Medications({super.key});

  @override
  State<Medications> createState() => _MedicationsState();
}

class _MedicationsState extends State<Medications> {
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
                  child: ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (ctx, index) {
                      final fv = lista[index];
                      return _isLoading
                          ? lodingCard(context)
                          : CardListMedications(fv);
                    },
                  ),
                ),
              ],
            ),
          ),
          const ButtonFooter(
              "Cadastrar Novo Medicamento", "/cadastro/medicacao", {"title": "Cadastrar Medicamento", "text": "Cadastrar Medicamento"}),
        ],
      ),
    );
  }
}
