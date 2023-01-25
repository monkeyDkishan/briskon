import 'package:briskon/provider/auth_provider.dart';
import 'package:briskon/repo/auth_repo.dart';
import 'package:provider/provider.dart';

class AppProvider {
  static get auth => ChangeNotifierProvider(create: (context) => AuthProvider(repo: AuthRepo()));
}