import 'package:briskon/model/document/res_get_documents.dart';
import 'package:briskon/utils.dart';

import '../model/distributor/res_get_distributor_list.dart';
import '../services/server_config.dart';
import '../services/web_services.dart';

abstract class IDocumentRepo {
  Future<ResGetDocuments> getDocumentsByType({required DocumentTypes type});
  Future<ResGetDistributorList> getDistributorList();
}

class DocumentRepo extends IDocumentRepo {

  @override
  Future<ResGetDocuments> getDocumentsByType({required DocumentTypes type}) async {
    final json = await WebService.instance.post(request: NetworkRequest(url: ServerConfig.getDocList, data: {
      "document_type" : type.textValue
    }));

    return ResGetDocuments.fromJson(json);
  }

  @override
  Future<ResGetDistributorList> getDistributorList() async {
    final json = await WebService.instance.get(request: NetworkRequest(url: ServerConfig.getDistributorList));

    return ResGetDistributorList.fromJson(json);
  }

}
