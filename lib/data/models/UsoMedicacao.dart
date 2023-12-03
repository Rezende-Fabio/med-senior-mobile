import 'package:med_senior_mobile/data/models/Medicacao.dart';
import 'package:med_senior_mobile/utils/formatDate.dart';

class UsoMedicacao {
  late String id;
  late int dosagem;
  late int intervalo;
  late DateTime horaInicial;
  late DateTime dataFinal;
  late String idosoId;
  late String medId;
  late Medicacao medicacao;

  UsoMedicacao({
    required this.id,
    required this.dosagem,
    required this.intervalo,
    required horaInicial,
    required dataFinal,
    required this.idosoId,
  }) {
    this.horaInicial = dateTimeStringToDateTimeWithTime(horaInicial);
    this.dataFinal = dateTimeStringToDateTimeWithTime(dataFinal);
  }

  void setMedId(String medId) {
    this.medId = medId;
  }

  void setMed(Medicacao medicacao) {
    this.medicacao = medicacao;
  }

  factory UsoMedicacao.fromMap(Map<String, dynamic> map) {
    UsoMedicacao usoMed = UsoMedicacao(
      id: map["id"],
      dosagem: map["dosagem"],
      intervalo: map["intervalo"],
      horaInicial: map["horaInicial"],
      dataFinal: map["dataFinal"],
      idosoId: map["idosoId"],
    );
    usoMed.setMed(Medicacao.fromMap(map["medicacao"]));
    usoMed.setMedId(map["medId"]);
    return usoMed;
  }

  Map<String, dynamic> fromJsonPost() {
    Map<String, dynamic> json = {
      "dosagem": dosagem,
      "intervalo": intervalo,
      "horaInicial": dateTimeToDateTimeString(horaInicial),
      "dataFinal": dateTimeToDateTimeString(dataFinal),
      "idosoId": idosoId,
      "medId": medId
    };
    return json;
  }
}
