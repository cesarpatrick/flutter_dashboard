import 'package:admin/constants.dart';
import 'package:admin/helper/util.dart';
import 'package:admin/screens/main/components/form_template_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  DateTime selectedDate = DateTime.now();
  String _departamentDropdownValue = "";

  List<DropdownMenuItem<String>> departamentTypeDropDownItemList =
      Util.getDepartamentsDropdownMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              Padding(padding: EdgeInsets.all(15), child: Text("Forms")),
              Flexible(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: FormTemplateDropDown(
                        null == null ? 0 : 0, (newValue) {}),
                  )),
              Text("Departament"),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                  flex: 2,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    icon: Icon(
                      // Add this
                      Icons.arrow_drop_down, // Add this
                      color: Colors.white, // Add this
                    ),
                    value: _departamentDropdownValue,
                    style: const TextStyle(color: Colors.white),
                    dropdownColor: bgColor,
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _departamentDropdownValue = newValue!;
                      });
                    },
                    items: departamentTypeDropDownItemList,
                  ))
            ]),
            // Flexible(
            //     flex: 1,
            //     child: TextField(
            //       decoration: InputDecoration(
            //         hintText: "DD/MM/YYYY",
            //         filled: true,
            //         suffixIcon: InkWell(
            //           onTap: () {},
            //           child: Container(
            //             padding: EdgeInsets.all(defaultPadding * 0.25),
            //             margin: EdgeInsets.symmetric(
            //                 horizontal: defaultPadding / 2),
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius:
            //                   const BorderRadius.all(Radius.circular(10)),
            //             ),
            //             child: SvgPicture.asset("assets/icons/calendar.svg"),
            //           ),
            //         ),
            //       ),
            //     ))
          ]),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }
}
