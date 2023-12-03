import 'package:flutter/material.dart';

class MensagemProvider extends ChangeNotifier {
  bool _alertDisplayed = false;
  late String _mensagem;
  late Color _cor;

  bool get alertDisplayed => _alertDisplayed;
  String get mensagem => _mensagem;
  Color get cor => _cor;

  void setAlert(String mensagem, Color cor) {
    _alertDisplayed = true;
    _mensagem = mensagem;
    _cor = cor;
  }

  void resetAlert() {
    _alertDisplayed = false;
  }
}
