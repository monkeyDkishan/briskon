import 'package:briskon/model/base_res.dart';
import 'package:briskon/repo/kyc_repo.dart';
import 'package:briskon/utils.dart';

import '../model/kyc/res_get_kyc_details.dart';

abstract class IKYCProvider {
  Future updateKYC({required KYCData kyc});
  Future getKycDetails();
}

class KYCProvider extends BaseNotifier implements IKYCProvider {

  late Result<BaseRes> _resUpdateKYC;
  Result<BaseRes> get resUpdateKYC => _resUpdateKYC;

  late Result<ResGetKycDetails> _resGetKycDetails;
  Result<ResGetKycDetails> get resGetKycDetails => _resGetKycDetails;

  late final KYCRepo repo;

  KYCProvider({required this.repo}) {
    _resUpdateKYC = Result();
    _resGetKycDetails = Result();
  }

  validateString({String? text, String? name}) {
    if((text ?? "").isEmpty) throw "Please Enter ${name ?? "Value"}.";
  }

  @override
  Future updateKYC({required KYCData kyc}) async {

    try {

      validateString(text: kyc.customerName, name: "Customer Name");
      validateString(text: kyc.gstNumber, name: "GST Number");
      // validateString(text: kyc.gstFile, name: "GST File");
      validateString(text: kyc.panNumber, name: "Pan Number");
      // validateString(text: kyc.panFile, name: "Pan File");
      validateString(text: kyc.officeAddress, name: "Office Address");
      validateString(text: kyc.bankName, name: "Bank Name");
      validateString(text: kyc.acNumber, name: "Account Number");
      validateString(text: kyc.ifscCode, name: "IFSC Code");
      validateString(text: kyc.bankAddress, name: "Bank Address");

      resIsLoading(_resUpdateKYC);

      final res = await repo.updateKYC(kyc: kyc);

      if(res.status == 1) {
        resIsSuccess(_resUpdateKYC, res);
      } else {
        throw res.message ?? "Something Went Wrong.";
      }

    } catch (e) {
      resIsFailed(_resUpdateKYC, e.toString());
      rethrow;
    }

  }

  @override
  Future getKycDetails() async {

    try {

      resIsLoading(_resGetKycDetails);

      final res = await repo.getKycDetails();

      if(res.status == 1) {
        resIsSuccess(_resGetKycDetails, res);
      } else {
        throw res.message ?? "Something Went Wrong.";
      }

    } catch (e) {
      resIsFailed(_resGetKycDetails, e.toString());
      rethrow;
    }
  }

}