import 'package:briskon/model/order/req_create_lead.dart';
import 'package:briskon/repo/enquiry_repo.dart';

import '../model/base_res.dart';
import '../model/order/res_get_lead_detail_by_lead_id.dart';
import '../model/order/res_get_lead_list_by_user.dart';
import '../model/products/res_get_product_list.dart';
import '../utils.dart';

abstract class IEnquiryProvider {
  Future productList();
  Future createLead();
  Future getLeadListByUser();
  Future getLeadDetailByLeadId({required int leadId});
}

class EnquiryProvider extends BaseNotifier implements IEnquiryProvider {

  late Result<ResGetProductList> _resGetProductList;
  Result<ResGetProductList> get resGetProductList => _resGetProductList;

  late Result<BaseRes> _resCreateLead;
  Result<BaseRes> get resCreateLead => _resCreateLead;

  late Result<ResGetLeadListByUser> _resGetLeadListByUser;
  Result<ResGetLeadListByUser> get resGetLeadListByUser => _resGetLeadListByUser;

  late Result<ResGetLeadDetailByLeadId> _resGetLeadDetailByLeadId;
  Result<ResGetLeadDetailByLeadId> get resGetLeadDetailByLeadId => _resGetLeadDetailByLeadId;

  late final IEnquiryRepo repo;

  ReqCreateLead lead = ReqCreateLead();

  EnquiryProvider({required this.repo}) {
    _resGetProductList = Result();
    _resCreateLead = Result();
    _resGetLeadListByUser = Result();
    _resGetLeadDetailByLeadId = Result();
    _resGetLeadDetailByLeadId.state = Status.loading;
  }

  @override
  Future productList() async {

    try {
      resIsLoading(_resGetProductList);

      final res = await repo.productList();

      if(res.status == 1) {
        resIsSuccess(_resGetProductList, res);
      } else {
        throw res.message ?? "Something Went Wrong.";
      }

    } catch (e) {
      resIsFailed(_resGetProductList, e.toString());
    }
  }

  @override
  Future createLead() async {

    try {
      resIsLoading(_resCreateLead);

      final res = await repo.createLead(lead: lead);

      if(res.status == 1) {
        resIsSuccess(_resCreateLead, res);
      } else {
        throw res.message ?? "Something Went Wrong.";
      }

    } catch (e) {
      resIsFailed(_resCreateLead, e.toString());
      rethrow;
    }
  }

  @override
  Future getLeadListByUser() async {
    try {
      resIsLoading(_resGetLeadListByUser);

      final res = await repo.getLeadListByUser();

      if(res.status == 1) {
        resIsSuccess(_resGetLeadListByUser, res);
      } else {
        throw res.message ?? "Something Went Wrong.";
      }

    } catch (e) {
      resIsFailed(_resGetLeadListByUser, e.toString());
      rethrow;
    }
  }

  @override
  Future getLeadDetailByLeadId({required int leadId}) async {
    try {
      resIsLoading(_resGetLeadDetailByLeadId);

      final res = await repo.getLeadDetailByLeadId(leadId: leadId);

      if(res.status == 1) {
        resIsSuccess(_resGetLeadDetailByLeadId, res);
      } else {
        throw res.message ?? "Something Went Wrong.";
      }

    } catch (e) {
      resIsFailed(_resGetLeadDetailByLeadId, e.toString());
      rethrow;
    }
  }

}