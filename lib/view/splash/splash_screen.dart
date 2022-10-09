import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 60.w,
              child: Assets.briskonLogo,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              color: kPrimaryColor,
              child: SafeArea(
                top: false,
                child: Container(
                  child: Text("Marketed By\nBriskon Pvt. Ltd.",
                      style: TextStyleConstant.textStyleFont600FontSize12.copyWith(color: Colors.white), textAlign: TextAlign.center),
                  margin: EdgeInsets.only(top: 10.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
