import 'package:briskon/model/products/res_get_product_list.dart';

import '../services/server_config.dart';
import '../services/web_services.dart';

abstract class IEnquiryRepo {
  Future<ResGetProductList> productList();
}

class EnquiryRepo extends IEnquiryRepo {

  @override
  Future<ResGetProductList> productList() async {
    final json = await WebService.instance.post(request: NetworkRequest(url: ServerConfig.getProductList, data: {
      "size" : 10
    }));

    return ResGetProductList.fromJson(json);
  }

}