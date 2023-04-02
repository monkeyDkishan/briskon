import 'dart:async';

import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../common/auth_bg.dart';
import '../common/auth_button.dart';
import '../common/auth_text_field.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {

  bool canSendOTP = false;

  int time = 30;

  TextEditingController? controller;

  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setupTimer();

    controller = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final otp = context.read<AuthProvider>().resSendOtp.response?.data?.otp ?? 0;
      controller?.text = "$otp";
    });



  }

  @override
  dispose() {
    controller?.dispose();
    super.dispose();

  }

  setupTimer() {
    setState(() {
      canSendOTP = false;
      time = 30;
    });

    const oneSec = Duration(seconds: 1);
     timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (time == 0) {
          setState(() {
            canSendOTP = true;
            timer.cancel();
          });
        } else {
          setState(() {
            time--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final authProvider = context.watch<AuthProvider>();
    final res = authProvider.resVerifyOtp;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AuthBG(),
            Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                children: [
                  Column(
                    children: [
                      Text("Verify OTP", style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: kPrimaryColor
                      ),),
                      SizedBox(height: 1.h),
                      Text("You must have received an OTP on ${authProvider.enteredMobile}", style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: kSecondaryTitleColor
                      ),),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  AuthTextField(prefix: Assets.passwordIcon(width: 20.sp), hint: "OTP",controller: controller),
                  SizedBox(height: 1.h),
                  Align(
                    alignment: Alignment.topRight,
                    child: Opacity(
                      opacity: canSendOTP ? 1.0 : 0.5,
                      child: InkWell(
                        onTap: !canSendOTP ? null : () async {

                          try {
                            await authProvider.sendOTP(mobile: authProvider.enteredMobile);
                          } catch (e) {
                            Toaster.showMessage(context, msg: e.toString());
                          }

                          setupTimer();
                        },
                        child: SizedBox(
                          height: 20.sp,
                          child: Text(canSendOTP ? "Re Send OTP" : "00:$time",style: TextStyleConstant.textStyleFont500FontSize12ColorBlackOP05,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  AuthButton(title: "Verify OTP",onTap: () async {

                    try {
                      final isLogin = await authProvider.verifyOTP(otp: controller?.text ?? "");
                      timer?.cancel();
                      if(isLogin) {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      } else {
                        Navigator.of(context).pushNamed(kRegisterRoute);
                      }

                    } catch (e) {
                      Toaster.showMessage(context, msg: e.toString());
                    }
                  }, isLoading: res.state == Status.loading),
                  SizedBox(height: 1.h),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
