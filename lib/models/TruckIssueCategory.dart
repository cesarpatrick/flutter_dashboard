// To parse this JSON data, do
//
//     final truckIssueCategory = truckIssueCategoryFromJson(jsonString);

import 'dart:convert';

List<TruckIssueCategory> truckIssueCategoryFromJson(String str) =>
    List<TruckIssueCategory>.from(
        json.decode(str).map((x) => TruckIssueCategory.fromJson(x)));

String truckIssueCategoryToJson(List<TruckIssueCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TruckIssueCategory {
  TruckIssueCategory({
    this.id,
    this.truckIssueCategory,
    this.notifyOperations,
    this.workshopOnly,
    this.key,
  });

  int? id;
  String? truckIssueCategory;
  bool? notifyOperations;
  bool? workshopOnly;
  Key? key;

  factory TruckIssueCategory.fromJson(Map<String, dynamic> json) =>
      TruckIssueCategory(
        id: json["id"],
        truckIssueCategory: json["truckIssueCategory"],
        notifyOperations: json["notifyOperations"],
        workshopOnly: json["workshopOnly"],
        key: Key.fromJson(json["_key"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "truckIssueCategory": truckIssueCategory,
        "notifyOperations": notifyOperations,
        "workshopOnly": workshopOnly,
        "_key": key!.toJson(),
      };
}

class Key {
  Key({
    required this.id,
  });

  int id;

  factory Key.fromJson(Map<String, dynamic> json) => Key(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
