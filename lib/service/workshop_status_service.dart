import 'dart:async';
import 'dart:convert';
import 'package:admin/models/Variables.dart';
import 'package:admin/service/auth_key_service.dart';
import 'package:http/http.dart' as http;
import 'package:admin/models/WorkshopStatus.dart';

class WorkshopStatusService {
  final AuthKeyService authKeyService = AuthKeyService();

  Future<WorkshopStatus> getStatus() async {
    final response = await http.post(Uri.parse(
        Variables.getWorkshopStatusUrl() + authKeyService.getAuthKey()));

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
