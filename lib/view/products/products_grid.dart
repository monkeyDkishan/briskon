import 'dart:async';

import 'package:briskon/model/products/products_model.dart';
import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';

class ProductsGrid extends StatelessWidget {
  ProductsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(15.sp),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15.sp,
              mainAxisSpacing: 15.sp,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            final product = ProductsModel.products[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: kSecondaryTitleColor,
            image: DecorationImage(image: product.image.image,fit: BoxFit.cover)
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.sp),bottomLeft: Radius.circular(15.sp)),
                color: Colors.black.withOpacity(0.5),
              ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.sp),
                  child: Text(
                product.name,
                textAlign: TextAlign.center,
                style: TextStyleConstant.textStyleFont600FontSize14
                    .copyWith(color: Colors.white),
              )),
            );
      },itemCount: ProductsModel.products.length),
    );
  }
}

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final product = ProductsModel.products.first;

  bool isISIShowing = false;

  bool isOtherShowing = false;

  bool isBriskonShowing = false;

  final categories = [
    "Mechanical Properties",
    "Proof Stress (Min)",
    "Tensile Strength (Min)",
    "UTS/YS Ratio (Min)",
    "Elongation (Min)",
    "Bend Test(Min)",
    "",
    "Chemical Composition (%)",
    "Carbon",
    "Sulphur",
    "Phosphorus",
    "S+ p",
    "Mn",
    "ci",
  ];

  final values = [
    "KORE 500 D",
    "575 N/mm",
    "650 N/mm",
    "1.12",
    "18%",
        "Up to 20mm-3D",
    "Above 20mm-40",
    "",
    "0.24% Max",
    "0.035 Max",
    "0.035 Max",
    "10.070 Max",
    "0 550 Min",
    "0 400 May",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(product.name,style: TextStyleConstant.textStyleFont500FontSize18,),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: product.image.image,fit: BoxFit.cover,)
                    ),height: 25.h),
                  Container(
                    height: 25.h,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.5),
                  )
                ],
              ),

              Column(
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        isISIShowing = !isISIShowing;
                      });
                    },
                    child: Container(
                      height: 50,
                      color: kLightGrayColor,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      child: Text("ISI Grade",style: TextStyleConstant.textStyleFont500FontSize15),
                    ),
                  ),
                  if(isISIShowing)
                  Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: Text("Technical Parameters",style: TextStyleConstant.textStyleFont500FontSize15.copyWith(color: Colors.black),)),
                            Flexible(child: Text("ISI GRade 500D",style: TextStyleConstant.textStyleFont500FontSize15.copyWith(color: Colors.black),textAlign: TextAlign.end,))
                          ],
                        ),
                        Column(
                          children: List.generate(categories.length, (index) {

                            return Column(
                              children: [
                                const Divider(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(child: Text(categories[index],style: TextStyleConstant.textStyleFont500FontSize15.copyWith(color: kLightGrayColor),)),
                                    Flexible(child: Text(values[index],style: TextStyleConstant.textStyleFont500FontSize15.copyWith(color: Colors.black),textAlign: TextAlign.end,))
                                  ],
                                ),
                                if(index == categories.length - 1)
                                  const Divider(),
                              ],
                            );

                          }),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              SizedBox(height: 10.sp),

              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isOtherShowing = !isOtherShowing;
                      });
                    },
                    child: Container(
                      height: 50,
                      color: kLightGrayColor,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      child: Text("Other Companies",style: TextStyleConstant.textStyleFont500FontSize15),
                    ),
                  ),
                  if(isOtherShowing)
                  Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: Text("Technical Parameters",style: TextStyleConstant.textStyleFont500FontSize15.copyWith(color: Colors.black),)),
                            Flexible(child: Text("ISI GRade 500D",style: TextStyleConstant.textStyleFont500FontSize15.copyWith(color: Colors.black),textAlign: TextAlign.end,))
                          ],
                        ),
                        Column(
                          children: List.generate(categories.length, (index) {

                            return Column(
                              children: [
                                const Divider(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(child: Text(categories[index],style: TextStyleConstant.textStyleFont500FontSize15.copyWith(color: kLightGrayColor),)),
                                    Flexible(child: Text(values[index],style: TextStyleConstant.textStyleFont500FontSize15.copyWith(color: Colors.black),textAlign: TextAlign.end,))
                                  ],
                                ),
                                if(index == categories.length - 1)
                                  const Divider(),
                              ],
                            );

                          }),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              SizedBox(height: 10.sp),

              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isBriskonShowing = !isBriskonShowing;
                      });
                    },
                    child: Container(
                      height: 50,
                      color: kLightGrayColor,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      child: Text("Briskon",style: TextStyleConstant.textStyleFont500FontSize15),
                    ),
                  ),
                  if(isBriskonShowing)
                  Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: Text("Technical Parameters",style: TextStyleConstant.textStyleFont500FontSize15.copyWith(color: Colors.black),)),
                            Flexible(child: Text("ISI GRade 500D",style: TextStyleConstant.textStyleFont500FontSize15.copyWith(color: Colors.black),textAlign: TextAlign.end,))
                          ],
                        ),
                        Column(
                          children: List.generate(categories.length, (index) {

                            return Column(
                              children: [
                                const Divider(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(child: Text(categories[index],style: TextStyleConstant.textStyleFont500FontSize15.copyWith(color: kLightGrayColor),)),
                                    Flexible(child: Text(values[index],style: TextStyleConstant.textStyleFont500FontSize15.copyWith(color: Colors.black),textAlign: TextAlign.end,))
                                  ],
                                ),
                                if(index == categories.length - 1)
                                  const Divider(),
                              ],
                            );

                          }),
                        ),
                      ],
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
