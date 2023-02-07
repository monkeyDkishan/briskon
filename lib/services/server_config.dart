class ServerConfig {

  static var domain = "http://13.232.174.159";
  static var baseURL = "$domain/api/v1";
  static var sendOtp = "$baseURL/send_otp";
  static var verifyOtp = "$baseURL/verify_otp";
  static var register = "$baseURL/register";
  static var getUserDetailsById = "$baseURL/get_user_details_by_id";
  static var updateUserDetailsById = "$baseURL/update_user_details_by_id";
  static var getProductList = "$baseURL/get_product_list";
  static var storeLead = "$baseURL/store_lead";

}