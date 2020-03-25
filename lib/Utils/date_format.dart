import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

String dateFormat() {
  String dateToday = DateTime.now().toString();
  initializeDateFormatting("pt_BR");

  var formatter = DateFormat.MMMMEEEEd("pt_BR");

  DateTime convertDate = DateTime.parse(dateToday);
  String formattedDate = formatter.format(convertDate);

  return formattedDate;
}