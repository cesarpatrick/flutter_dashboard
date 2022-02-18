import 'package:intl/intl.dart';

class Util {
  static String formattDate(String? date) {
    if (date != null && date.isNotEmpty && date.length > 10) {
      DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);

      String finalDate = DateFormat("dd-MM-yyyy").format(tempDate);

      return finalDate;
    } else {
      return "";
    }
  }
}
