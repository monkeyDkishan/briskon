import 'package:briskon/model/user/res_send_otp.dart';
import 'package:briskon/model/user/res_verify_otp.dart';
import 'package:briskon/model/user/user_model.dart';
import 'package:briskon/services/secure_storage.dart';
import 'package:briskon/services/server_config.dart';
import 'package:briskon/services/web_services.dart';

abstract class IAuthRepo {
  Future<ResSendOtp> sendOTP({required String mobile});
  Future<ResVerifyOtp> verifyOTP({required String otp, required String mobile});
  Future<UserModel?> getUser();
  Future saveNewUser({required String userID, required String token});
}

class AuthRepo extends IAuthRepo {

  SecureStorage secureStorage = SecureStorage();

  @override
  Future saveNewUser({required String userID, required String token}) async {
    await secureStorage.setToken(token: token);
    await secureStorage.setUserId(userID: userID);
  }

  @override
  Future<UserModel?> getUser() async {
    final userID = await secureStorage.getUserId();
    final token = await secureStorage.getToken();

    if(userID != null && token != null) {
      return UserModel(
        userId: int.tryParse(userID),
        token: token
      );
    } else {
      return null;
    }

  }

  @override
  Future<ResSendOtp> sendOTP({required String mobile}) async {
    final json = await WebService.instance.post(request: NetworkRequest(url: ServerConfig.sendOtp, data: {
      "mobile" : mobile
    }));

    return ResSendOtp.fromJson(json);

  }

  @override
  Future<ResVerifyOtp> verifyOTP({required String otp, required String mobile}) async {
    final json = await WebService.instance.post(request: NetworkRequest(url: ServerConfig.verifyOtp, data: {
      "mobile" : mobile,
      "otp" : otp,
    }));

    return ResVerifyOtp.fromJson(json);
  }

}