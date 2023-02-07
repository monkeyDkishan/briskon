import 'package:briskon/model/order/req_create_lead.dart';
import 'package:briskon/provider/enquiry_provider.dart';
import 'package:briskon/utils.dart';
import 'package:briskon/view/common/app_button.dart';
import 'package:briskon/view/common/loading_small.dart';
import 'package:briskon/view/enquiry/components/add_enquiry_field.dart';
import 'package:briskon/view/enquiry/components/add_enquiry_location_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddEnquiryProductDetailsScreen extends StatefulWidget {
  const AddEnquiryProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AddEnquiryProductDetailsScreen> createState() =>
      _AddEnquiryProductDetailsScreenState();
}

class _AddEnquiryProductDetailsScreenState
    extends State<AddEnquiryProductDetailsScreen> {
  bool isTermsSelected = false;

  late TextEditingController addressController;
  late TextEditingController messageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    addressController = TextEditingController();
    messageController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<EnquiryProvider>().productList();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    addressController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget spacer = SizedBox(height: 12.sp);

    final enquiryProvider = context.watch<EnquiryProvider>();

    final productList =
        enquiryProvider.resGetProductList.response?.data?.list ?? [];

    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
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
                    ListView.builder(
                      itemBuilder: (context, index) {
                        final product = productList[index];

                        return Container(
                          margin: EdgeInsets.only(bottom: 12.sp),
                          child: AddEnquiryField(
                            hint: product.productName,
                            onChanged: (value) {
                              productList[index].amount = value;
                            },
                            inForProduct: true,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(5),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.number,
                          ),
                        );
                      },
                      itemCount: productList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                    ),
                    AddEnquiryField(
                      controller: messageController,
                      hint: "Message",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(addressLimit),
                      ],
                      maxLines: 3,
                      keyboardType: TextInputType.text,
                    ),
                    spacer,
                    AddEnquiryField(
                      controller: addressController,
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
                          try {

                            if(!isTermsSelected) {
                              throw "Please accept terms and conditions.";
                            }


                            final isAmountEntered = productList.map((e) => e.amount).where((element) => element.isNotEmpty).isNotEmpty;


                            if (isAmountEntered == false) {
                              throw "Please Enter quantity for at least one product.";
                            }

                            final product = enquiryProvider
                                .resGetProductList.response?.data;

                            final productName =
                                product?.primaryProduct?.productName;

                            showCupertinoDialog(
                              context: context,
                              builder: (context) {
                                return RegularPriceInput(
                                  title: "Please Enter Price for $productName",
                                  onSubmit: (price) {

                                    final req = context.read<EnquiryProvider>().lead;

                                    req.primaryProductPricePerTon = price;

                                    req.leadProducts = [];

                                    for (var product in productList) {

                                      if(product.amount.isNotEmpty) {

                                        final qty = int.tryParse(product.amount);

                                        final leadProduct = LeadProduct(productId: product.id, quantity: qty);

                                        leadProduct.productName = product.productName;

                                        req.leadProducts?.add(leadProduct);

                                      }

                                    }

                                    req.billingAddress = addressController.text;
                                    req.deliveryAddress = addressController.text;
                                    req.note = messageController.text;

                                    Navigator.of(context).pop();

                                    Navigator.of(context).pushNamed(kConfirmOrderRoute);
                                  },
                                );
                              },
                            );
                          } catch (e) {
                            Toaster.showMessage(context, msg: e.toString());
                          }
                        },
                        title: "Submit"),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (enquiryProvider.resGetProductList.state == Status.loading)
          Container(
            color: Colors.black.withOpacity(0.2),
            child: LoadingSmall(color: Colors.white),
          )
      ],
    );
  }
}

class RegularPriceInput extends StatefulWidget {
  const RegularPriceInput(
      {Key? key, required this.onSubmit, required this.title})
      : super(key: key);

  final String title;
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
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Regular Price",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 10.sp),
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 10.sp),
              Container(
                padding: EdgeInsets.only(top: 5.sp, bottom: 5.sp),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.sp),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff8A959E).withOpacity(0.1),
                        offset: Offset(0, 2.sp),
                        blurRadius: 40,
                      )
                    ]),
                child: TextField(
                  onChanged: (text) {
                    if (text.isEmpty) {
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
                      hintText: "Price",
                      hintStyle: TextStyleConstant.textStyleFont400FontSize12
                          .copyWith(color: Colors.black.withOpacity(0.4)),
                      errorText: error),
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
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5.0,
                              ),
                            ]),
                        padding: EdgeInsets.symmetric(vertical: 15.sp),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.sp),
                  Expanded(
                      child: AppButton(
                          title: "Submit",
                          onTap: () {
                            if (value == 0) {
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
