import 'package:admin/constants.dart';
import 'package:admin/models/WebUser.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static final UserService _singleton = UserService._internal();

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
}
