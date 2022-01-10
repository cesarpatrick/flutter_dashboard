import 'package:admin/models/WebUser.dart';

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
}
