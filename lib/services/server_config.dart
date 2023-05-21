class ServerConfig {

  static var domain = "http://13.232.174.159";
  static var baseURL = "$domain/api/v1";
  static var imageBaseURL = domain;
  static var sendOtp = "$baseURL/send_otp";
  static var verifyOtp = "$baseURL/verify_otp";
  static var register = "$baseURL/register";
  static var getUserDetailsById = "$baseURL/get_user_details_by_id";
  static var updateUserDetailsById = "$baseURL/update_user_details_by_id";
  static var getProductList = "$baseURL/get_product_list";
  static var storeLead = "$baseURL/store_lead";
  static var getLeadListByUser = "$baseURL/get_lead_list_by_user";
  static var getLeadDetailByLeadId = "$baseURL/get_lead_detail_by_lead_id";
  static var updateKycDetails = "$baseURL/update_kyc_details";
  static var getKycDetails = "$baseURL/get_kyc_details";
  static var getDocList = "$baseURL/get_document_list_by_type";
  static var contactUs = "$baseURL/get_contact_us";
  static var getDistributorList = "$baseURL/get_distributor_list";

}