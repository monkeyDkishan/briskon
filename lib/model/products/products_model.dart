import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';

class ProductsModel {
  final String name;
  final Image image;

  ProductsModel({required this.name, required this.image});


  static List<ProductsModel> products = [
    ProductsModel(name: "Fe-500", image: Assets.tmt500Img),
    ProductsModel(name: "Fe-550", image: Assets.tmt550Img),
    ProductsModel(name: "Fe-600", image: Assets.tmt600Img),
  ];
}
