
import 'dart:io';

import 'package:briskon/utils.dart';
import 'package:briskon/view/applications/application_view.dart';
import 'package:briskon/view/auth/login.dart';
import 'package:briskon/view/auth/signup.dart';
import 'package:briskon/view/certificates/certificates_list.dart';
import 'package:briskon/view/contact_us/contact_us_view.dart';
import 'package:briskon/view/distributors/our_distributors.dart';
import 'package:briskon/view/enquiry/add_enquiry_basic_details.dart';
import 'package:briskon/view/enquiry/add_qneuiry_product_details.dart';
import 'package:briskon/view/home/home_screen.dart';
import 'package:briskon/view/kyc/kyc_view.dart';
import 'package:briskon/view/lending.dart';
import 'package:briskon/view/my_account/my_account.dart';
import 'package:briskon/view/my_profile/my_profile_view.dart';
import 'package:briskon/view/order/confirm_order/confirm_order_view.dart';
import 'package:briskon/view/order/order_details_screen.dart';
import 'package:briskon/view/order/order_list_screen.dart';
import 'package:briskon/view/products/products_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config.dart';

Widget app(){
  
  return Sizer(builder: (context, orientation, deviceType) {
    return MaterialApp(
      title: kAppName,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        fontFamily: kRegularFonts,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            ),
            foregroundColor: Colors.black,
            centerTitle: true,
            titleTextStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black
            ),
            systemOverlayStyle: Platform.isAndroid ?
            const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness:Brightness.dark ,
              systemNavigationBarIconBrightness: Brightness.dark,
            ) : SystemUiOverlayStyle.dark
        ),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.red,
      ),
      initialRoute: kInitialRoute,
      routes: {
        kInitialRoute: (context) => const LendingScreen(),
        kLoginRoute: (context) => const LoginScreen(),
        kRegisterRoute: (context) => const SignupScreen(),
        kHomeRoute: (context) => const HomeScreen(),
        kAddEnquiryRoute: (context) => const AddEnquiryBasicDetailsScreen(),
        kAddOrderDetailsRoute: (context) => const AddEnquiryProductDetailsScreen(),
        kOrderListRoute: (context) => const OrderListScreen(),
        kOrderDetailsRoute: (context) => OrderDetailsScreen(),
        kMyAccountRoute: (context) => const MyAccount(),
        kCertificatedRoute: (context) => const CertificatesList(),
        kDistributorsRoute: (context) => const OurDistributorsView(),
        kContactUsRoute: (context) => ContactUsView(),
        kProfileRoute: (context) => const MyProfileView(),
        kKYCRoute: (context) => const KYCScreen(),
        kApplicationRoute: (context) => ApplicationView(),
        kProductDetailsRoute: (context) => const ProductDetailsScreen(),
        kConfirmOrderRoute: (context) => const ConfirmOrderScreen(),
      },
      builder: (context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
              textScaleFactor: 1.0
          ),
          child: child ?? Container(),
        );
      },
    );
  },);
}