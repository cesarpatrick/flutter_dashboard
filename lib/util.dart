import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util extends StatelessWidget {
  const Util({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static String convertDate(String date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var date1 = inputFormat.parse(date);

    var outputFormat = DateFormat('dd/MM/yyyy');
    var date2 = outputFormat.format(date1);

    return date2;
  }
}
