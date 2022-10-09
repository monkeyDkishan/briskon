import 'package:briskon/utils.dart';
import 'package:briskon/view/common/app_button.dart';
import 'package:briskon/view/enquiry/components/add_enquiry_field.dart';
import 'package:briskon/view/enquiry/components/add_enquiry_location_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddEnquiryProductDetailsScreen extends StatefulWidget {
  const AddEnquiryProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AddEnquiryProductDetailsScreen> createState() => _AddEnquiryProductDetailsScreenState();
}

class _AddEnquiryProductDetailsScreenState extends State<AddEnquiryProductDetailsScreen> {
  List<String> products = [
    "8 mm",
    "10 mm",
    "12 mm",
    "16 mm",
    "20 mm",
    "25 mm",
  ];

  bool isTermsSelected = false;

  @override
  Widget build(BuildContext context) {
    Widget spacer = SizedBox(height: 12.sp);

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: const Text("Add Product Details"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              children: [
                ListView.builder(itemBuilder: (context, index) {

                  final product = products[index];

                  return Container(
                    margin: EdgeInsets.only(bottom: 12.sp),
                    child: AddEnquiryField(
                      hint: product,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(5),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                    ),
                  );

                },
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                ),

                AddEnquiryField(
                  hint: "Message",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(addressLimit),
                  ],
                  maxLines: 3,
                  keyboardType: TextInputType.streetAddress,
                ),

                spacer,

                AddEnquiryField(
                  hint: "Delivery Address",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(addressLimit),
                  ],
                  maxLines: 3,
                  keyboardType: TextInputType.streetAddress,
                ),

                spacer,

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                        value: isTermsSelected,
                        onChanged: (isSelected) {
                          setState(() {
                            isTermsSelected = isSelected == true;
                          });
                        }),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.sp),
                        child: Text(
                          "I’ve read the privacy policy and agree to the terms and conditions of privacy policy. ",
                          style: TextStyleConstant
                              .textStyleFont500FontSize12ColorBlackOP05,
                        ),
                      ),
                    ),
                  ],
                ),

                spacer,
                spacer,

                AppButton(
                  onTap: () {

                    showCupertinoDialog(context: context, builder: (context) {
                      return RegularPriceInput(
                        onSubmit: (price) {

                          Navigator.of(context).pushNamed(kConfirmOrderRoute ,arguments: price);

                        },
                      );
                    },);

                  },
                    title: "Submit"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegularPriceInput extends StatefulWidget {
  const RegularPriceInput({Key? key, required this.onSubmit}) : super(key: key);

  final Function(double) onSubmit;

  @override
  State<RegularPriceInput> createState() => _RegularPriceInputState();
}

class _RegularPriceInputState extends State<RegularPriceInput> {

  double value = 0.0;
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Regular Price",style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),),

              SizedBox(height: 10.sp),

              Text("Please Enter Price for 20mm",style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),),

              SizedBox(height: 10.sp),

              Container(
                padding: EdgeInsets.only(top: 5.sp,bottom: 5.sp),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.sp),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff8A959E).withOpacity(0.1),
                        offset: Offset(0,2.sp),
                        blurRadius: 40,
                      )
                    ]
                ),
                child: TextField(
                  onChanged: (text) {

                    if(text.isEmpty) {
                      value = 0.0;
                      setState(() {
                        error = "Please Enter Amount";
                      });
                      return;
                    }

                    final price = double.parse(text);

                    value = price;
                    setState(() {
                      error = null;
                    });
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.sp),
                    border: InputBorder.none,
                    hintText: "Price for 20mm",
                    hintStyle: TextStyleConstant.textStyleFont400FontSize12.copyWith(
                        color: Colors.black.withOpacity(0.4)
                    ),
                    errorText: error
                  ),
                ),
              ),

              SizedBox(height: 15.sp),

              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5.0,
                            ),]
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15.sp),

                        child: Center(
                          child: Text("Cancel",style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700
                          ),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.sp),
                  Expanded(child: AppButton(title: "Submit",onTap: () {

                    if(value == 0) {
                      setState(() {
                        error = "Please Enter Amount";
                      });
                      return;
                    }

                    widget.onSubmit(value);

                  }))
                ],
              ),

              SizedBox(height: 10.sp),

            ],
          ),
        ),
      ),
    );
  }
}
