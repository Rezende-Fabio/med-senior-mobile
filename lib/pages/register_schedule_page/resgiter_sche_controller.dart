import 'package:flutter/material.dart';
import 'package:med_senior_mobile/data/repositories/api_repository_usoMedicacao.dart';
import 'package:med_senior_mobile/data/repositories/error/api_exception.dart';

class ResgisterScheController extends ChangeNotifier {
  final ApiRepositoryUsoMedicacao apiRepositoryUsoMedicacao;
  final Function _loadingScreen;

  ResgisterScheController(this.apiRepositoryUsoMedicacao, this._loadingScreen);

  String errorApi = "";

  bool isLoading = false;

  Future<void> inserirUsoMedicamento(Map usoMedicamento, String token) async {
    isLoading = true;
    errorApi = "";
    _loadingScreen(isLoading, errorApi);

    try {
      await apiRepositoryUsoMedicacao.post(usoMedicamento, token);
      isLoading = false;
      errorApi = "";
      _loadingScreen(isLoading, errorApi);
    } on ApiException catch (error) {
      errorApi = error.message;
      isLoading = false;
      _loadingScreen(isLoading, errorApi);
    }
  }

  Future<void> editarUsoMedicamento(
      Map usoMedicamento, String usoMedicamentoId, String token) async {
    isLoading = true;
    errorApi = "";
    _loadingScreen(isLoading, errorApi);

    try {
      await apiRepositoryUsoMedicacao.put(usoMedicamento, usoMedicamentoId, token);
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
