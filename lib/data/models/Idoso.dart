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

  Idoso.insert(this.nome, this.telefone, String dataNasc, this.doencas,
      this.email, this.senha) {
    DateTime dataNascimento = dateTimeStringToDateTime(dataNasc);
    this.dataNasc = dataNascimento;
  }

  factory Idoso.fromMap(Map<String, dynamic> map) {
    DateTime dataNascimento = dateTimeStringToDateTime(map["DataNasc"]);
    return Idoso(
      nome: map["Nome"],
      telefone: map["Telefone"],
      dataNasc: dataNascimento,
      doencas: map["Doencas"],
    );
  }

  Map<String, dynamic> fromJsonPost() {
    Map<String, dynamic> json = {
      "nome": nome,
      "telefone": telefone,
      "dataNasc": dateTimeToDateTimeString(dataNasc),
      "email": email,
      "senha": senha,
      "doencas": []
    };
    return json;
  }
}
