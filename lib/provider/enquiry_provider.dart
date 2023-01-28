import 'package:briskon/repo/enquiry_repo.dart';

import '../model/products/res_get_product_list.dart';
import '../utils.dart';

abstract class IEnquiryProvider {
  Future productList();
}

class EnquiryProvider extends BaseNotifier implements IEnquiryProvider {

  late Result<ResGetProductList> _resGetProductList;
  Result<ResGetProductList> get resGetProductList => _resGetProductList;

  late final IEnquiryRepo repo;

  EnquiryProvider({required this.repo}) {
    _resGetProductList = Result();
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

}