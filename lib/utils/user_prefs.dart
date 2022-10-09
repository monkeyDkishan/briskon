import 'package:shared_preferences/shared_preferences.dart';

import '../model/user/user_model.dart';

class UserStorage {

  static UserStorage shared = UserStorage();

  late final SharedPreferences _pref;

  UserStorage() {
    setUserPref();
  }

  setUserPref() async {
    _pref = await SharedPreferences.getInstance();
  }

  UserModel get user  {
    final userId = _pref.getInt("userId");
    final token = _pref.getString("token");

    return UserModel(userId: userId,token: token);
  }

  set user(UserModel user)  {

    _pref.setInt("userId", user.userId ?? 0);
    _pref.setString("token", user.token ?? "");

  }
}
