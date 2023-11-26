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
  DateFormat outputFormat = DateFormat("yyyy-MM-dd'T'00:00:00.000'Z'");
  String parsedDate = outputFormat.format(data);

  return parsedDate;
}


