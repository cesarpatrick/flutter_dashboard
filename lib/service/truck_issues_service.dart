import 'dart:async';
import 'dart:convert';
import 'package:admin/models/TruckIssue.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';

class TruckIssuesService {
  Future<List<TruckIssue>> getList() async {
    Future<List<TruckIssue>> issues = Future.value(List<TruckIssue>.empty());

    final response = await http.get(Uri.parse(TRUCK_ISSUES_LIST_ENDPOINT +
        API_KEY +
        "?start=2021-12-10&end=2021-12-17"));

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
