import 'package:briskon/repo/documents_repo.dart';
import 'package:briskon/utils.dart';

import '../model/distributor/res_get_distributor_list.dart';
import '../model/document/res_get_documents.dart';

abstract class IDocumentsProvider {
  Future getDocumentsByType({required DocumentTypes type});

  Future getDistributorList();
}

class DocumentsProvider extends BaseNotifier implements IDocumentsProvider {
  late Result<ResGetDocuments> _resGetDocuments;

  Result<ResGetDocuments> get resGetDocuments => _resGetDocuments;

  late Result<ResGetDistributorList> _resGetDistributorList;

  Result<ResGetDistributorList> get resGetDistributorList =>
      _resGetDistributorList;

  late final DocumentRepo repo;

  List<Documents> banners = [];
  List<Documents> certificates = [];
  List<Documents> applications = [];
  List<Documents> productQualities = [];
  List<Documents> brochures = [];

  DocumentsProvider({required this.repo}) {
    _resGetDocuments = Result();
    _resGetDistributorList = Result();
  }

  @override
  Future getDocumentsByType({required DocumentTypes type}) async {
    try {
      switch (type) {
        case DocumentTypes.banner:
          if (banners.isNotEmpty) return;
          break;
        case DocumentTypes.certificate:
          if (certificates.isNotEmpty) return;
          break;
        case DocumentTypes.application:
          if (applications.isNotEmpty) return;
          break;
        case DocumentTypes.productQuality:
          if (productQualities.isNotEmpty) return;
          break;
        case DocumentTypes.brochure:
          if (brochures.isNotEmpty) return;
          break;
      }

      resIsLoading(_resGetDocuments);

      final res = await repo.getDocumentsByType(type: type);

      if (res.status == 1) {
        switch (type) {
          case DocumentTypes.banner:
            banners.addAll(res.data ?? []);
            break;
          case DocumentTypes.certificate:
            certificates.addAll(res.data ?? []);
            break;
          case DocumentTypes.application:
            applications.addAll(res.data ?? []);
            break;
          case DocumentTypes.productQuality:
            productQualities.addAll(res.data ?? []);
            break;
          case DocumentTypes.brochure:
            brochures.addAll(res.data ?? []);
            break;
        }

        resIsSuccess(_resGetDocuments, res);
      } else {
        throw res.message ?? "Something Went Wrong.";
      }
    } catch (e) {
      resIsFailed(_resGetDocuments, e.toString());
    }
  }

  @override
  Future getDistributorList() async {
    try {
      resIsLoading(_resGetDistributorList);

      final res = await repo.getDistributorList();

      if (res.status == 1) {
        resIsSuccess(_resGetDistributorList, res);
      } else {
        throw res.message ?? "Something Went Wrong.";
      }
    } catch (e) {
      resIsFailed(_resGetDistributorList, e.toString());
    }
  }
}
