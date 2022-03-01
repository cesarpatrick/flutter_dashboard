import 'package:admin/models/FormRecords.dart';

class FormRecordInfo {
  final String formName;
  final String departament;
  final String date;
  final String user;
  final FormRecords record;

  FormRecordInfo(
      {required this.formName,
      required this.date,
      required this.departament,
      required this.user,
      required this.record});
}
