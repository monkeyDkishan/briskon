import 'dart:convert';


import 'package:briskon/model/location/country.dart';
import 'package:briskon/utils.dart';
import 'package:briskon/view/auth/login.dart';
import 'package:briskon/view/auth/signup.dart';
import 'package:briskon/view/common/app_button.dart';
import 'package:briskon/view/common/auth_button.dart';
import 'package:briskon/view/common/auth_text_field.dart';
import 'package:briskon/view/common/auth_bg.dart';
import 'package:briskon/view/common/search_selection_screen.dart';
import 'package:briskon/view/enquiry/components/add_enquiry_field.dart';
import 'package:briskon/view/my_account/my_account.dart';
import 'package:briskon/view/products/products_grid.dart';
import 'package:briskon/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'applications/application_view.dart';
import 'certificates/certificates_list.dart';
import 'contact_us/contact_us_view.dart';
import 'distributors/our_distributors.dart';
import 'enquiry/add_enquiry_basic_details.dart';
import 'enquiry/add_qneuiry_product_details.dart';
import 'home/home_screen.dart';
import 'my_profile/my_profile_view.dart';
import 'order/order_details_screen.dart';
import 'order/order_list_screen.dart';



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

    return FutureBuilder(builder: (context, snapshot) {

      if(snapshot.hasData) {
        return const LoginScreen();
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

