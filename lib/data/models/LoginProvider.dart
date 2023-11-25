import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
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

  LoginProvider({required String iduser, required String token})
      : _iduser = iduser,
        _token = token;

  factory LoginProvider.fromMap(Map<String, dynamic> map) {
    return LoginProvider(
      iduser: map["data"]["idUsuario"],
      token: map["data"]["access_token"],
    );
  }
}
