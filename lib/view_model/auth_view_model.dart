abstract class IAuthProvider {
  Future sendOTP({required String mobile});
  Future verifyOTP({required String otp});
}