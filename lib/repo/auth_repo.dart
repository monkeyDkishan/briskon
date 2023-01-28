import 'package:briskon/model/user/req_register.dart';
import 'package:briskon/model/user/res_register.dart';
import 'package:briskon/model/user/res_send_otp.dart';
import 'package:briskon/model/user/res_verify_otp.dart';
import 'package:briskon/model/user/user_model.dart';
import 'package:briskon/services/secure_storage.dart';
import 'package:briskon/services/server_config.dart';
import 'package:briskon/services/web_services.dart';
import 'package:dio/dio.dart';

import '../model/user/common.dart';
import '../model/user/req_update_user.dart';
import '../model/user/res_get_user_details_by_id.dart';

abstract class IAuthRepo {
  Future<ResSendOtp> sendOTP({required String mobile});
  Future<ResVerifyOtp> verifyOTP({required String otp, required String mobile});
  Future<UserModel?> getUser();
  Future saveNewUser({required String userID, required String token});
  Future<ResRegister> register({required ReqRegister req});
  Future<ResGetUserDetailsById> getUserDetailsById();
  Future<ResCommon> updateUserDetailsById({required ReqUpdateUser req});
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

  @override
  Future<ResRegister> register({required ReqRegister req}) async {
    final json = await WebService.instance.post(request: NetworkRequest(url: ServerConfig.register, data: req.toJson()));

    return ResRegister.fromJson(json);
  }

  @override
  Future<ResGetUserDetailsById> getUserDetailsById() async {
    final userId = await secureStorage.getUserId();

    if(userId == null) throw "No User Found";

    final json = await WebService.instance.post(request: NetworkRequest(url: ServerConfig.getUserDetailsById, data: {
      "user_id" : userId
    }));

    return ResGetUserDetailsById.fromJson(json);

  }

  @override
  Future<ResCommon> updateUserDetailsById({required ReqUpdateUser req}) async {
    final userId = await secureStorage.getUserId();

    if(userId == null) throw "No User Found";

    req.userId = userId;

    final jsonData = await req.toJson();

    final mapData = FormData.fromMap(jsonData);

    final json = await WebService.instance.post(request: NetworkRequest(url: ServerConfig.updateUserDetailsById, data: mapData));

    return ResCommon.fromJson(json);

  }

}
