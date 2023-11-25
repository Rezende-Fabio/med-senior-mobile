import 'package:flutter/material.dart';
import 'package:med_senior_mobile/data/repositories/api_repository_medicacao.dart';
import 'package:med_senior_mobile/data/repositories/error/api_exception.dart';
import 'package:med_senior_mobile/data/models/Medicacao.dart';

class InformationMedController extends ChangeNotifier {
  final ApiRepositoryMedicacao apiRepositoryMedicacao;

  InformationMedController(this.apiRepositoryMedicacao);

  // Caso de erro ao fazer login
  String errorApi = "";

  bool isLoading = true;

  Future<Medicacao?> consultarMedicamento(
      String medicamentoId, String token) async {
    isLoading = true;
    errorApi = "";
    notifyListeners();

    try {
      final medicacao = await apiRepositoryMedicacao.get(medicamentoId, token);
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
      String medicamentoId, String token) async {
    isLoading = true;
    errorApi = "";
    notifyListeners();

    try {
      await apiRepositoryMedicacao.delete(medicamentoId, token);
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
