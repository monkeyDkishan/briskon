import 'package:briskon/model/base_res.dart';
import 'package:briskon/model/kyc/res_get_kyc_details.dart';
import 'package:briskon/services/secure_storage.dart';
import 'package:dio/dio.dart';

import '../services/server_config.dart';
import '../services/web_services.dart';

abstract class IKYCRepo {
  Future<BaseRes> updateKYC({required KYCData kyc});
  Future<ResGetKycDetails> getKycDetails();
}

class KYCRepo extends IKYCRepo {

  SecureStorage secureStorage = SecureStorage();

  @override
  Future<BaseRes> updateKYC({required KYCData kyc}) async {
    final userId = await secureStorage.getUserId() ?? "";

    kyc.userId = int.tryParse(userId);

    final json = await kyc.toJson();

    final mapData = FormData.fromMap(json);

    final res = await WebService.instance.post(request: NetworkRequest(url: ServerConfig.updateKycDetails, data: mapData));

    return BaseRes.fromJson(res);

  }

  @override
  Future<ResGetKycDetails> getKycDetails() async {
    final userId = await secureStorage.getUserId() ?? "";

    final res = await WebService.instance.post(request: NetworkRequest(url: ServerConfig.getKycDetails, data: {
      "user_id" : userId
    }));

    return ResGetKycDetails.fromJson(res);
  }

}