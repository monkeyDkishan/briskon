import 'package:briskon/model/user/res_send_otp.dart';
import 'package:briskon/model/user/res_verify_otp.dart';
import 'package:briskon/repo/auth_repo.dart';

import '../utils.dart';
import '../utils/storage+user.dart';

abstract class IAuthProvider {
  Future sendOTP({required String mobile});
  Future<bool> verifyOTP({required String otp});
}

class AuthProvider extends BaseNotifier implements IAuthProvider {

  late final IAuthRepo repo;

  late Result<ResSendOtp> _resSendOtp;
  Result<ResSendOtp> get resSendOtp => _resSendOtp;

  late Result<ResVerifyOtp> _resVerifyOtp;
  Result<ResVerifyOtp> get resVerifyOtp => _resVerifyOtp;

  bool isLogin = false;
  bool isGuest = false;

  AuthProvider({required this.repo}) {
    _resSendOtp = Result();
    _resVerifyOtp = Result();

    isLogin = UserStorage.shared.isLogin;
    isGuest = UserStorage.shared.isGuest;

    notifyListeners();

    getUserFromStorage();
  }

  String enteredMobile = "";

  getUserFromStorage() async {
    final user = await repo.getUser();

    print("userid ${user?.userId}, ${user?.token}");

  }

  setIsGuest() {
    isGuest = true;
    UserStorage.shared.isGuest = true;
    notifyListeners();
  }

  @override
  Future sendOTP({required String mobile}) async {
    resIsLoading(_resSendOtp);

    enteredMobile = mobile;

    try {

      if(mobile.trim().isEmpty) throw "Please Enter Mobile Number.";

      final res = await repo.sendOTP(mobile: mobile);

      if(res.status == 1) {
        resIsSuccess(_resSendOtp, res);
      } else {
        throw res.message ?? "Something Went Wrong.";
      }

    } catch (e) {
      resIsFailed(_resSendOtp, e.toString());
      rethrow;
    }

  }

  @override
  Future<bool> verifyOTP({required String otp}) async {
    resIsLoading(_resVerifyOtp);

    try {

      if(enteredMobile.isEmpty) throw "Please Enter Mobile Number.";
      if(otp.isEmpty) throw "Please Enter OTP.";

      print("Cool 0");

      final res = await repo.verifyOTP(otp: otp, mobile: enteredMobile);

      if(res.status == 1) {
        resIsSuccess(_resVerifyOtp, res);

        if(res.data?.userId == null || res.data?.authToken == null) {
          return false;
        }

        repo.saveNewUser(userID: "${res.data?.userId ?? ""}", token: res.data?.authToken ?? "");

        UserStorage.shared.isLogin = true;
        isLogin = true;

        return true;
      } else {
        throw res.message ?? "Something Went Wrong.";
      }

    } catch (e) {
      resIsFailed(_resVerifyOtp, e.toString());
      rethrow;
    }
  }

  logout() {
    isLogin = false;
    isGuest = false;
    notifyListeners();

    UserStorage.shared.isLogin = false;
    UserStorage.shared.isGuest = false;
  }

}