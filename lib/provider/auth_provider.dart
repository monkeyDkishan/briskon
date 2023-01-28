import 'package:briskon/model/user/req_register.dart';
import 'package:briskon/model/user/res_register.dart';
import 'package:briskon/model/user/res_send_otp.dart';
import 'package:briskon/model/user/res_verify_otp.dart';
import 'package:briskon/repo/auth_repo.dart';

import '../model/user/common.dart';
import '../model/user/req_update_user.dart';
import '../model/user/res_get_user_details_by_id.dart';
import '../utils.dart';
import '../utils/storage+user.dart';

abstract class IAuthProvider {
  Future sendOTP({required String mobile});
  Future<bool> verifyOTP({required String otp});
  Future register({required ReqRegister req});
  Future getUserDetailsById();
  Future updateUserDetailsById({required ReqUpdateUser req});
}

class AuthProvider extends BaseNotifier implements IAuthProvider {

  late final IAuthRepo repo;

  late Result<ResSendOtp> _resSendOtp;
  Result<ResSendOtp> get resSendOtp => _resSendOtp;

  late Result<ResVerifyOtp> _resVerifyOtp;
  Result<ResVerifyOtp> get resVerifyOtp => _resVerifyOtp;

  late Result<ResRegister> _resRegister;
  Result<ResRegister> get resRegister => _resRegister;

  late Result<ResGetUserDetailsById> _resGetUserDetailsById;
  Result<ResGetUserDetailsById> get resGetUserDetailsById => _resGetUserDetailsById;

  late Result<ResCommon> _resUpdateUserDetailsById;
  Result<ResCommon> get resUpdateUserDetailsById => _resUpdateUserDetailsById;

  bool isLogin = false;
  bool isGuest = false;

  AuthProvider({required this.repo}) {
    _resSendOtp = Result();
    _resVerifyOtp = Result();
    _resRegister = Result();
    _resGetUserDetailsById = Result();
    _resUpdateUserDetailsById = Result();

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

  @override
  Future register({required ReqRegister req}) async {

    resIsLoading(_resRegister);
    try {
      req.mobile = enteredMobile;

      if(req.firstName?.trim().isEmpty == true) throw "Please Enter First Name.";
      if(req.lastName?.trim().isEmpty == true) throw "Please Enter Last Name.";
      if(req.email?.trim().isEmpty == true) throw "Please Enter Email.";
      if(req.email?.trim().isEmail == false) throw "Please Enter Valid Email.";
      // if(req.companyName?.trim().isEmpty == true) throw "Please Enter First Name.";
      // if(req.firstName?.trim().isEmpty == true) throw "Please Enter First Name.";
      // if(req.firstName?.trim().isEmpty == true) throw "Please Enter First Name.";
      // if(req.firstName?.trim().isEmpty == true) throw "Please Enter First Name.";

      final res = await repo.register(req: req);

      if(res.status == 1) {

        resIsSuccess(_resRegister, res);

        if(res.data?.member?.id == null || res.data?.member?.authToken == null) {
          return false;
        }

        UserStorage.shared.isLogin = true;
        isLogin = true;

        await repo.saveNewUser(userID: "${res.data?.member?.id ?? ""}", token: res.data?.member?.authToken ?? "");

        notifyListeners();

      } else {
        throw res.message ?? "Something Went Wrong.";
      }

    } catch (e) {
      resIsFailed(_resRegister, e.toString());
      rethrow;
    }
  }

  @override
  Future getUserDetailsById() async {

    if(isGuest) return;

    try {
      resIsLoading(_resGetUserDetailsById);

      final res = await repo.getUserDetailsById();

      if(res.status == 1) {
        resIsSuccess(_resGetUserDetailsById, res);
      } else {
        throw res.message ?? "Something Went Wrong.";
      }

    } catch (e) {
      resIsFailed(_resGetUserDetailsById, e.toString());
    }

  }

  @override
  Future updateUserDetailsById({required ReqUpdateUser req}) async {

    if(isGuest) return;

    try {
      resIsLoading(_resUpdateUserDetailsById);

      final res = await repo.updateUserDetailsById(req: req);

      if(res.status == 1) {
        resIsSuccess(_resUpdateUserDetailsById, res);
      } else {
        throw res.message ?? "Something Went Wrong.";
      }

    } catch (e) {
      resIsFailed(_resUpdateUserDetailsById, e.toString());
    }
  }

}