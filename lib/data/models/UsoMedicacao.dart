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

  UsoMedicacao(
      {required this.id,
      required this.dosagem,
      required this.intervalo,
      required horaInicial,
      required dataFinal,
      required this.idosoId,
      required this.medId,
      required this.medicacao}) {
    this.horaInicial = dateTimeStringToDateTimeWithTime(horaInicial);
    this.dataFinal = dateTimeStringToDateTimeWithTime(dataFinal);
  }

  factory UsoMedicacao.fromMap(Map<String, dynamic> map) {
    return UsoMedicacao(
      id: map["id"],
      dosagem: map["dosagem"],
      intervalo: map["intervalo"],
      horaInicial: map["horaInicial"],
      dataFinal: map["dataFinal"],
      idosoId: map["idosoId"],
      medId: map["medId"],
      medicacao: Medicacao.fromMap(map["medicacao"]),
    );
  }

  Map<String, dynamic> fromJsonPost() {
    Map<String, dynamic> json = {"idosoId": idosoId};
    return json;
  }
}
