import 'dart:convert';

List<TruckRunStatus> runStatusFromJson(String str) => List<TruckRunStatus>.from(
    json.decode(str).map((x) => TruckRunStatus.fromJson(x)));

String runStatusToJson(List<TruckRunStatus> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TruckRunStatus {
  TruckRunStatus({
    this.runName,
    this.rubbishRunKey,
    this.wu,
    this.driverAndTruck,
    this.stops,
    this.count,
    this.binCountin240LEquiv,
  });

  String? runName;
  RubbishRunKey? rubbishRunKey;
  Wu? wu;
  String? driverAndTruck;
  int? stops;
  int? count;
  double? binCountin240LEquiv;

  factory TruckRunStatus.fromJson(Map<String, dynamic> json) => TruckRunStatus(
        runName: json["runName"],
        rubbishRunKey: json["rubbishRunKey"] == null
            ? null
            : RubbishRunKey.fromJson(json["rubbishRunKey"]),
        wu: json["wu"] == null ? null : Wu.fromJson(json["wu"]),
        driverAndTruck:
            json["driverAndTruck"] == null ? null : json["driverAndTruck"],
        stops: json["stops"],
        count: json["count"],
        binCountin240LEquiv: json["binCountin240LEquiv"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "runName": runName,
        "rubbishRunKey": rubbishRunKey!.toJson(),
        "wu": wu!.toJson(),
        "driverAndTruck": driverAndTruck,
        "stops": stops,
        "count": count,
        "binCountin240LEquiv": binCountin240LEquiv,
      };
}

class RubbishRunKey {
  RubbishRunKey({
    required this.rubbishRunId,
  });

  int rubbishRunId;

  factory RubbishRunKey.fromJson(Map<String, dynamic> json) => RubbishRunKey(
        rubbishRunId:
            json["rubbishRunId"] == null ? null : json["rubbishRunId"],
      );

  Map<String, dynamic> toJson() => {
        "rubbishRunId": rubbishRunId,
      };
}

class Wu {
  Wu({
    this.userId,
    this.userType,
    this.active,
    this.userName,
    this.password,
    this.companyId,
    this.regionId,
    this.firstName,
    this.lastName,
    this.email,
    this.creationDate,
    this.changeDate,
    this.allowCalOfAllTerritories,
    this.key,
    this.hasSalesPortalAccess,
    this.hasOpsPortalAccess,
    this.hasDriverMobileAccess,
    this.groups,
    this.driver,
    this.mobileNumber,
    this.hasEmployeeAppAccess,
  });

  int? userId;
  int? userType;
  int? active;
  String? userName;
  String? password;
  int? companyId;
  int? regionId;
  String? firstName;
  String? lastName;
  String? email;
  DateTime? creationDate;
  DateTime? changeDate;
  int? allowCalOfAllTerritories;
  Key? key;
  bool? hasSalesPortalAccess;
  bool? hasOpsPortalAccess;
  bool? hasDriverMobileAccess;
  List<dynamic>? groups;
  bool? driver;
  String? mobileNumber;
  bool? hasEmployeeAppAccess;

  factory Wu.fromJson(Map<String, dynamic> json) => Wu(
        userId: json["userId"],
        userType: json["userType"],
        active: json["active"],
        userName: json["userName"],
        password: json["password"],
        companyId: json["companyId"],
        regionId: json["regionId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        creationDate: DateTime.parse(json["creationDate"]),
        changeDate: DateTime.parse(json["changeDate"]),
        allowCalOfAllTerritories: json["allowCalOfAllTerritories"],
        key: Key.fromJson(json["_key"]),
        hasSalesPortalAccess: json["hasSalesPortalAccess"],
        hasOpsPortalAccess: json["hasOpsPortalAccess"],
        hasDriverMobileAccess: json["hasDriverMobileAccess"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        driver: json["driver"],
        mobileNumber: json["mobileNumber"],
        hasEmployeeAppAccess: json["hasEmployeeAppAccess"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userType": userType,
        "active": active,
        "userName": userName,
        "password": password,
        "companyId": companyId,
        "regionId": regionId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "creationDate": creationDate!.toIso8601String(),
        "changeDate": changeDate!.toIso8601String(),
        "allowCalOfAllTerritories": allowCalOfAllTerritories,
        "_key": key!.toJson(),
        "hasSalesPortalAccess": hasSalesPortalAccess,
        "hasOpsPortalAccess": hasOpsPortalAccess,
        "hasDriverMobileAccess": hasDriverMobileAccess,
        "groups": List<dynamic>.from(groups!.map((x) => x)),
        "driver": driver,
        "mobileNumber": mobileNumber,
        "hasEmployeeAppAccess": hasEmployeeAppAccess,
      };
}

class Key {
  Key({
    required this.userId,
  });

  int userId;

  factory Key.fromJson(Map<String, dynamic> json) => Key(
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
      };
}
