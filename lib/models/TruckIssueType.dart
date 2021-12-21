import 'dart:convert';

List<TruckIssueType> truckIssueTypeFromJson(String str) =>
    List<TruckIssueType>.from(
        json.decode(str).map((x) => TruckIssueType.fromJson(x)));

String truckIssueTypeToJson(List<TruckIssueType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TruckIssueType {
  TruckIssueType({
    this.id,
    this.name,
    this.truckIssueCategoryId,
    this.key,
  });

  int? id;
  String? name;
  int? truckIssueCategoryId;
  Key? key;

  factory TruckIssueType.fromJson(Map<String, dynamic> json) => TruckIssueType(
        id: json["id"],
        name: json["name"],
        truckIssueCategoryId: json["truckIssueCategoryId"],
        key: Key.fromJson(json["_key"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "truckIssueCategoryId": truckIssueCategoryId,
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
