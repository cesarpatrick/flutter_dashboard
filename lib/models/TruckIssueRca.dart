import 'dart:convert';

List<TruckIssueRca> truckIssueRcaFromJson(String str) =>
    List<TruckIssueRca>.from(
        json.decode(str).map((x) => TruckIssueRca.fromJson(x)));

String truckIssueRcaToJson(List<TruckIssueRca> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TruckIssueRca {
  TruckIssueRca({
    this.key,
    this.id,
    this.type,
    this.ordering,
  });

  Key? key;
  int? id;
  String? type;
  int? ordering;

  factory TruckIssueRca.fromJson(Map<String, dynamic> json) => TruckIssueRca(
        key: Key.fromJson(json["_key"]),
        id: json["id"],
        type: json["type"],
        ordering: json["ordering"],
      );

  Map<String, dynamic> toJson() => {
        "_key": key!.toJson(),
        "id": id,
        "type": type,
        "ordering": ordering,
      };
}

class Key {
  Key({
    this.id,
  });

  int? id;

  factory Key.fromJson(Map<String, dynamic> json) => Key(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
