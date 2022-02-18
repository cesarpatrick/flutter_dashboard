import 'dart:async';
import 'dart:convert';
import 'package:admin/models/TruckIssue.dart';
import 'package:admin/models/TruckIssueCategory.dart';
import 'package:admin/models/TruckIssueRca.dart';
import 'package:admin/models/TruckIssueType.dart';
import 'package:admin/models/Variables.dart';
import 'package:admin/service/auth_key_service.dart';
import 'package:admin/service/truck_service.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';

class TruckIssuesService {
  final TruckService apiTruckService = TruckService();
  final AuthKeyService authKeyService = AuthKeyService();

  Future<List<TruckIssue>> getList() async {
    final response = await http.get(Uri.parse(
        Variables.getTruckIssuesListUrl() +
            authKeyService.getAuthKey() +
            "?start=2020-12-31&end=2021-01-10"));

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

    final response = await http
        .post(Uri.parse(Variables.getTruckIssuesCategoriesUrl()), body: map);

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

  Future<List<TruckIssueCategory>> getTruckIssueCategoriesById(int id) async {
    var map = new Map<String, dynamic>();
    map['key'] = authKeyService.getAuthKey();
    map['id'] = authKeyService.getAuthKey();

    final response = await http
        .post(Uri.parse(Variables.getTruckIssuesCategoriesUrl()), body: map);

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

    final response = await http
        .post(Uri.parse(Variables.getTruckIssuesTypeList()), body: map);

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
        Variables.getTruckIssuesRCAListUrl() + authKeyService.getAuthKey()));

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

  Future<TruckIssueType> getTruckIssueTypeById(String id) async {
    final response = await http.post(Uri.parse(Variables.getTruckIssuesType() +
        authKeyService.getAuthKey() +
        '/' +
        id));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      final responseJson = json.decode(response.body);

      return TruckIssueType.fromJson(responseJson);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load the truck issues type');
    }
  }

  Future<TruckIssueCategory> getTruckIssueTypeCategoryById(String id) async {
    final response = await http.post(Uri.parse(
        Variables.getTruckIssuesCategoriesUrl() +
            authKeyService.getAuthKey() +
            '/' +
            id));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      final responseJson = json.decode(response.body);

      return TruckIssueCategory.fromJson(responseJson);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load the truck issues type');
    }
  }

  Future<TruckIssueRca> getTruckIssueTruckIssueRcaById(String id) async {
    final response = await http.get(Uri.parse(Variables.getTruckIssuesRCAUrl() +
        authKeyService.getAuthKey() +
        '/' +
        id));

    print(Variables.getTruckIssuesRCAListUrl() +
        authKeyService.getAuthKey() +
        '/' +
        id);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      final responseJson = json.decode(response.body);

      return TruckIssueRca.fromJson(responseJson);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load the truck issues type');
    }
  }
}
