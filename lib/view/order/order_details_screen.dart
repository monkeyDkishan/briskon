import 'dart:ffi';

import 'package:briskon/provider/enquiry_provider.dart';
import 'package:briskon/utils.dart';
import 'package:briskon/view/common/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';

import 'components/order_details_component.dart';
import 'components/order_key_value.dart';

class OrderDetailsScreen extends StatefulWidget {
  OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {

  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      final orderId = ModalRoute.of(context)?.settings.arguments as int?;

      if(orderId != null) {

        context.read<EnquiryProvider>().getLeadDetailByLeadId(leadId: orderId);

      }

    });

  }

  @override
  Widget build(BuildContext context) {

    final enquiryProvider = context.watch<EnquiryProvider>();

    final res = enquiryProvider.resGetLeadDetailByLeadId;

    final data = res.response?.data;

    final isProductsAvailable = (data?.product?.length ?? 0) == 0;

    return Scaffold(
      backgroundColor: const Color(0xffF3F5F4),
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: ResultBuilder(result: res, child: Column(
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
                              text: "#${data?.orderCode ?? ""}",
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
                  child: Text(data?.status?.name ?? "", style: TextStyleConstant.textStyleFont500FontSize15.copyWith(color: Colors.white)),
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
                                  // Text("Picked at 14 June, 2022 at 04:45 PM", style: TextStyleConstant.textStyleFont400FontSize16),
                                  // SizedBox(height: 5.sp),
                                  Text(data?.deliveryAddress ?? "", style: TextStyleConstant.textStyleFont500FontSize17),
                                ],
                              ),
                            ),
                            if(false)
                            const Divider(thickness: 1.5,height: 1.5),
                            if(false)
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

                      if(!isProductsAvailable)
                      OrderDetailsComponent(
                        title: "Order Details",
                        child: Padding(
                          padding: EdgeInsets.all(15.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OrderKeyValue(title: "Order No.", value: "#${data?.orderCode ?? ""}"),
                              SizedBox(height: 6.sp),
                              OrderKeyValue(title: "Instructions", value: data?.note ?? ""),
                              SizedBox(height: 6.sp),
                              OrderKeyValue(title: "Order Date", value: data?.orderDate?.toDDMMMYYYY ?? ""),
                              // SizedBox(height: 6.sp),
                              // const OrderKeyValue(title: "Order Time", value: "03:45 PM"),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 15.sp),

                      if(!isProductsAvailable)
                      OrderDetailsComponent(title: "Item Details", child: Column(
                        children: [

                          Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: Column(
                              children: List.generate(data?.product?.length ?? 0, (index) {
                                final products = data?.product?[index];
                                return Padding(
                                padding: EdgeInsets.symmetric(vertical: 3.sp),
                                child: OrderKeyValue(title: "${products?.value ?? ""} Tons", value: "${products?.qty} Tons"),
                              );
                              }),
                            ),
                          ),

                          Divider(thickness: 1.5,height: 1.5),

                          Padding(
                              padding: EdgeInsets.all(15.sp),
                              child: Row(
                                children: [
                                  Expanded(child: Text("Total Items", style: TextStyleConstant.textStyleFont500FontSize16)),
                                  Expanded(child: Text("${((data?.product?.map((e) => int.tryParse(e.qty ?? "") ?? 0)) ?? [0]).reduce((value, element) => value + element)} Tons", style: TextStyleConstant.textStyleFont600FontSize18, textAlign: TextAlign.end,)),
                                ],
                              )
                          ),

                        ],
                      )),

                      SizedBox(height: 15.sp),

                      if(!isProductsAvailable)
                      OrderDetailsComponent(title: "Order Summary", child: Column(
                        children: [

                          Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: Column(
                              children: List.generate(data?.product?.length ?? 0, (index) {
                                final product = data?.product?[index];
                                return Padding(
                                padding: EdgeInsets.symmetric(vertical: 3.sp),
                                child: OrderKeyValue(title: "${product?.value ?? ""} Tons", value: "₹ ${product?.price ?? ""}".moneyFormatter
                                ),
                              );
                              }),
                            ),
                          ),

                          const Divider(thickness: 1.5,height: 1.5),

                          Padding(
                              padding: EdgeInsets.all(15.sp),
                              child: Row(
                                children: [
                                  Expanded(child: Text("Order Total", style: TextStyleConstant.textStyleFont500FontSize16)),
                                  Expanded(child: Text("₹ ${(data?.product?.map((e) => double.tryParse(e.price ?? "") ?? 0.0) ?? []).reduce((value, element) => value + element)}".moneyFormatter, style: TextStyleConstant.textStyleFont600FontSize18, textAlign: TextAlign.end,)),
                                ],
                              )
                          ),

                        ],
                      )),

                      SizedBox(height: 20.sp),

                      if(false)
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
      )) ,
    );

  }
}

