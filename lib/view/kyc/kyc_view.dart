import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';

import '../common/app_button.dart';
import 'component/kyc_view_field.dart';

class KYCScreen extends StatelessWidget {
  const KYCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: Text("KYC"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0.sp),
          child: SafeArea(
            child: Column(
              children: [

                KYCField(hint: "Customer Name"),
                SizedBox(height: 12.sp),
                KYCField(hint: "GST Number"),
                SizedBox(height: 12.sp),
                Container(
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
                        child: Text("Upload GST Certificate", style: TextStyleConstant.textStyleFont400FontSize12.copyWith(
                            color: Colors.black.withOpacity(0.5)
                        ),),
                      ),
                      Icon(Icons.upload_file_rounded)
                    ],
                  ),
                ),
                SizedBox(height: 12.sp),
                KYCField(hint: "PAN Card Number"),
                SizedBox(height: 12.sp),
                Container(
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
                        child: Text("Upload PAN Card", style: TextStyleConstant.textStyleFont400FontSize12.copyWith(
                            color: Colors.black.withOpacity(0.5)
                        ),),
                      ),
                      Icon(Icons.upload_file_rounded)
                    ],
                  ),
                ),
                SizedBox(height: 12.sp),
                KYCField(hint: "Registered Office Address",maxLines: 3),

                SizedBox(height: 12.sp),
                KYCField(hint: "Bank Name"),
                SizedBox(height: 12.sp),
                KYCField(hint: "A/C Number"),
                SizedBox(height: 12.sp),
                KYCField(hint: "IFSC Code"),
                SizedBox(height: 12.sp),
                KYCField(hint: "Bank Address",maxLines: 3),

                SizedBox(height: 24.sp),
                AppButton (
                    onTap: () {

                    },
                    title: "Submit"),
                SizedBox(height: 12.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
