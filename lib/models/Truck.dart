// To parse this JSON data, do
//
//     final truck = truckFromJson(jsonString);

import 'dart:convert';

List<Truck> truckFromJson(String str) =>
    List<Truck>.from(json.decode(str).map((x) => Truck.fromJson(x)));

String truckToJson(List<Truck> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Truck {
  Truck({
    this.key,
    this.id,
    this.truckRego,
    this.truckTypeId,
  });

  Key? key;
  int? id;
  String? truckRego;
  int? truckTypeId;

  factory Truck.fromJson(Map<String, dynamic> json) => Truck(
        key: Key.fromJson(json["_key"]),
        id: json["id"],
        truckRego: json["truckRego"],
        truckTypeId: json["truckTypeId"],
      );

  Map<String, dynamic> toJson() => {
        "_key": key!.toJson(),
        "id": id,
        "truckRego": truckRego,
        "truckTypeId": truckTypeId,
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
