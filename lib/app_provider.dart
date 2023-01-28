import 'package:briskon/provider/auth_provider.dart';
import 'package:briskon/provider/enquiry_provider.dart';
import 'package:briskon/repo/auth_repo.dart';
import 'package:briskon/repo/enquiry_repo.dart';
import 'package:provider/provider.dart';

class AppProvider {
  static get auth => ChangeNotifierProvider(create: (context) => AuthProvider(repo: AuthRepo()));
  static get enquiry => ChangeNotifierProvider(create: (context) => EnquiryProvider(repo: EnquiryRepo()));
}