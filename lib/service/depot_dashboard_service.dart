import 'dart:async';
import 'dart:convert';
import 'package:admin/models/DepotDashboard.dart';
import 'package:admin/models/Variables.dart';
import 'package:admin/service/auth_key_service.dart';
import 'package:http/http.dart' as http;

class DepotDashboardService {
  final AuthKeyService authKeyService = AuthKeyService();

  Future<DepotDashboard> save(DepotDashboard depotDashboard) async {
    final response = await http.post(
        Uri.parse(
            Variables.getDepotDashboardSave() + authKeyService.getAuthKey()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(depotDashboard));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<DepotDashboard>((json) => DepotDashboard.fromJson(json));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load the Depot Dashboard info');
    }
  }

  Future<DepotDashboard> getDepotDashboard(String id) async {
    final response = await http.post(Uri.parse(
        Variables.getDepotDashboardInfo() +
            authKeyService.getAuthKey() +
            '/' +
            id));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      final responseJson = json.decode(response.body);

      return DepotDashboard.fromJson(responseJson);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load the Depot Dashboard info');
    }
  }
}
