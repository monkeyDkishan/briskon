import 'package:briskon/repo/settings_repo.dart';

import '../model/settings/res_contact_us.dart';
import '../utils.dart';

abstract class ISettingsProvider {
  Future getContactUs();
}

class SettingsProvider extends BaseNotifier implements ISettingsProvider {

  late Result<ResContactUs> _resContactUs;
  Result<ResContactUs> get resContactUs => _resContactUs;

  late final SettingsRepo repo;

  SettingsProvider({required this.repo}){
    _resContactUs = Result();
  }

  @override
  Future getContactUs() async {
    try {
      resIsLoading(_resContactUs);

      final res = await repo.getContactUs();

      if(res.status == 1) {
        resIsSuccess(_resContactUs, res);
      } else {
        throw res.message ?? "Something Went Wrong.";
      }

    } catch (e) {
      resIsFailed(_resContactUs, e.toString());
    }
  }

}