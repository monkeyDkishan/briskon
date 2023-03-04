import 'package:briskon/repo/documents_repo.dart';
import 'package:briskon/utils.dart';

import '../model/document/res_get_documents.dart';

abstract class IDocumentsProvider {
  Future getDocumentsByType({required DocumentTypes type});
}

class DocumentsProvider extends BaseNotifier implements IDocumentsProvider {

  late Result<ResGetDocuments> _resGetDocuments;
  Result<ResGetDocuments> get resGetDocuments => _resGetDocuments;

  late final DocumentRepo repo;

  DocumentsProvider({required this.repo}) {
    _resGetDocuments = Result();
  }

  @override
  Future getDocumentsByType({required DocumentTypes type}) async {
    try {
      resIsLoading(_resGetDocuments);

      final res = await repo.getDocumentsByType(type: type);

      if(res.status == 1) {
        resIsSuccess(_resGetDocuments, res);
      } else {
        throw res.message ?? "Something Went Wrong.";
      }

    } catch (e) {
      resIsFailed(_resGetDocuments, e.toString());
    }
  }

}