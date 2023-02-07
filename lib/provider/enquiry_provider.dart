import 'package:briskon/model/order/req_create_lead.dart';
import 'package:briskon/repo/enquiry_repo.dart';

import '../model/base_res.dart';
import '../model/products/res_get_product_list.dart';
import '../utils.dart';

abstract class IEnquiryProvider {
  Future productList();
  Future createLead();
}

class EnquiryProvider extends BaseNotifier implements IEnquiryProvider {

  late Result<ResGetProductList> _resGetProductList;
  Result<ResGetProductList> get resGetProductList => _resGetProductList;

  late Result<BaseRes> _resCreateLead;
  Result<BaseRes> get resCreateLead => _resCreateLead;

  late final IEnquiryRepo repo;

  ReqCreateLead lead = ReqCreateLead();

  EnquiryProvider({required this.repo}) {
    _resGetProductList = Result();
    _resCreateLead = Result();
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

}