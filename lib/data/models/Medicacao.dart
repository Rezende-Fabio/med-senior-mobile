class Medicacao {
  late String id;
  late String nome;
  late String modoAdm;
  late String descricao;
  late int estoque;
  late List<dynamic> falhas;
  late String idosoId;

  Medicacao(
      {required this.id,
      required this.nome,
      required this.modoAdm,
      required this.descricao,
      required this.estoque,
      required this.falhas,
      required this.idosoId});

  factory Medicacao.fromMap(Map<String, dynamic> map) {
    return Medicacao(
      id: map["id"],
      nome: map["nome"],
      modoAdm: map["modoAdm"],
      descricao: map["descricao"],
      estoque: map["estoque"],
      falhas: map["falhas"],
      idosoId: map["idosoId"],
    );
  }

  Map<String, dynamic> fromJsonPost() {
    Map<String, dynamic> json = {
      "nome": nome,
      "modoAdm": modoAdm,
      "descricao": descricao,
      "estoque": estoque,
      "falhas": falhas,
      "idosoId": idosoId
    };
    return json;
  }
}
