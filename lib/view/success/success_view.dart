import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../common/app_button.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({Key? key, required this.onFinish}) : super(key: key);

  final Function onFinish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.asset(
            width: 50.w,
            'assets/files/success_lottie.json',
            repeat: false,
          ),
          Padding(
            padding: EdgeInsets.all(15.sp),
            child: AppButton (
                onTap: () {
                  onFinish();
                },
                title: "OK"),
          )
        ],
      ),
    );
  }
}
