import 'dart:async';
import 'dart:convert';
import 'package:admin/models/TruckIssue.dart';
import 'package:admin/models/TruckIssueCategory.dart';
import 'package:admin/models/TruckIssueRca.dart';
import 'package:admin/models/TruckIssueType.dart';
import 'package:admin/service/auth_key_service.dart';
import 'package:admin/service/truck_service.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';

class TruckIssuesService {
  final TruckService apiTruckService = TruckService();
  final AuthKeyService authKeyService = AuthKeyService();

  Future<List<TruckIssue>> getList() async {
    final response = await http.get(Uri.parse(TRUCK_ISSUES_LIST_ENDPOINT +
        authKeyService.getAuthKey() +
        "?start=2021-12-31&end=2022-01-10"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<TruckIssue>((json) => TruckIssue.fromMap(json))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load truck issues');
    }
  }

  Future<List<TruckIssueCategory>> getTruckIssueCategories() async {
    var map = new Map<String, dynamic>();
    map['key'] = authKeyService.getAuthKey();

    final response =
        await http.post(Uri.parse(TRUCK_ISSUES_CATEGORIES_ENDPOINT), body: map);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<TruckIssueCategory>((json) => TruckIssueCategory.fromJson(json))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load truck issues categories');
    }
  }

  Future<List<TruckIssueType>> getTruckIssueType() async {
    var map = new Map<String, dynamic>();
    map['key'] = authKeyService.getAuthKey();

    final response =
        await http.post(Uri.parse(TRUCK_ISSUES_TYPES_ENDPOINT), body: map);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<TruckIssueType>((json) => TruckIssueType.fromJson(json))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load truck issues types');
    }
  }

  Future<List<TruckIssueRca>> getTruckIssueRCA() async {
    final response = await http.get(Uri.parse(
        TRUCK_ISSUES_RCA_LIST_ENDPOINT + authKeyService.getAuthKey()));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<TruckIssueRca>((json) => TruckIssueRca.fromJson(json))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load truck issues RCA');
    }
  }

  Future<List<TruckIssue>> getListByRego(String rego) async {
    var map = new Map<String, dynamic>();
    map['truckRego'] = rego;

    final response = await http.get(
        Uri.parse(TRUCK_ISSUES_LIST_ENDPOINT + authKeyService.getAuthKey()));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<TruckIssue>((json) => TruckIssue.fromMap(json))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load truck issues');
    }
  }
}
