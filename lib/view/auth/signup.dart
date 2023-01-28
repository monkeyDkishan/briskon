import 'package:briskon/model/user/req_register.dart';
import 'package:briskon/utils.dart';
import 'package:briskon/view/common/auth_button.dart';
import 'package:briskon/view/common/auth_text_field.dart';
import 'package:briskon/view/common/auth_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import 'component/country_selection_signup.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isTermsSelected = false;

  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _emailName;
  late final TextEditingController _mobileName;
  late final TextEditingController _companyName;
  late final TextEditingController _designationName;
  late final TextEditingController _address1;
  late final TextEditingController _address2;
  late final TextEditingController _postalCode;

  String city = "Gujarat";
  String state = "Ahmedabad";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _emailName = TextEditingController();
    _mobileName = TextEditingController();
    _companyName = TextEditingController();
    _designationName = TextEditingController();
    _address1 = TextEditingController();
    _address2 = TextEditingController();
    _postalCode = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _firstName.dispose();
    _lastName.dispose();
    _emailName.dispose();
    _mobileName.dispose();
    _companyName.dispose();
    _designationName.dispose();
    _address1.dispose();
    _address2.dispose();
    _postalCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final authProvider = context.watch<AuthProvider>();
    final res = authProvider.resRegister;

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
                        hint: "First Name",controller: _firstName),
                    SizedBox(height: 1.h),
                    AuthTextField(
                        prefix: Assets.userIcon(width: 20.sp),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(nameLimit),
                        ],
                        keyboardType: TextInputType.name,
                        hint: "Last Name", controller: _lastName),
                    SizedBox(height: 1.h),
                    AuthTextField(
                      prefix: Assets.emailIcon(width: 16.sp),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(nameLimit),
                      ],
                      keyboardType: TextInputType.emailAddress,
                      hint: "Email",
                      controller: _emailName,
                    ),
                    SizedBox(height: 1.h),

                    AuthTextField(
                        prefix: Assets.companyIcon(width: 17.sp, height: 20),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(nameLimit),
                        ],
                        keyboardType: TextInputType.name,
                        hint: "Company Name",controller: _companyName),
                    SizedBox(height: 1.h),
                    AuthTextField(
                        prefix: Assets.designationIcon(width: 20.sp),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(nameLimit),
                        ],
                        keyboardType: TextInputType.name,
                        hint: "Designation",controller: _designationName),
                    SizedBox(height: 1.h),
                    AuthTextField(
                        prefix: Assets.locationMarkIcon(width: 20.sp),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(addressLimit),
                        ],
                        keyboardType: TextInputType.streetAddress,
                        hint: "Address Line 1", controller: _address1),
                    SizedBox(height: 1.h),
                    AuthTextField(
                        prefix: Assets.locationMarkIcon(width: 20.sp),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(addressLimit),
                        ],
                        keyboardType: TextInputType.streetAddress,
                        hint: "Address Line 2", controller: _address2),
                    SizedBox(height: 1.h),
                    AuthTextField(
                        prefix: Assets.locationMarkIcon(width: 20.sp),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(addressLimit),
                        ],
                        keyboardType: TextInputType.text,
                        hint: "PostalCode", controller: _postalCode),
                    SizedBox(height: 1.h),
                    CountryAndCitySelectionSignup(
                      onCitySelection: (city) {
                        this.city = city;
                      },
                      onStateSelection: (state) {
                        this.state = state;
                      },
                    ),
                    SizedBox(height: 1.h),

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
                      onTap: () async {

                        try {

                          if(isTermsSelected == false) { throw "Please accept terms and conditions.";}

                          final req = ReqRegister(
                            firstName: _firstName.text,
                            lastName: _lastName.text,
                            email: _emailName.text,
                            companyName: _companyName.text,
                            designation: _designationName.text,
                            city: city,
                            state: state,
                            addressLine1: _address1.text,
                            addressLine2: _address2.text,
                            country: "India",
                            postalCode: _postalCode.text,
                          );

                          await authProvider.register(req: req);

                          Navigator.of(context).popUntil((route) => route.isFirst);

                        } catch (e) {
                          Toaster.showMessage(context, msg: e.toString());
                        }
                      },
                        title: "Sign Up", isLoading: res.state == Status.loading),
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
                              Navigator.of(context).popUntil((route) => route.isFirst);
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
