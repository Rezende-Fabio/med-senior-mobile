import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:med_senior_mobile/data/repositories/api_repository_login.dart';
import 'package:med_senior_mobile/data/repositories/error/api_exception.dart';

class LoginController extends ChangeNotifier {
  final ApiRepositoryLogin apiRepositoryLogin;

  LoginController(this.apiRepositoryLogin);

  // Caso de erro ao fazer login
  String errorApi = "";

  bool isLoading = false;

  Future<void> login(String email, String senha) async {
    isLoading = true;
    errorApi = "";
    notifyListeners();

    try {
      final idosoPost = await apiRepositoryLogin.getLogin(email, senha);
      isLoading = false;
      errorApi = "";
      notifyListeners();
      return idosoPost;
    } on ApiException catch (error) {
      errorApi = error.message;
      isLoading = false;
      notifyListeners();
    }
  }
}
