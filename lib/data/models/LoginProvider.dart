import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  String _iduser;
  String _token;
  late bool _isAuthenticated;

  String get iduser => _iduser;
  String get token => _token;

  set iduser(String value) {
    _iduser = value;
    notifyListeners();
  }

  set token(String value) {
    _token = value;
    notifyListeners();
  }

  LoginProvider({required String iduser, required String token})
      : _iduser = iduser,
        _token = token;

  factory LoginProvider.fromMap(Map<String, dynamic> map) {
    return LoginProvider(
      iduser: map["data"]["idUsuario"],
      token: map["data"]["access_token"],
    );
  }

  void login(String idUser, String token) {
    _iduser = idUser;
    _token = token;
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _iduser = "";
    _token = "";
    notifyListeners();
  }

  bool checkLogin() {
    return _isAuthenticated;
  }
}
