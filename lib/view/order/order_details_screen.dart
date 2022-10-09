import 'dart:ffi';

import 'package:briskon/utils.dart';
import 'package:briskon/view/common/app_button.dart';
import 'package:flutter/material.dart';

import 'components/order_details_component.dart';
import 'components/order_key_value.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({Key? key}) : super(key: key);
  final List<String> products = [
    "8 mm",
    "10 mm",
    "12 mm",
    "16 mm",
    "20 mm",
    "25 mm",
  ];

  final List<int> productsValues = [
    10,
    25,
    40,
    14,
    20,
    18,
  ];

  final List<String> orderSummary = [
    "Sub Total",
    "Tax and Service Charges",
    "Delivery Charges"
  ];

  final List<int> orderSummaryValues = [
    100000,
    2000,
    10000
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffF3F5F4),
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color(0xffFFDFE0),
            padding: EdgeInsets.all(20.sp),
            child: Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                        text: "Order ",
                        style: TextStyleConstant.textStyleFont600FontSize19,
                      children: [
                        TextSpan(
                              text: "#6787949392",
                              style: TextStyleConstant
                                  .textStyleFont600FontSize19
                                  .copyWith(color: kPrimaryColor)),
                        ]
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 12.sp),
                  decoration: BoxDecoration(
                      color: kSuccessOrderColor,
                      borderRadius: BorderRadius.circular(15.sp)
                  ),
                  child: Text("Delivered", style: TextStyleConstant.textStyleFont500FontSize15.copyWith(color: Colors.white)),
                )
              ],
            ),
          ),

          Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.sp),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderDetailsComponent(
                    title: "Shipment Details",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Picked at 14 June, 2022 at 04:45 PM", style: TextStyleConstant.textStyleFont400FontSize16),
                              SizedBox(height: 5.sp),
                              Text("469 Woodridge Town, Winter Street NY", style: TextStyleConstant.textStyleFont500FontSize17),
                            ],
                          ),
                        ),
                        const Divider(thickness: 1.5,height: 1.5),
                        Padding(
                          padding: EdgeInsets.all(15.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Delivered at 14 June, 2022 at 05:55 PM", style: TextStyleConstant.textStyleFont400FontSize16),
                              SizedBox(height: 5.sp),
                              Text("345 Red Enclave, The Pentagon Circle NY", style: TextStyleConstant.textStyleFont500FontSize17),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

              SizedBox(height: 15.sp),

              OrderDetailsComponent(
                  title: "Order Details",
                  child: Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const OrderKeyValue(title: "Order No.", value: "#6787949392"),
                        SizedBox(height: 6.sp),
                        const OrderKeyValue(title: "Instructions", value: "Deliver Carefully"),
                        SizedBox(height: 6.sp),
                        const OrderKeyValue(title: "Order Date", value: "14 July, 2022"),
                        SizedBox(height: 6.sp),
                        const OrderKeyValue(title: "Order Time", value: "03:45 PM"),
                      ],
                    ),
                  ),
              ),

              SizedBox(height: 15.sp),

              OrderDetailsComponent(title: "Item Details", child: Column(
                  children: [

                    Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: Column(
                        children: List.generate(products.length, (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.sp),
                          child: OrderKeyValue(title: products[index], value: "${productsValues[index]} Tons"),
                        )),
                      ),
                    ),

                    Divider(thickness: 1.5,height: 1.5),

                    Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: Row(
                        children: [
                          Expanded(child: Text("Total Items", style: TextStyleConstant.textStyleFont500FontSize16)),
                          Expanded(child: Text("${productsValues.reduce((value, element) => value + element)} Tons", style: TextStyleConstant.textStyleFont600FontSize18, textAlign: TextAlign.end,)),
                        ],
                      )
                    ),

                  ],
              )),

              SizedBox(height: 15.sp),

              OrderDetailsComponent(title: "Order Summary", child: Column(
                  children: [

                    Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: Column(
                        children: List.generate(orderSummary.length, (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.sp),
                          child: OrderKeyValue(title: orderSummary[index], value: "₹ ${orderSummaryValues[index]}".moneyFormatter
                          ),
                        )),
                      ),
                    ),

                    const Divider(thickness: 1.5,height: 1.5),

                    Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: Row(
                          children: [
                            Expanded(child: Text("Order Total", style: TextStyleConstant.textStyleFont500FontSize16)),
                            Expanded(child: Text("₹ ${orderSummaryValues.reduce((value, element) => value + element)}".moneyFormatter, style: TextStyleConstant.textStyleFont600FontSize18, textAlign: TextAlign.end,)),
                          ],
                        )
                    ),

                  ],
              )),

              SizedBox(height: 20.sp),

              Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(3)
                ),
                padding: EdgeInsets.all(15.sp),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.orderInvoiceIcon(),
                    SizedBox(width: 10.sp),
                    Text("Download Invoice", style: TextStyleConstant.textStyleFont600FontSize16.copyWith(color: Colors.white),)
                  ],
                ),
              )

              ],
          ),
                ),
              ))
        ],
      ),
    );

  }
}

