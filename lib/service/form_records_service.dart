import 'dart:async';
import 'dart:convert';
import 'package:admin/models/FormRecords.dart';
import 'package:admin/models/Variables.dart';
import 'package:admin/service/auth_key_service.dart';
import 'package:http/http.dart' as http;

class FormRecordsService {
  final AuthKeyService authKeyService = AuthKeyService();

  Future<FormRecords> save(FormRecords record) async {
    print(jsonEncode(record));
    final response = await http.post(
        Uri.parse(
            Variables.getFormRecordSaveUrl() + authKeyService.getAuthKey()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(record));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      // final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      // ignore: todo
      // TODO: fix this
      // return parsed.map<FormRecords>((json) => FormRecords.fromJson(json));
      return FormRecords();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load the form record');
    }
  }
}
