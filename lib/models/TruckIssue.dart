// To parse this JSON data, do
//
//     final truckIssue = truckIssueFromJson(jsonString);

import 'dart:convert';

List<TruckIssue> truckIssueFromJson(String str) =>
    List<TruckIssue>.from(json.decode(str).map((x) => TruckIssue.fromJson(x)));

String truckIssueToJson(List<TruckIssue> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TruckIssue {
  TruckIssue({
    this.id,
    this.truckId,
    this.webuserId,
    this.truckIssueType,
    this.issueNote,
    this.createdOn,
    this.updatedOn,
    this.completed,
    this.fixedOn,
    this.fixedByWebuserId,
    this.workshopNote,
    this.workshopStatus,
    this.key,
    this.workshopRequest,
    this.workshopEtc,
  });

  int? id;
  int? truckId;
  int? webuserId;
  int? truckIssueType;
  String? issueNote;
  DateTime? createdOn;
  DateTime? updatedOn;
  bool? completed;
  DateTime? fixedOn;
  int? fixedByWebuserId;
  String? workshopNote;
  int? workshopStatus;
  Key? key;
  DateTime? workshopRequest;
  DateTime? workshopEtc;

  factory TruckIssue.fromJson(Map<String, dynamic> json) => TruckIssue(
        id: json["id"],
        truckId: json["truckId"],
        webuserId: json["webuserId"],
        truckIssueType: json["truckIssueType"],
        issueNote: json["issueNote"],
        createdOn: DateTime.parse(json["createdOn"]),
        updatedOn: json["updatedOn"] == null
            ? null
            : DateTime.parse(json["updatedOn"]),
        completed: json["completed"],
        fixedOn:
            json["fixedOn"] == null ? null : DateTime.parse(json["fixedOn"]),
        fixedByWebuserId:
            json["fixedByWebuserId"] == null ? null : json["fixedByWebuserId"],
        workshopNote: json["workshopNote"],
        workshopStatus: json["workshopStatus"],
        key: Key.fromJson(json["_key"]),
        workshopRequest: json["workshopRequest"] == null
            ? null
            : DateTime.parse(json["workshopRequest"]),
        workshopEtc: json["workshopEtc"] == null
            ? null
            : DateTime.parse(json["workshopEtc"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "truckId": truckId,
        "webuserId": webuserId,
        "truckIssueType": truckIssueType,
        "issueNote": issueNote,
        "createdOn": createdOn!.toIso8601String(),
        "updatedOn": updatedOn == null ? null : updatedOn!.toIso8601String(),
        "completed": completed,
        "fixedOn": fixedOn == null ? null : fixedOn!.toIso8601String(),
        "fixedByWebuserId": fixedByWebuserId == null ? null : fixedByWebuserId,
        "workshopNote": workshopNote,
        "workshopStatus": workshopStatus,
        "_key": key!.toJson(),
        "workshopRequest":
            workshopRequest == null ? null : workshopRequest!.toIso8601String(),
        "workshopEtc":
            workshopEtc == null ? null : workshopEtc!.toIso8601String(),
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
