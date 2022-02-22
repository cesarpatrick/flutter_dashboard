import 'dart:convert';

List<DepotDashboard> truckIssueRcaFromJson(String str) =>
    List<DepotDashboard>.from(
        json.decode(str).map((x) => DepotDashboard.fromJson(x)));

String truckIssueRcaToJson(List<DepotDashboard> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DepotDashboard {
  DepotDashboard({this.id, this.notes});

  int? id;
  String? notes;

  factory DepotDashboard.fromJson(Map<String, dynamic> json) => DepotDashboard(
        id: json["id"],
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "notes": notes,
      };
}
