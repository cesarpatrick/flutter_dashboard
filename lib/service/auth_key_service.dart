class AuthKeyService {
  static final AuthKeyService _singleton = AuthKeyService._internal();

  factory AuthKeyService() {
    return _singleton;
  }

  AuthKeyService._internal();

  String? _authKey;

  void setAuthkey(String key) {
    _authKey = key;
  }

  String getAuthKey() {
    return _authKey!;
  }
}
