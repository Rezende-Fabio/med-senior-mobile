import 'package:flutter/material.dart';
import 'package:med_senior_mobile/data/models/UsoMedicacao.dart';
import 'package:med_senior_mobile/data/repositories/api_repository_usoMedicacao.dart';
import 'package:med_senior_mobile/data/repositories/error/api_exception.dart';
import 'package:med_senior_mobile/data/models/Medicacao.dart';

class SchedulesController extends ChangeNotifier {
  final ApiRepositoryUsoMedicacao apiRepositoryUsoMedicacao;

  SchedulesController(this.apiRepositoryUsoMedicacao);

  // Caso de erro ao fazer login
  String errorApi = "";

  bool isLoading = true;

  List<UsoMedicacao> fromList(List<dynamic> list) {
    List<UsoMedicacao> listaMed = [];
    if (list.isNotEmpty) {
      for (var element in list) {
        UsoMedicacao usoMed = UsoMedicacao(
          id: element["id"],
          dosagem: element["dosagem"],
          intervalo: element["intervalo"],
          horaInicial: element["horaInicial"],
          dataFinal: element["dataFinal"],
          idosoId: element["idosoId"],
        );
        usoMed.setMed(Medicacao.fromMap(element["medicacao"]));
        usoMed.setMedId(element["medId"]);

        listaMed.add(usoMed);
      }

      return listaMed;
    } else {
      return listaMed;
    }
  }

  Future<List<UsoMedicacao>?> consultarUsoMedicamentos(
      String idosoId, String token) async {
    isLoading = true;
    errorApi = "";
    notifyListeners();

    try {
      final medicacoes = await apiRepositoryUsoMedicacao.getAll(idosoId, token);
      isLoading = false;
      errorApi = "";
      notifyListeners();
      return fromList(medicacoes);
    } on ApiException catch (error) {
      errorApi = error.message;
      isLoading = false;
      notifyListeners();
      return null;
    }
  }
}
