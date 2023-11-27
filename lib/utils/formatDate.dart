import 'package:intl/intl.dart';

String dateStringToDateTimeString(String dataString) {
  DateFormat inputFormat = DateFormat("dd/MM/yyyy");
  DateFormat outputFormat = DateFormat("yyyy-MM-dd'T'00:00:00.000'Z'");
  DateTime parsedDate = inputFormat.parse(dataString);
  String formattedString = outputFormat.format(parsedDate);

  return formattedString;
}


DateTime dateTimeStringToDateTime(String dataString) {
  DateFormat outputFormat = DateFormat("yyyy-MM-dd 00:00:00.000'Z'");
  DateTime parsedDate = outputFormat.parse(dataString.replaceFirst("T", " "));

  return parsedDate;
}


DateTime dateTimeStringToDateTimeWithTime(String dataString) {
  DateFormat outputFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'");
  DateTime parsedDate = outputFormat.parse(dataString.replaceFirst("T", " "));

  return parsedDate;
}


String dateTimeToDateTimeString(DateTime data) {
  DateFormat outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
  String parsedDate = outputFormat.format(data);

  return parsedDate;
}


String dateTimeToTimeString(DateTime dateTime) {
  DateFormat formatoHora = DateFormat('HH:mm');
  return formatoHora.format(dateTime);
}


String dateTimeToDateString(DateTime dateTime) {
  DateFormat formatoData = DateFormat('dd/MM/yyyy');
  return formatoData.format(dateTime);
}


DateTime timeStringToDateTime(String horaString) {
  DateTime dataAtual = DateTime.now();

  List<String> partesHora = horaString.split(':');
  
  int horas = int.parse(partesHora[0]);
  int minutos = int.parse(partesHora[1]);

  return DateTime(dataAtual.year, dataAtual.month, dataAtual.day, horas, minutos);
}


DateTime dateStringToDateTime(String dataString) {
  List<String> partesData = dataString.split('/');

  int dia = int.parse(partesData[0]);
  int mes = int.parse(partesData[1]);
  int ano = int.parse(partesData[2]);

  return DateTime(ano, mes, dia, 0, 0, 0);
}