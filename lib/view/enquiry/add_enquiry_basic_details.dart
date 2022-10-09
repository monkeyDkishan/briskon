import 'package:briskon/utils.dart';
import 'package:briskon/view/common/app_button.dart';
import 'package:briskon/view/enquiry/components/add_enquiry_field.dart';
import 'package:briskon/view/enquiry/components/add_enquiry_location_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddEnquiryBasicDetailsScreen extends StatelessWidget {
  const AddEnquiryBasicDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget spacer = SizedBox(height: 12.sp);

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: const Text("Enquiry"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              children: [

                AddEnquiryField(
                  hint: "First Name",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(nameLimit),
                  ],
                  keyboardType: TextInputType.name,
                ),
                spacer,
                AddEnquiryField(
                  hint: "Last Name",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(nameLimit),
                  ],
                  keyboardType: TextInputType.name,
                ),
                spacer,
                AddEnquiryField(
                  hint: "Mobile Number",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(mobileLimit),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.name,
                ),
                spacer,
                AddEnquiryField(
                  hint: "Email ID",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(nameLimit),
                  ],
                  keyboardType: TextInputType.emailAddress,
                ),
                spacer,
                AddEnquiryField(
                  hint: "Company Name",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(nameLimit),
                  ],
                  keyboardType: TextInputType.name,
                ),
                spacer,
                AddEnquiryField(
                  hint: "Designation",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(nameLimit),
                  ],
                  keyboardType: TextInputType.name,
                ),
                spacer,
                const AddEnquiryLocationPicker(),
                spacer,
                spacer,

                AppButton(
                  onTap: () {
                    Navigator.of(context).pushNamed(kAddOrderDetailsRoute);
                  },
                    title: "Next"),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
