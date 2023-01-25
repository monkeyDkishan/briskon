import 'package:briskon/provider/auth_provider.dart';
import 'package:briskon/utils.dart';
import 'package:briskon/view/auth/login.dart';
import 'package:briskon/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


class LendingScreen extends StatefulWidget {
  const LendingScreen({Key? key}) : super(key: key);

  @override
  State<LendingScreen> createState() => _LendingScreenState();
}

class _LendingScreenState extends State<LendingScreen> {


  Future<bool> isAppReady() async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Widget build(BuildContext context) {

    fillTheCommonSizeINIT();

    final authProvider = context.watch<AuthProvider>();

    if(authProvider.isLogin || authProvider.isGuest) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }

    return FutureBuilder(builder: (context, snapshot) {

      if(snapshot.hasData) {

      } else {
        return Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: SizedBox(width: MediaQuery.of(context).size.width * 0.502415,child: Assets.briskonLogo,),
        );
      }

    },future: isAppReady());

  }
}

