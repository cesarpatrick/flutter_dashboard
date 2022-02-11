import 'dart:convert';

import 'package:admin/models/Question.dart';

import '../util.dart';

Template jsonFormFromJson(String str) => Template.fromJson(json.decode(str));

String jsonFormToJson(Template data) => json.encode(data.toJson());

class Template {
  Template(
      {this.id,
      required this.name,
      required this.questions,
      this.departament,
      this.dateCreated,
      this.dateUpdated,
      this.userCreated});

  int? id;
  String name;
  List<Question> questions;
  String? departament;
  String? dateUpdated, dateCreated;
  int? userCreated;

  factory Template.fromJson(Map<String, dynamic> json) => Template(
        id: json["id"],
        name: json["name"],
        questions: json["questions"] == null
            ? []
            : List<Question>.from(
                json["questions"].map((x) => Question.fromJson(x))),
        departament: json["departament"],
        dateUpdated: json["dateUpdated"] == null ? null : null,
        dateCreated: Util.formattDate(json["dateCreated"]),
        userCreated: json["userCreated"] == null ? null : json["userCreated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
        "departament": departament,
        "dateCreated": dateCreated,
        "dateUpdated": dateUpdated,
        "userCreated": userCreated
      };
}
