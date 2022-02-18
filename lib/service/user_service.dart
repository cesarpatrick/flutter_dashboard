import 'dart:convert';

import 'package:admin/constants.dart';
import 'package:admin/models/Variables.dart';
import 'package:admin/models/WebUser.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'auth_key_service.dart';

class UserService {
  static final UserService _singleton = UserService._internal();
  final AuthKeyService authKeyService = AuthKeyService();

  factory UserService() {
    return _singleton;
  }

  UserService._internal();

  Webuser? _user;

  void setUser(Webuser user) {
    _user = user;
  }

  Webuser getUser() {
    if (_user != null) {
      return _user!;
    } else {
      return Webuser(userId: -1, userName: 'Guest', lastName: '', key: null);
    }
  }

  void checkUserLoggedIn(BuildContext context) {
    if (this._user == null || this._user!.key == null) {
      Navigator.pushNamed(context, LOGIN_ROUTE);
    }
  }

  void updatePrefs(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }

  Future<Webuser> getUserById(String id) async {
    final response = await http.post(Uri.parse(
        Variables.getWebuserUrl() + authKeyService.getAuthKey() + '/' + id));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      final responseJson = json.decode(response.body);

      return Webuser.fromJson(responseJson);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load the truck issues type');
    }
  }
}
