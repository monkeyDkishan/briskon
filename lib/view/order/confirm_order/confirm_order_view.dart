import 'package:briskon/view/success/success_view.dart';
import 'package:flutter/material.dart';

import '../../../utils.dart';
import '../components/order_details_component.dart';
import '../components/order_key_value.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {

  double? defaultPriceFor20mm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final value = ModalRoute.of(context)!.settings.arguments as double;

      setState(() {
        defaultPriceFor20mm = value;
      });
    });

  }

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

  @override
  Widget build(BuildContext context) {

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
                      Text("345 Red Enclave, The Pentagon Circle NY", style: TextStyleConstant.textStyleFont500FontSize17),
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
                      const OrderKeyValue(title: "Instructions", value: "Deliver Carefully"),
                      SizedBox(height: 6.sp),
                      const OrderKeyValue(title: "Order Date", value: "14 July, 2022"),
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

              OrderDetailsComponent(title: "Order Summary", child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Row(
                    children: [
                      Expanded(child: Text("Default price of 20mm bar", style: TextStyleConstant.textStyleFont500FontSize16)),
                      Text("₹ ${defaultPriceFor20mm ?? 0.0}".moneyFormatter, style: TextStyleConstant.textStyleFont600FontSize18, textAlign: TextAlign.end,),
                    ],
                  )
              )),

              SizedBox(height: 20.sp),

              InkWell(
                onTap: () {

                  // set up the button
                  Widget yesButton = TextButton(
                    child: const Text("YES"),
                    onPressed: () {

                      Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
                        return SuccessView(onFinish: () {
                          Navigator.of(context).popUntil((route) {
                            return route.settings.name == kHomeRoute;
                          });
                        });
                      },fullscreenDialog: true,opaque: true));

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

                },
                child: Container(
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(3)
                  ),
                  padding: EdgeInsets.all(15.sp),
                  alignment: Alignment.center,
                  child: Text("Confirm", style: TextStyleConstant.textStyleFont600FontSize16.copyWith(color: Colors.white),),
                ),
              )

            ],
          ),
        ),
      ),
    );

  }
}
