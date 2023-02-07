import 'package:briskon/model/products/res_get_product_list.dart';

import '../model/base_res.dart';
import '../model/order/req_create_lead.dart';
import '../services/secure_storage.dart';
import '../services/server_config.dart';
import '../services/web_services.dart';

abstract class IEnquiryRepo {
  Future<ResGetProductList> productList();
  Future<BaseRes> createLead({required ReqCreateLead lead});
}

class EnquiryRepo extends IEnquiryRepo {

  SecureStorage secureStorage = SecureStorage();

  @override
  Future<ResGetProductList> productList() async {
    final json = await WebService.instance.post(request: NetworkRequest(url: ServerConfig.getProductList, data: {
      "size" : 10
    }));

    return ResGetProductList.fromJson(json);
  }

  @override
  Future<BaseRes> createLead({required ReqCreateLead lead}) async {

    lead.userId = await secureStorage.getUserId() ?? "";

    final json = await WebService.instance.post(request: NetworkRequest(url: ServerConfig.storeLead, data: lead.toJson()));

    return BaseRes.fromJson(json);
  }

}