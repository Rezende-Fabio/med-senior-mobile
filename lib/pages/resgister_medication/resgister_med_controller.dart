import 'package:flutter/material.dart';
import 'package:med_senior_mobile/data/repositories/api_repository_medicacao.dart';
import 'package:med_senior_mobile/data/repositories/error/api_exception.dart';

class ResgisterMedMedController extends ChangeNotifier {
  final ApiRepositoryMedicacao apiRepositoryMedicacao;
  final Function _loadingScreen;

  ResgisterMedMedController(this.apiRepositoryMedicacao, this._loadingScreen);

  // Caso de erro ao fazer login
  String errorApi = "";

  bool isLoading = false;

  Future<void> inserirMedicamento(Map medicamento, String token) async {
    isLoading = true;
    errorApi = "";
    _loadingScreen(isLoading, errorApi);

    try {
      await apiRepositoryMedicacao.post(medicamento, token);
      isLoading = false;
      errorApi = "";
      _loadingScreen(isLoading, errorApi);
    } on ApiException catch (error) {
      errorApi = error.message;
      isLoading = false;
      _loadingScreen(isLoading, errorApi);
    }
  }

  Future<void> editarMedicamento(
      Map medicamento, String medicamentoId, String token) async {
    isLoading = true;
    errorApi = "";
    _loadingScreen(isLoading, errorApi);

    try {
      await apiRepositoryMedicacao.put(medicamento, medicamentoId, token);
      isLoading = false;
      errorApi = "";
      _loadingScreen(isLoading, errorApi);
    } on ApiException catch (error) {
      errorApi = error.message;
      isLoading = false;
      _loadingScreen(isLoading, errorApi);
    }
  }
}
