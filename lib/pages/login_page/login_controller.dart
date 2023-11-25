import 'package:flutter/material.dart';
import 'package:med_senior_mobile/data/models/IdosoProvider.dart';
import 'package:med_senior_mobile/data/repositories/api_repository_login.dart';
import 'package:med_senior_mobile/data/repositories/error/api_exception.dart';
import 'package:med_senior_mobile/data/models/LoginProvider.dart';

class LoginController extends ChangeNotifier {
  final ApiRepositoryLogin apiRepositoryLogin;

  LoginController(this.apiRepositoryLogin);

  // Caso de erro ao fazer login
  String errorApi = "";

  bool isLoading = false;

  Future<LoginProvider?> login(String email, String senha) async {
    isLoading = true;
    errorApi = "";
    notifyListeners();

    try {
      final login = await apiRepositoryLogin.getLogin(email, senha);
      isLoading = false;
      errorApi = "";
      notifyListeners();
      return login;
    } on ApiException catch (error) {
      errorApi = error.message;
      isLoading = false;
      notifyListeners();
      return null;
    }
  }


  Future<IdosoProvider?> getUser(String id, String token) async {
    isLoading = true;
    errorApi = "";
    notifyListeners();

    try {
      final user = await apiRepositoryLogin.getUser(id, token);
      isLoading = false;
      errorApi = "";
      notifyListeners();
      return user;
    } on ApiException catch (error) {
      errorApi = error.message;
      isLoading = false;
      notifyListeners();
      return null;
    }
  }
}
