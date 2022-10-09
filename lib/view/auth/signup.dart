import 'package:briskon/utils.dart';
import 'package:briskon/view/common/auth_button.dart';
import 'package:briskon/view/common/auth_text_field.dart';
import 'package:briskon/view/common/auth_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'component/country_selection_signup.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isTermsSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AuthBG(),
            SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.all(15.sp),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                              color: kPrimaryColor),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "Create Account",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: kSecondaryTitleColor.withOpacity(0.5)),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    AuthTextField(
                        prefix: Assets.userIcon(width: 20.sp, height: 20.sp),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(nameLimit),
                        ],
                        keyboardType: TextInputType.name,
                        hint: "First Name"),
                    SizedBox(height: 1.h),
                    AuthTextField(
                        prefix: Assets.userIcon(width: 20.sp),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(nameLimit),
                        ],
                        keyboardType: TextInputType.name,
                        hint: "Last Name"),
                    SizedBox(height: 1.h),
                    AuthTextField(
                      prefix: Assets.emailIcon(width: 16.sp),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(nameLimit),
                      ],
                      keyboardType: TextInputType.emailAddress,
                      hint: "Email",
                    ),
                    SizedBox(height: 1.h),
                    AuthTextField(
                        prefix: Assets.phoneIcon(width: 20.sp),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(mobileLimit),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.phone,
                        hint: "Mobile Number",),
                    SizedBox(height: 1.h),
                    AuthTextField(
                        prefix: Assets.companyIcon(width: 17.sp, height: 20),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(nameLimit),
                        ],
                        keyboardType: TextInputType.name,
                        hint: "Company Name"),
                    SizedBox(height: 1.h),
                    AuthTextField(
                        prefix: Assets.designationIcon(width: 20.sp),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(nameLimit),
                        ],
                        keyboardType: TextInputType.name,
                        hint: "Designation"),
                    SizedBox(height: 1.h),
                    const CountryAndCitySelectionSignup(),
                    SizedBox(height: 1.h),
                    AuthTextField(
                        obscureText: true,
                        prefix: Assets.passwordIcon(width: 20.sp),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(passwordLimit),
                        ],
                        keyboardType: TextInputType.visiblePassword,
                        hint: "Password"),
                    SizedBox(height: 1.h),
                    AuthTextField(
                        obscureText: true,
                        prefix: Assets.passwordIcon(width: 20.sp),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(passwordLimit),
                        ],
                        keyboardType: TextInputType.visiblePassword,
                        hint: "Confirm Password"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                            value: isTermsSelected,
                            onChanged: (isSelected) {
                              setState(() {
                                isTermsSelected = isSelected == true;
                              });
                            }),
                        Expanded(
                          child: Text(
                            "I accept the Terms of Service and Privacy Policy",
                            style: TextStyleConstant
                                .textStyleFont500FontSize12ColorBlackOP05,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    AuthButton(
                      onTap: () {
                        Navigator.of(context).pushNamed(kHomeRoute);
                      },
                        title: "Sign Up"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyleConstant
                              .textStyleFont500FontSize14ColorBlackOP05,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyleConstant
                                  .textStyleFont600FontSize14.copyWith(color: kPrimaryColor),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
