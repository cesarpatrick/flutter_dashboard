import 'dart:convert';

import 'package:admin/models/Template.dart';

import 'Template.dart';

FormRecords formRecordsFromJson(String str) =>
    FormRecords.fromJson(json.decode(str));

String formRecordsToJson(FormRecords data) => json.encode(data.toJson());

class FormRecords {
  FormRecords(
      {this.id,
      this.departament,
      this.dateUpdated,
      this.dateCreated,
      this.template});

  int? id;
  String? departament;
  String? dateUpdated;
  String? dateCreated;
  Template? template;

  factory FormRecords.fromJson(Map<String, dynamic> json) => FormRecords(
      id: json["id"],
      departament: json["departament"],
      dateUpdated: json["dateUpdated"],
      dateCreated: json["dateCreated"],
      template: json["template"] == null
          ? null
          : Template.fromJson(json["template"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "departament": departament,
        "dateUpdated": dateUpdated,
        "dateCreated": dateCreated,
        "template": template!.toJson()
      };
}
