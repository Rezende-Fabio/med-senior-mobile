import '../../utils/formatDate.dart';

class Cuidador {
  late String nome;
  late String telefone;
  late DateTime dataNasc;
  late String email;
  late String senha;
  late String codigoIdoso;

  Cuidador(
      {required this.nome,
      required this.telefone,
      required this.dataNasc,
      required this.codigoIdoso});

  Cuidador.insert(this.nome, this.telefone, String dataNasc, this.codigoIdoso,
      this.email, this.senha) {
    DateTime dataNascimento = dateTimeStringToDateTime(dataNasc);
    this.dataNasc = dataNascimento;
  }

  factory Cuidador.fromMap(Map<String, dynamic> map) {
    DateTime dataNascimento = dateTimeStringToDateTime(map["dataNasc"]);
    return Cuidador(
      nome: map["nome"],
      telefone: map["telefone"],
      dataNasc: dataNascimento,
      codigoIdoso: map["codigoIdoso"],
    );
  }

  Map<String, dynamic> fromJsonPost() {
    Map<String, dynamic> json = {
      "nome": nome,
      "telefone": telefone,
      "dataNasc": dateTimeToDateTimeString(dataNasc),
      "email": email,
      "senha": senha,
      "codigoIdoso": codigoIdoso
    };
    return json;
  }
}
