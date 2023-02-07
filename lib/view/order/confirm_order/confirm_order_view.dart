import 'package:briskon/provider/enquiry_provider.dart';
import 'package:briskon/view/common/app_button.dart';
import 'package:briskon/view/success/success_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils.dart';
import '../components/order_details_component.dart';
import '../components/order_key_value.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    });

  }

  @override
  Widget build(BuildContext context) {

    final enquiryProvider = context.watch<EnquiryProvider>();
    final leadReq = enquiryProvider.lead;
    final resCreateLead = enquiryProvider.resCreateLead;

    return Scaffold(
      backgroundColor: const Color(0xffF3F5F4),
      appBar: AppBar(
        title: const Text("Confirm Order"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.sp),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderDetailsComponent(
                title: "Shipment Details",
                child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Delivery", style: TextStyleConstant.textStyleFont400FontSize16),
                      SizedBox(height: 5.sp),
                      Text("${leadReq.deliveryAddress}", style: TextStyleConstant.textStyleFont500FontSize17),
                    ],
                  ),
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
                      OrderKeyValue(title: "Instructions", value: "${leadReq.note}"),
                      SizedBox(height: 6.sp),
                      OrderKeyValue(title: "Order Date", value: DateTime.now().toDDMMMYYYY),
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
                      children: List.generate(leadReq.leadProducts?.length ?? 0, (index) {

                        final products = leadReq.leadProducts?[index];

                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.sp),
                          child: OrderKeyValue(title: products?.productName ?? "", value: "${products?.quantity ?? 0} Tons"),
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
                          Expanded(child: Text("${leadReq.leadProducts?.map((e) => e.quantity).reduce((value, element) => (value ?? 0) + (element ?? 0))} Tons", style: TextStyleConstant.textStyleFont600FontSize18, textAlign: TextAlign.end,)),
                        ],
                      )
                  ),

                ],
              )),

              SizedBox(height: 15.sp),

              OrderDetailsComponent(title: "Order Summary", child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Row(
                    children: [
                      Expanded(child: Text("Default price of 20mm bar", style: TextStyleConstant.textStyleFont500FontSize16)),
                      Text("₹ ${leadReq.primaryProductPricePerTon ?? 0.0}".moneyFormatter, style: TextStyleConstant.textStyleFont600FontSize18, textAlign: TextAlign.end,),
                    ],
                  )
              )),

              SizedBox(height: 20.sp),

              AppButton(title: "Confirm",isLoading: resCreateLead.state == Status.loading, onTap: () {

                // set up the button
                Widget yesButton = TextButton(
                  child: const Text("YES"),
                  onPressed: () async {

                    try {
                      await enquiryProvider.createLead();

                      Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
                        return SuccessView(onFinish: () {
                          Navigator.of(context).popUntil((route) {
                            return route.settings.name == kHomeRoute || route.isFirst;
                          });
                        });
                      },fullscreenDialog: true,opaque: true));
                    } catch (e) {
                      Toaster.showMessage(context, msg: e.toString());
                    }

                  },
                );

                Widget noButton = TextButton(
                  child: const Text("NO"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                );

                // set up the AlertDialog
                AlertDialog alert = AlertDialog(
                  title: const Text("Confirm Order"),
                  content: const Text("Are you sure you want to confirm this order?"),
                  actions: [
                    noButton,
                    yesButton
                  ],
                );

                // show the dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },),

            ],
          ),
        ),
      ),
    );

  }
}
