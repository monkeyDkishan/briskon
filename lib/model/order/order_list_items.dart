import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';

class OrderListItem {
  final int order;
  final String text;
  final String icon;

  OrderListItem({required this.order, required this.text, required this.icon});

  Widget get svgIcon => SVGImage.getIconFrom(icon: "order/$icon");

  static List<OrderListItem> values = [
    OrderListItem(order: 0, text: "14 July, 2022", icon: "ic-order-calender.svg"),
    OrderListItem(order: 1, text: "3:45 PM", icon: "ic-order-clock.svg"),
    OrderListItem(order: 2, text: "1,11,200", icon: "ic-order-currency.svg"),
    OrderListItem(order: 3, text: "60 Tons", icon: "ic-order-ton.svg"),
  ];
  
}