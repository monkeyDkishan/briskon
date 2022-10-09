import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';

class MyAccountListModel {

  final String key;
  final String title;
  final String subTitle;
  final Color color;
  final Widget icon;

  MyAccountListModel({required this.key, required this.title, required this.subTitle, required this.color, required this.icon});

  static List<MyAccountListModel> list = [
    MyAccountListModel(key: "my_profile", title: "MY PROFILE", subTitle: "View and Edit Your Profile", color: Color(0xff7087F6), icon: Assets.myAccountProfileIcon()),
    MyAccountListModel(key: "feedback", title: "FEEDBACK", subTitle: "Send Us Your Feedback", color: Color(0xffF5C347), icon: Assets.myAccountFeedbackIcon()),
    MyAccountListModel(key: "kyc", title: "KYC", subTitle: "View and Update Your KYC", color: Color(0xffFF865E), icon: Assets.kycIcon()),
    MyAccountListModel(key: "logout", title: "LOGOUT", subTitle: "Logout from your account", color: Color(0xff94B49F), icon: Assets.myAccountLogoutIcon()),
  ];
  
}