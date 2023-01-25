import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {

  static UserStorage shared = UserStorage();

  late final SharedPreferences _pref;

  Future userStorage() async {
    await setUserPref();
  }

  setUserPref() async {
    _pref = await SharedPreferences.getInstance();
  }

  bool get isLogin  {
    final isLogin = _pref.getBool("isLogin") ?? false;

    return isLogin;
  }

  set isLogin(bool isLogin)  {
    _pref.setBool("isLogin", isLogin);
  }

  bool get isGuest  {
    final isGuest = _pref.getBool("isGuest") ?? false;

    return isGuest;
  }

  set isGuest(bool isGuest)  {
    _pref.setBool("isGuest", isGuest);
  }

}
