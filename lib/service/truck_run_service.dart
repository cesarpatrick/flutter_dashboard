import 'dart:async';
import 'dart:convert';
import 'package:admin/models/TruckRunStatus.dart';
import 'package:admin/models/Variables.dart';
import 'package:admin/service/auth_key_service.dart';
import 'package:http/http.dart' as http;

class TruckRunService {
  final AuthKeyService authKeyService = AuthKeyService();

  Future<List<TruckRunStatus>> getTruckRunStatus() async {
    var map = new Map<String, dynamic>();
    map['key'] = authKeyService.getAuthKey();
    map['date'] = '1623625912454';

    final response = await http.post(
        Uri.parse(Variables.getRunStatusUrl() + authKeyService.getAuthKey()),
        body: map);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<TruckRunStatus>((json) => TruckRunStatus.fromJson(json))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load the trucks run');
    }
  }
}
