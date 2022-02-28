import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class Util extends StatelessWidget {
  const Util({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static String formatDate(String date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var date1 = inputFormat.parse(date);

    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(date1);
  }

  static List<DropdownMenuItem<String>> getDepartamentsDropdownMenu() {
    List<DropdownMenuItem<String>> list = [];

    list.add(DropdownMenuItem<String>(value: "", child: Text("")));
    list.add(DropdownMenuItem<String>(value: IT, child: Text(IT)));
    list.add(DropdownMenuItem<String>(value: HR, child: Text(HR)));
    list.add(
        DropdownMenuItem<String>(value: OPERATIONS, child: Text(OPERATIONS)));
    list.add(DropdownMenuItem<String>(value: WORKSHOP, child: Text(WORKSHOP)));
    list.add(DropdownMenuItem<String>(value: DEPOT, child: Text(DEPOT)));
    return list;
  }
}
