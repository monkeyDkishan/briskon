import 'package:briskon/model/user/user_model.dart';
import 'package:briskon/services/secure_storage.dart';

abstract class IAuthRepo {
  Future sendOTP({required String mobile});
  Future verifyOTP({required String otp});
  Future<UserModel?> getUser();
}

class AuthRepo extends IAuthRepo {

  SecureStorage secureStorage = SecureStorage();

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
  Future sendOTP({required String mobile}) {
    // TODO: implement sendOTP
    throw UnimplementedError();
  }

  @override
  Future verifyOTP({required String otp}) {
    // TODO: implement verifyOTP
    throw UnimplementedError();
  }

}