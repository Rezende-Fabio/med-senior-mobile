import '../../utils/formatDate.dart';

class Idoso {
  late String nome;
  late String telefone;
  late DateTime dataNasc;
  late String email;
  late String senha;
  late List<dynamic> doencas;

  Idoso(
      {required this.nome,
      required this.telefone,
      required this.dataNasc,
      required this.doencas});

  factory Idoso.fromMap(Map<String, dynamic> map) {
    DateTime dataNascimento = dateTimeStringToDateTime(map["DataNasc"]);
    return Idoso(
      nome: map["Nome"],
      telefone: map["Telefone"],
      dataNasc: dataNascimento,
      doencas: map["Doencas"],
    );
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setSenha(String senha) {
    this.senha = senha;
  }

  Map<String, dynamic> fromJson() {
    Map<String, dynamic> json = {
      "nome": nome,
      "telefone": telefone,
      "dataNasc": dataNasc,
      "doencas": []
    };
    return json;
  }
}
