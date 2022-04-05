import 'package:intl/intl.dart';

String convertDate(DateTime date) {
  String convertedDate = new DateFormat("dd/MM/yyyy").format(date);
  return convertedDate;
}
