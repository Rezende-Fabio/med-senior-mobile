class Medicaocao {
  late String id;
  late String nome;
  late String modoAdm;
  late String descricao;
  late int estoque;
  late List<dynamic> falhas;
  late String idosoId;

  Medicaocao(
      {
      required this.id,
      required this.nome,
      required this.modoAdm,
      required this.descricao,
      required this.estoque,
      required this.falhas,
      required this.idosoId});

  Map<String, dynamic> fromJsonPost() {
    Map<String, dynamic> json = {
      "id": id,
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
