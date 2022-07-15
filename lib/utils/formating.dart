import 'package:intl/intl.dart';

class Formatting {
  static String formatDate(String date) {
    var dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

    return formattedDate;
  }
}
