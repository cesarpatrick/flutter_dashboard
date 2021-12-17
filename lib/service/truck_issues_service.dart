import 'dart:async';
import 'dart:convert';
import 'package:admin/models/TruckIssue.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';

class TruckIssuesService {
  Future<List<TruckIssue>> getList() async {
    Future<List<TruckIssue>> issues = Future.value(List<TruckIssue>.empty());
    // var end = DateTime.now();
    // var start;
    // if (end.month < 4) {
    //   //Set as first of the month, four months ago, last year
    //   start = DateTime(end.year - 1, 12 - (3 - end.month), 1);
    // } else {
    //   start = DateTime(end.year, end.month - 4, 1);
    // }
    // end = end.add(Duration(days: 15));
    // var serverFormat = DateFormat('yyyy-MM-dd');
    // var formattedEnd = serverFormat.format(end);
    // var formattedStart = serverFormat.format(start);
    // var endpointUrl = TRUCK_ISSUES_LIST_ENDPOINT + API_KEY;
    // var queryParams = <String, String>{
    //   'start': formattedStart.toString(),
    //   'end': formattedEnd.toString()
    // };

    //var queryString = Uri(queryParameters: queryParams).query;
    //var url = endpointUrl + '?' + queryString;
    final response = await http.get(Uri.parse(TRUCK_ISSUES_LIST_ENDPOINT +
        API_KEY +
        "?start=2021-11-01&end=2021-12-17"));

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
