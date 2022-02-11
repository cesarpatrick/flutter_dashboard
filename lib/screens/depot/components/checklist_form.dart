import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class CheckListForm extends StatefulWidget {
  const CheckListForm({Key? key}) : super(key: key);

  @override
  _CheckListFormState createState() => _CheckListFormState();
}

class _CheckListFormState extends State<CheckListForm> {
  List<DropdownMenuItem<String>> departamentTypeDropDownItemList = List.empty();

  String _departamentDropdownValue = "";

  @override
  Widget build(BuildContext context) {
    Size _screen = MediaQuery.of(context).size;

    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Row(children: [
            Padding(padding: EdgeInsets.all(15), child: Text("Forms")),
            Flexible(
                flex: 2,
                child: Padding(
                    padding: EdgeInsets.all(15),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      icon: Icon(
                        // Add this
                        Icons.arrow_drop_down, // Add this
                        color: Colors.white, // Add this
                      ),
                      value: _departamentDropdownValue,
                      style: const TextStyle(color: primaryColor),
                      dropdownColor: Colors.white,
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
                    ))),
            Flexible(flex: 4, child: Container())
          ]),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ))
            ],
          )
        ]));
  }
}
