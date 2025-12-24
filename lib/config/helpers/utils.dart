import 'package:intl/intl.dart';

enum DateFormatType { full, dateOnly, monthOnly, yearOnly, dayOnly }

String formatHumanDate(
  String isoDate, {
  DateFormatType type = DateFormatType.full,
}) {
  try {
    final DateTime dateTime = DateTime.parse(isoDate);
    DateFormat formatter;

    switch (type) {
      case DateFormatType.dayOnly:
        formatter = DateFormat("d");
        break;
      case DateFormatType.dateOnly:
        formatter = DateFormat("dd/MM/yyyy", 'es');
        break;
      case DateFormatType.monthOnly:
        formatter = DateFormat("MMM", 'es');
        break;
      case DateFormatType.yearOnly:
        formatter = DateFormat("y", 'es');
        break;
      case DateFormatType.full:
      default:
        formatter = DateFormat("dd 'de' MMMM, y HH:mm:ss", 'es');
        break;
    }

    return formatter.format(dateTime);
  } catch (e) {
    return "Fecha inválida";
  }
}
