import 'dart:async';
import 'dart:convert';
import 'package:admin/models/TruckIssue.dart';
import 'package:admin/models/TruckIssueCategory.dart';
import 'package:admin/models/TruckIssueRca.dart';
import 'package:admin/models/TruckIssueType.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';

class TruckIssuesService {
  Future<List<TruckIssue>> getList() async {
    final response = await http.get(Uri.parse(TRUCK_ISSUES_LIST_ENDPOINT +
        API_KEY +
        "?start=2021-12-16&end=2021-12-21"));

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
    map['key'] = API_KEY;

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
    map['key'] = API_KEY;

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
    final response =
        await http.get(Uri.parse(TRUCK_ISSUES_RCA_LIST_ENDPOINT + API_KEY));

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

    final response =
        await http.get(Uri.parse(TRUCK_ISSUES_LIST_ENDPOINT + API_KEY));

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
