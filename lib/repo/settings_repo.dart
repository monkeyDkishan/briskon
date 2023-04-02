import 'package:briskon/model/base_res.dart';

import '../model/settings/res_contact_us.dart';
import '../services/server_config.dart';
import '../services/web_services.dart';

abstract class ISettingsRepo {
  Future<ResContactUs> getContactUs();
}

class SettingsRepo extends ISettingsRepo {

  @override
  Future<ResContactUs> getContactUs() async {
    final json = await WebService.instance.get(request: NetworkRequest(url: ServerConfig.contactUs));

    return ResContactUs.fromJson(json);
  }

}