import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'Variables.dart';

Future<Webuser> authenticate(String userName, String password) async {
  final response = await http.post(Uri.parse(Variables.getAuthUrl() + "/up"),
      body: {
        "username": userName,
        "password": password,
        "site": "salesportal"
      });
  print(Variables.getAuthUrl() + "/up");
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    return Webuser.fromJson(responseJson);
  } else {
    throw Exception('Failed to authenticate');
  }
}

class Webuser {
  int? userId;
  String? userName;
  String? firstName;
  String? lastName;
  String? key;
  bool? driver;

  Webuser(
      {this.userId,
      this.userName,
      this.firstName,
      this.lastName,
      this.key,
      this.driver});

  factory Webuser.fromJson(Map<String, dynamic> json) {
    return Webuser(
        userId: json['userId'],
        userName: json['userName'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        key: json['authKey'],
        driver: json['driver']);
  }
}
