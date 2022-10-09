import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';

import '../common/auth_bg.dart';
import '../common/auth_button.dart';
import '../common/auth_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      Text("Sign In", style: TextStyle(
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
                  AuthTextField(prefix: Assets.emailIcon(width: 20.sp), hint: "Email"),
                  SizedBox(height: 1.h),
                  AuthTextField(prefix: Assets.passwordIcon(width: 20.sp), hint: "Password"),
                  SizedBox(height: 1.h),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: (){

                      },
                      child: SizedBox(
                        height: 20.sp,
                        child: Text("Forgot Password ?",style: TextStyleConstant.textStyleFont500FontSize12ColorBlackOP05,),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  AuthButton(title: "Sign In",onTap: () {
                    Navigator.of(context).pushNamed(kHomeRoute);
                  }),
                  SizedBox(height: 1.h),
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
                      Navigator.of(context).pushNamed(kHomeRoute);
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
