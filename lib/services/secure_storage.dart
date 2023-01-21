import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();

  final String _authTokenKey = "briskon_token_key";
  final String _userKey = "briskon_user_key";

  Future<String?> getUserId() async {
    return await storage.read(key: _userKey);
  }

  Future<String?> getToken() async {
    return await storage.read(key: _authTokenKey);
  }

  setUserId({required String userID}) async {
    await storage.write(key: _userKey, value: userID);
  }


  setToken({required String token}) async {
    await storage.write(key: _authTokenKey, value: token);
  }

  Future deleteAll() async {
    await storage.deleteAll();
  }

}