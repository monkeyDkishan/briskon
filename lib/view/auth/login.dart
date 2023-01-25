import 'package:briskon/provider/auth_provider.dart';
import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/auth_bg.dart';
import '../common/auth_button.dart';
import '../common/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final authProvider = context.watch<AuthProvider>();
    final res = authProvider.resSendOtp;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
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
                      Text("Enter Mobile Number", style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: kPrimaryColor
                      ),),
                      SizedBox(height: 1.h),
                      Text("Welcome back", style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: kSecondaryTitleColor
                      ),),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  AuthTextField(prefix: Assets.phoneIcon(width: 20.sp), hint: "Phone", controller: controller),

                  SizedBox(height: 2.h),
                  AuthButton(title: "Send OTP",onTap: () async {

                    try {
                      await authProvider.sendOTP(mobile: controller.text);
                      Navigator.of(context).pushNamed(kVerifyOTPRoute);
                    } catch (e) {
                      Toaster.showMessage(context, msg: e.toString());
                    }


                  }, isLoading: res.state == Status.loading),
                  SizedBox(height: 1.h),
                  if(false)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account?",style: TextStyleConstant.textStyleFont500FontSize14ColorBlackOP05,),
                      TextButton(onPressed: (){
                        Navigator.of(context).pushNamed(kRegisterRoute);
                      }, child: Text("Sign Up",style: TextStyleConstant.textStyleFont600FontSize14.copyWith(color: kPrimaryColor),))
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      authProvider.setIsGuest();
                    },
                    child: SizedBox(
                      height: 44,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Skip",style: TextStyleConstant.textStyleFont600FontSize14ColorSkip),
                          const SizedBox(width: 5),
                          Assets.arrowRightIcon(width: 15.sp)
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
