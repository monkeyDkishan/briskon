import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';

class MenuModel{
  final int order;
  final String title;
  final String route;
  final String icon;

  MenuModel({required this.order,required this.title,required this.route, required this.icon});

  Widget svgIcon(bool isSelected) => SVGImage.getIconFrom(icon: "menu/$icon",color: isSelected ? Colors.white : kFontGrayColor);

  static List<MenuModel> menus = [
    MenuModel(order: 0, route: kAddEnquiryRoute, title: "Enquiry", icon: "ic-menu-enquiry-icon.svg"),
    MenuModel(order: 1, route: kOrderListRoute, title: "My Orders", icon: "ic-menu-my-order.svg"),
    MenuModel(order: 2, route: kMyAccountRoute, title: "My Account", icon: "ic-menu-my-account.svg"),
    MenuModel(order: 3, route: kApplicationRoute, title: "Applications", icon: "ic-menu-applications.svg"),
    MenuModel(order: 4, route: kDistributorsRoute, title: "Distributors", icon: "ic-menu-distributors.svg"),
    MenuModel(order: 5, route: kCertificatedRoute, title: "Certifications", icon: "ic-menu-certificate.svg"),
    MenuModel(order: 6, route: "product_quality", title: "Product Quality", icon: "ic-menu-product-quality.svg"),
    MenuModel(order: 7, route: "brochure", title: "Brochure", icon: "ic-menu-brochure.svg"),
    MenuModel(order: 8, route: kContactUsRoute, title: "Contact Us", icon: "ic-menu-contact-us.svg"),
    MenuModel(order: 9, route: "about_us", title: "About Us", icon: "ic-menu-about-us.svg"),

  ];
  
}

