class WorkshopStatus {
  WorkshopStatus({
    required this.truckInService,
    required this.numberOfIssuesReportedLast7Days,
    required this.numberOfIssuesFixedLast7Days,
    required this.numberOfTrucksOffRoad,
    required this.oldestIncompleteIssue,
    required this.incompleteIssues,
  });

  List<String> truckInService;
  int numberOfIssuesReportedLast7Days;
  int numberOfIssuesFixedLast7Days;
  int numberOfTrucksOffRoad;
  DateTime oldestIncompleteIssue;
  int incompleteIssues;

  factory WorkshopStatus.fromJson(Map<String, dynamic> json) => WorkshopStatus(
        truckInService: List<String>.from(json["truckInService"].map((x) => x)),
        numberOfIssuesReportedLast7Days:
            json["numberOfIssuesReportedLast7Days"],
        numberOfIssuesFixedLast7Days: json["numberOfIssuesFixedLast7Days"],
        numberOfTrucksOffRoad: json["numberOfTrucksOffRoad"],
        oldestIncompleteIssue: DateTime.parse(json["oldestIncompleteIssue"]),
        incompleteIssues: json["incompleteIssues"],
      );

  Map<String, dynamic> toJson() => {
        "truckInService": List<dynamic>.from(truckInService.map((x) => x)),
        "numberOfIssuesReportedLast7Days": numberOfIssuesReportedLast7Days,
        "numberOfIssuesFixedLast7Days": numberOfIssuesFixedLast7Days,
        "numberOfTrucksOffRoad": numberOfTrucksOffRoad,
        "oldestIncompleteIssue": oldestIncompleteIssue.toIso8601String(),
        "incompleteIssues": incompleteIssues,
      };
}
