import 'package:flutter/material.dart';
import 'package:med_senior_mobile/data/repositories/api_repository_medicacao.dart';
import 'package:med_senior_mobile/data/repositories/error/api_exception.dart';
import '../../data/models/Medicacao.dart';

class InformationMedController extends ChangeNotifier {
  final ApiRepositoryMedicacao apiRepositoryMedicacao;

  InformationMedController(this.apiRepositoryMedicacao);

  // Caso de erro ao fazer login
  String errorApi = "";

  bool isLoading = true;

  Future<Medicacao?> consultarMedicamento(
      String medicamnetoId, String token) async {
    isLoading = true;
    errorApi = "";
    notifyListeners();

    try {
      final medicacao = await apiRepositoryMedicacao.get(medicamnetoId, token);
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
}
