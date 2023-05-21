import 'package:briskon/app.dart';
import 'package:briskon/utils/storage+user.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  UserStorage.shared = UserStorage();

  await UserStorage.shared.userStorage();

  runApp(app());
}