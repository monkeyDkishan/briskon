import 'package:briskon/model/order/res_get_lead_list_by_user.dart';
import 'package:briskon/model/products/res_get_product_list.dart';

import '../model/base_res.dart';
import '../model/order/req_create_lead.dart';
import '../model/order/res_get_lead_detail_by_lead_id.dart';
import '../services/secure_storage.dart';
import '../services/server_config.dart';
import '../services/web_services.dart';

abstract class IEnquiryRepo {
  Future<ResGetProductList> productList();
  Future<BaseRes> createLead({required ReqCreateLead lead});
  Future<ResGetLeadListByUser> getLeadListByUser();
  Future<ResGetLeadDetailByLeadId> getLeadDetailByLeadId({required int leadId});
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

  @override
  Future<ResGetLeadListByUser> getLeadListByUser() async {
    final userId = await secureStorage.getUserId() ?? "";

    final json = await WebService.instance.post(request: NetworkRequest(url: ServerConfig.getLeadListByUser, data: {
      "user_id" : userId
    }));

    return ResGetLeadListByUser.fromJson(json);
  }

  @override
  Future<ResGetLeadDetailByLeadId> getLeadDetailByLeadId({required int leadId}) async {
    final json = await WebService.instance.post(request: NetworkRequest(url: ServerConfig.getLeadDetailByLeadId, data: {
      "lead_id" : leadId
    }));

    return ResGetLeadDetailByLeadId.fromJson(json);
  }

}