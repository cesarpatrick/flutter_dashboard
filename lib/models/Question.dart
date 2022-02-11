import 'dart:convert';

import 'package:admin/util.dart';

Question jsonFormFromJson(String str) => Question.fromJson(json.decode(str));

String jsonFormToJson(Question data) => json.encode(data.toJson());

class Question {
  Question(
      {this.id,
      required this.field,
      this.departament,
      required this.name,
      this.dateCreated,
      this.dateUpdated,
      this.userCreated});

  int? id;
  QuestionField? field;
  String? departament;
  String name;
  String? dateUpdated, dateCreated;
  int? userCreated;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        name: json["name"],
        departament: json["departament"],
        field: json["field"] == null
            ? null
            : QuestionField.fromJson(json["field"]),
        dateUpdated: json["dateUpdated"] == null ? null : "",
        dateCreated: Util.formattDate(json["dateCreated"]),
        userCreated: json["userCreated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "departament": departament,
        "field": field!.toJson(),
        "dateCreated": dateCreated,
        "dateUpdated": dateUpdated,
        "userCreated": userCreated
      };
}

class QuestionField {
  QuestionField({
    this.id,
    required this.key,
    required this.type,
    required this.label,
    this.placeholder,
    this.required,
    this.value,
    this.items,
  });

  int? id;
  String key;
  String type;
  String label;
  String? placeholder;
  bool? required;
  dynamic value;
  List<QuestionFieldItem>? items;

  factory QuestionField.fromJson(Map<String, dynamic> json) => QuestionField(
        id: json["id"],
        key: json["key"] == null ? "" : json["key"],
        type: json["type"] == null ? "" : json["type"],
        label: json["label"] == null ? "" : json["label"],
        placeholder: json["placeholder"] == null ? null : json["placeholder"],
        required: json["required"] == null ? null : json["required"],
        value: json["value"],
        items: json["items"] == null
            ? []
            : List<QuestionFieldItem>.from(
                json["items"].map((x) => QuestionFieldItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "type": type,
        "label": label,
        "placeholder": placeholder == null ? "" : placeholder,
        "required": required == null ? false : required,
        "value": value,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class QuestionFieldItem {
  QuestionFieldItem({
    this.id,
    required this.label,
    required this.value,
  });

  int? id;
  String label;
  dynamic value;

  factory QuestionFieldItem.fromJson(Map<String, dynamic> json) =>
      QuestionFieldItem(
        id: json["id"],
        label: json["label"] == null ? "" : json["label"],
        value: json["value"] == null ? "" : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "value": value,
      };
}
