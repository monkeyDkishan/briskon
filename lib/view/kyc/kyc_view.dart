import 'package:briskon/model/kyc/res_get_kyc_details.dart';
import 'package:briskon/provider/auth_provider.dart';
import 'package:briskon/provider/kyc_provider.dart';
import 'package:briskon/utils.dart';
import 'package:briskon/view/common/loading_small.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/app_button.dart';
import 'component/kyc_view_field.dart';

class KYCScreen extends StatefulWidget {
  const KYCScreen({Key? key}) : super(key: key);

  @override
  State<KYCScreen> createState() => _KYCScreenState();
}

class _KYCScreenState extends State<KYCScreen> {

  late TextEditingController customerNameController;
  late TextEditingController gstNumberController;
  late TextEditingController panNumberController;
  late TextEditingController officeAddressController;
  late TextEditingController bankNameController;
  late TextEditingController accountNumberController;
  late TextEditingController ifscCodeController;
  late TextEditingController bankAddressController;

  late FocusNode customerNameNode;
  late FocusNode gstNumberNode;
  late FocusNode panNumberNode;
  late FocusNode officeAddressNode;
  late FocusNode bankNameNode;
  late FocusNode accountNumberNode;
  late FocusNode ifscCodeNode;
  late FocusNode bankAddressNode;


  final imagePicker = CustomImagePicker();

  String fileType = "gst";//gst,pan

  String? gstFile;
  String? panFile;

  String getFileName({String? file, String? hint}) {
    if(file == null) return hint ?? "Upload File";


    return file.split("/").last;

  }

  @override
  initState() {
    super.initState();

    customerNameController = TextEditingController();
    gstNumberController = TextEditingController();
    panNumberController = TextEditingController();
    officeAddressController = TextEditingController();
    bankNameController = TextEditingController();
    accountNumberController = TextEditingController();
    ifscCodeController = TextEditingController();
    bankAddressController = TextEditingController();

    customerNameNode = FocusNode();
    gstNumberNode = FocusNode();
    panNumberNode = FocusNode();
    officeAddressNode = FocusNode();
    bankNameNode = FocusNode();
    accountNumberNode = FocusNode();
    ifscCodeNode = FocusNode();
    bankAddressNode = FocusNode();

    imagePicker.onLoading = (isLoading) {

    };

    imagePicker.onError = (error) {

    };

    imagePicker.onFile = (imageFile) {
      setState(() {
        if(fileType == "gst") {
          gstFile = imageFile;
        } else {
          panFile = imageFile;
        }

      });
    };

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {

      final provider = context.read<KYCProvider>();
      await provider.getKycDetails();
      final data = provider.resGetKycDetails.response?.data;

      customerNameController.text = data?.customerName ?? "";
      gstNumberController.text = data?.gstNumber ?? "";
      gstFile = data?.gstFile ?? "";
      panNumberController.text = data?.panNumber ?? "";
      panFile = data?.panFile ?? "";
      officeAddressController.text = data?.officeAddress ?? "";
      bankNameController.text = data?.bankName ?? "";
      accountNumberController.text = data?.acNumber ?? "";
      ifscCodeController.text = data?.ifscCode ?? "";
      bankAddressController.text = data?.bankAddress ?? "";

    });

  }

  pickFile(String type) {
    fileType = type;
    imagePicker.selectImage(context);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    customerNameController.dispose();
    gstNumberController.dispose();
    panNumberController.dispose();
    officeAddressController.dispose();
    bankNameController.dispose();
    accountNumberController.dispose();
    ifscCodeController.dispose();
    bankAddressController.dispose();

    customerNameNode.dispose();
    gstNumberNode.dispose();
    panNumberNode.dispose();
    officeAddressNode.dispose();
    bankNameNode.dispose();
    accountNumberNode.dispose();
    ifscCodeNode.dispose();
    bankAddressNode.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    final kycProvider = context.watch<KYCProvider>();

    final res = kycProvider.resUpdateKYC;
    final resGetKycDetails = kycProvider.resGetKycDetails;

    final isLoading = resGetKycDetails.state == Status.loading;

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: Text("KYC"),
      ),
      body: isLoading ? const Center(child: LoadingSmall()) : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0.sp),
          child: SafeArea(
            child: Column(
              children: [

                KYCField(hint: "Customer Name",controller: customerNameController,focusNode: customerNameNode),
                SizedBox(height: 12.sp),
                KYCField(hint: "GST Number",controller: gstNumberController,focusNode: gstNumberNode),
                SizedBox(height: 12.sp),
                InkWell(
                  onTap: () {
                    pickFile("gst");
                  },
                  child: Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.sp),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff8A959E).withOpacity(0.1),
                            offset: Offset(0,2.sp),
                            blurRadius: 40,
                          )
                        ]
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(getFileName(hint: "Upload GST Certificate", file: gstFile), style: TextStyleConstant.textStyleFont400FontSize12.copyWith(
                              color: Colors.black.withOpacity(0.5)
                          ),),
                        ),
                        Icon(Icons.upload_file_rounded)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.sp),
                KYCField(hint: "PAN Card Number",controller: panNumberController,focusNode: panNumberNode),
                SizedBox(height: 12.sp),
                InkWell(
                  onTap: () {
                    pickFile("pan");
                  },
                  child: Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.sp),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff8A959E).withOpacity(0.1),
                            offset: Offset(0,2.sp),
                            blurRadius: 40,
                          )
                        ]
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(getFileName(hint: "Upload PAN Card", file: panFile) , style: TextStyleConstant.textStyleFont400FontSize12.copyWith(
                              color: Colors.black.withOpacity(0.5)
                          ),),
                        ),
                        Icon(Icons.upload_file_rounded)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.sp),
                KYCField(hint: "Registered Office Address",maxLines: 3,controller: officeAddressController,focusNode: officeAddressNode),

                SizedBox(height: 12.sp),
                KYCField(hint: "Bank Name",controller: bankNameController,focusNode: bankNameNode),
                SizedBox(height: 12.sp),
                KYCField(hint: "A/C Number",controller: accountNumberController,focusNode: accountNumberNode),
                SizedBox(height: 12.sp),
                KYCField(hint: "IFSC Code",controller: ifscCodeController,focusNode: ifscCodeNode),
                SizedBox(height: 12.sp),
                KYCField(hint: "Bank Address",maxLines: 3,controller: bankAddressController,focusNode: bankAddressNode),

                SizedBox(height: 24.sp),
                AppButton (
                    onTap: () async {

                      final authProvider = context.read<AuthProvider>();

                      try {
                        final data = KYCData();

                        data.customerName = customerNameController.text;
                        data.gstNumber = gstNumberController.text;
                        data.gstFile = gstFile;
                        data.panNumber = panNumberController.text;
                        data.panFile = panFile;
                        data.officeAddress = officeAddressController.text;
                        data.bankName = bankNameController.text;
                        data.acNumber = accountNumberController.text;
                        data.ifscCode = ifscCodeController.text;
                        data.bankAddress = bankAddressController.text;

                        await kycProvider.updateKYC(kyc: data);

                        authProvider.getUserDetailsById();

                        Toaster.showMessage(context, msg: "KYC Saved");
                        Navigator.of(context).pop();

                      } catch (e) {
                        Toaster.showMessage(context, msg: e.toString());
                      }


                    },
                    title: "Submit",isLoading: res.state == Status.loading),
                SizedBox(height: 12.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
