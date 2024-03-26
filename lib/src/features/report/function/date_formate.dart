import 'package:intl/intl.dart';

String formatDate(DateTime now) {
  DateFormat formatter = DateFormat('MMMM dd, yyyy');

  String formattedDate = formatter.format(now);
  return formattedDate;
}
