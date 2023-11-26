import 'package:flutter/material.dart';
import 'package:med_senior_mobile/data/models/UsoMedicacao.dart';
import 'package:med_senior_mobile/data/repositories/api_repository_usoMedicacao.dart';
import 'package:med_senior_mobile/data/repositories/error/api_exception.dart';
import 'package:med_senior_mobile/data/models/Medicacao.dart';

class InformationScheController extends ChangeNotifier {
  final ApiRepositoryUsoMedicacao apiRepositoryUsoMedicacao;

  InformationScheController(this.apiRepositoryUsoMedicacao);

  String errorApi = "";

  bool isLoading = true;

  Future<UsoMedicacao?> consultarUsoMedicamento(
      String usoMedicamentoId, String token) async {
    isLoading = true;
    errorApi = "";
    notifyListeners();

    try {
      final medicacao = await apiRepositoryUsoMedicacao.get(usoMedicamentoId, token);
      isLoading = false;
      errorApi = "";
      notifyListeners();
      return medicacao;
    } on ApiException catch (error) {
      errorApi = error.message;
      isLoading = false;
      notifyListeners();
      return null;
    }
  }

  Future<void> excluirMedicacao(
      String usoMedicamentoId, String token) async {
    isLoading = true;
    errorApi = "";
    notifyListeners();

    try {
      await apiRepositoryUsoMedicacao.delete(usoMedicamentoId, token);
      isLoading = false;
      errorApi = "";
      notifyListeners();
    } on ApiException catch (error) {
      errorApi = error.message;
      isLoading = false;
      notifyListeners();
    }
  }
}
