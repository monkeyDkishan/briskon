import 'package:briskon/utils.dart';
import 'package:briskon/view/common/app_button.dart';
import 'package:briskon/view/custom_popup_view.dart';
import 'package:briskon/view/enquiry/components/add_enquiry_field.dart';
import 'package:briskon/view/enquiry/components/add_enquiry_location_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';

class AddEnquiryBasicDetailsScreen extends StatefulWidget {
  const AddEnquiryBasicDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AddEnquiryBasicDetailsScreen> createState() => _AddEnquiryBasicDetailsScreenState();
}

class _AddEnquiryBasicDetailsScreenState extends State<AddEnquiryBasicDetailsScreen> {
  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _mobile;
  late TextEditingController _email;
  late TextEditingController _companyName;
  late TextEditingController _designation;
  String state = "";
  String city = "";

  @override
  void initState() {
    // TODO: implement initState

    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _mobile = TextEditingController();
    _email = TextEditingController();
    _companyName = TextEditingController();
    _designation = TextEditingController();

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      final userData = context.read<AuthProvider>().resGetUserDetailsById.response?.data;
      final member = userData?.member;

      _firstName.text = member?.firstName ?? "";
      _lastName.text = member?.lastName ?? "";
      _mobile.text = member?.phone ?? "";
      _email.text = member?.email ?? "";
      _companyName.text = userData?.companyName ?? "";
      _designation.text = userData?.designation ?? "";
      setState(() {
        city = userData?.address?.city ?? "";
        state = userData?.address?.state ?? "";
      });
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _firstName.dispose();
    _lastName.dispose();
    _mobile.dispose();
    _email.dispose();
    _companyName.dispose();
    _designation.dispose();
    super.dispose();
  }

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
                  controller: _firstName,
                  readyOnly: true,
                ),
                spacer,
                AddEnquiryField(
                  hint: "Last Name",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(nameLimit),
                  ],
                  keyboardType: TextInputType.name,
                  controller: _lastName,
                  readyOnly: true,
                ),
                spacer,
                AddEnquiryField(
                  hint: "Mobile Number",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(mobileLimit),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.name,
                  controller: _mobile,
                  readyOnly: true,
                ),
                spacer,
                AddEnquiryField(
                  hint: "Email ID",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(nameLimit),
                  ],
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  readyOnly: true,
                ),
                spacer,
                AddEnquiryField(
                  hint: "Company Name",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(nameLimit),
                  ],
                  keyboardType: TextInputType.name,
                  controller: _companyName,
                  readyOnly: true,
                ),
                spacer,
                AddEnquiryField(
                  hint: "Designation",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(nameLimit),
                  ],
                  keyboardType: TextInputType.name,
                  controller: _designation,
                  readyOnly: true,
                ),
                spacer,
                AddEnquiryLocationPicker(
                  onCity: (city) {
                    this.city = city;
                  },
                  onState: (state) {
                    this.state = state;
                  },
                  selectedCity: city,
                  selectedState: state,
                ),
                spacer,
                spacer,

                AppButton(
                  onTap: () {

                    final authProvider = context.read<AuthProvider>();

                    final user = authProvider.resGetUserDetailsById.response?.data;

                    if(user?.kycId == null) {

                      CustomPopup(context, title: "KYC", message: "You will have to add KYC to order enquiry.", primaryBtnTxt: "OK",secondaryBtnTxt: "NO",primaryAction: (){
                        Navigator.of(context).pushNamed(kKYCRoute);
                      });

                    } else {
                      Navigator.of(context).pushNamed(kAddOrderDetailsRoute);
                    }


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
