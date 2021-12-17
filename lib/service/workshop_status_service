import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:admin/models/WorkshopStatus.dart';
import '../../../constants.dart';

class WorkshopStatusService {

  Future<WorkshopStatus> getStatus() async {
   final response = await http
      .post(Uri.parse(WORKSHOP_STATUS_ENDPOINT + API_KEY));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return WorkshopStatus.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load workshop status');
    }
  }
}