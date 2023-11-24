import 'package:flutter/cupertino.dart';

class Login extends ChangeNotifier {
  String _iduser;
  String _token;

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

  Login({required String iduser, required String token})
      : _iduser = iduser,
        _token = token;

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      iduser: map["data"]["idUsuario"],
      token: map["data"]["access_token"],
    );
  }
}
