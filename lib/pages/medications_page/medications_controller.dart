import 'package:flutter/material.dart';
import 'package:med_senior_mobile/data/repositories/api_repository_medicacao.dart';
import 'package:med_senior_mobile/data/repositories/error/api_exception.dart';
import '../../data/models/Medicacao.dart';

class MedicationsController extends ChangeNotifier {
  final ApiRepositoryMedicacao apiRepositoryMedicacao;

  MedicationsController(this.apiRepositoryMedicacao);

  // Caso de erro ao fazer login
  String errorApi = "";

  bool isLoading = true;

  List<Medicacao> fromList(List<dynamic> list) {
    List<Medicacao> listaMed = [];
    if (list.isNotEmpty) {
      for (var element in list) {
        Medicacao med = Medicacao(
            id: element["id"],
            nome: element["nome"],
            modoAdm: element["modoAdm"],
            descricao: element["descricao"],
            estoque: element["estoque"],
            falhas: element["falhas"],
            idosoId: element["idosoId"]);

        listaMed.add(med);
      }

      return listaMed;
    } else {
      return listaMed;
    }
  }

  Future<List<Medicacao>?> consultarMedicamentos(
      String idosoId, String token) async {
    isLoading = true;
    errorApi = "";
    notifyListeners();

    try {
      final medicacoes = await apiRepositoryMedicacao.getAll(idosoId, token);
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
