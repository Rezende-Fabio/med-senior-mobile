import 'package:flutter/material.dart';

class IdosoProvider extends ChangeNotifier {
  late String _nome;
  late String _telefone;
  late String _email;
  late String _codigo;

  String get nome => _nome;
  String get telefone => _telefone;
  String get email => _email;
  String get codigo => _codigo;

  set nome(String value) {
    _nome = value;
    notifyListeners();
  }

  set telefone(String value) {
    _telefone = value;
    notifyListeners();
  }

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set codigo(String value) {
    _codigo = value;
    notifyListeners();
  }

  IdosoProvider(
      {required String nome,
      required String telefone,
      required String codigo,
      required String email}) : _nome = nome, _telefone = telefone, _codigo = codigo, _email = email;

  
  factory IdosoProvider.fromMap(Map<String, dynamic> map) {
    return IdosoProvider(
      nome: map["Nome"],
      telefone: map["Telefone"],
      email: "",
      codigo: map["Codigo"],
    );
  }


}
