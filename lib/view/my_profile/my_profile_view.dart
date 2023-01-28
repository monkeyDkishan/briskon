import 'dart:io';

import 'package:briskon/model/user/req_update_user.dart';
import 'package:briskon/provider/auth_provider.dart';
import 'package:briskon/utils.dart';
import 'package:briskon/view/common/loading_small.dart';
import 'package:briskon/view/my_profile/component/my_profile_field.dart';
import 'package:briskon/view/my_profile/component/my_profile_location_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../common/app_button.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {

  late CustomImagePicker imagePicker;

  bool isImageLoading = false;
  String? imagePath;

  bool isEditing = false;

  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _emailName;
  late final TextEditingController _mobileName;
  late final TextEditingController _companyName;
  late final TextEditingController _designationName;
  late final TextEditingController _address1;
  late final TextEditingController _address2;
  late final TextEditingController _postalCode;

  String city = "Gujarat";
  String state = "Ahmedabad";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _emailName = TextEditingController();
    _mobileName = TextEditingController();
    _companyName = TextEditingController();
    _designationName = TextEditingController();
    _address1 = TextEditingController();
    _address2 = TextEditingController();
    _postalCode = TextEditingController();

    imagePicker = CustomImagePicker();

    imagePicker.onLoading = (isLoading) {
      setState(() {
        isImageLoading = isLoading;
      });
    };

    imagePicker.onError = (error){
      Toaster.showMessage(context, msg: error);
    };

    imagePicker.onFile = (imagePath) {
      setState(() {
        this.imagePath = imagePath;
      });
    };

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final userData = context.read<AuthProvider>().resGetUserDetailsById.response?.data;
      final member = userData?.member;
      final address = userData?.address;

      _firstName.text = member?.firstName ?? "";
      _lastName.text = member?.lastName ?? "";
      _emailName.text = member?.email ?? "";
      _mobileName.text = member?.phone ?? "";
      _companyName.text = userData?.companyName ?? "";
      _designationName.text = userData?.designation ?? "";
      _address1.text = address?.addressLine1 ?? "";
      _address2.text = address?.addressLine2 ?? "";
      _postalCode.text = address?.postalCode ?? "";

    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _firstName.dispose();
    _lastName.dispose();
    _emailName.dispose();
    _mobileName.dispose();
    _companyName.dispose();
    _designationName.dispose();
    _address1.dispose();
    _address2.dispose();
    _postalCode.dispose();
    super.dispose();
  }

  Widget profileImage() {

    final userData = context.watch<AuthProvider>().resGetUserDetailsById.response?.data?.member;

    final isProfilePic = userData?.profilePic != null;

    return InkWell(
      onTap: () {
        if(!isEditing) return;
        imagePicker.bottom(context);
      },
      child: Center(
        child: SizedBox(
          height: 30.w,
          width: 30.w,
          child: Stack(
            alignment: Alignment.center,
            children: [

              if(imagePath == null && !isProfilePic)
                Container(
                  height: 30.w,
                  width: 30.w,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: isImageLoading ? const LoadingSmall(color: Colors.white) : Icon(Icons.photo_library_rounded,size: 15.w,color: Colors.white,),
                ),

              if(imagePath != null || isProfilePic)
                Container(
                  height: 30.w,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    border: Border.all(color: kPrimaryColor)
                  ),
                  padding: const EdgeInsets.all(1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.w),
                    child: imagePath == null ? Image.network(userData?.imageUrl ?? "", fit: BoxFit.cover,) : Image.file(File(imagePath!),fit: BoxFit.cover),
                  ),
                ),

              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 35.sp,
                  width: 35.sp,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle
                  ),
                  padding: EdgeInsets.all(8.sp),
                  child: Assets.cameraIcon(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final authProvider = context.watch<AuthProvider>();
    final res = authProvider.resUpdateUserDetailsById;

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: const Text("My Profile"),
        actions: [
          InkWell(
            onTap: (){
              setState(() {
                isEditing = !isEditing;
              });
            },
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: isEditing ? const Icon(Icons.close) : Assets.editIcon(),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                profileImage(),

                SizedBox(height: 20.sp),

                MyProfileField(hint: "First Name",readOnly: !isEditing,controller: _firstName,inputFormatters: [
                  LengthLimitingTextInputFormatter(nameLimit),
                ],),

                SizedBox(height: 10.sp),

                MyProfileField(hint: "Last Name",readOnly: !isEditing,inputFormatters: [
                  LengthLimitingTextInputFormatter(nameLimit),
                ],controller: _lastName),

                SizedBox(height: 10.sp),

                MyProfileField(hint: "Mobile Number",readOnly: true,inputFormatters: [
                  LengthLimitingTextInputFormatter(nameLimit),
                ],controller: _mobileName),

                SizedBox(height: 10.sp),

                MyProfileField(hint: "Email ID",readOnly: !isEditing,inputFormatters: [
                  LengthLimitingTextInputFormatter(nameLimit),
                ],controller: _emailName),

                SizedBox(height: 10.sp),

                MyProfileField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(nameLimit),
                    ],
                    keyboardType: TextInputType.name,
                    hint: "Company Name",controller: _companyName,readOnly: !isEditing),

                SizedBox(height: 10.sp),

                MyProfileField(hint: "Designation",readOnly: !isEditing,inputFormatters: [
                  LengthLimitingTextInputFormatter(nameLimit),
                ],controller: _designationName),

                SizedBox(height: 10.sp),
                MyProfileField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(addressLimit),
                    ],
                    keyboardType: TextInputType.streetAddress,
                    hint: "Address Line 1", controller: _address1,readOnly: !isEditing),
                SizedBox(height: 10.sp),
                MyProfileField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(addressLimit),
                    ],
                    keyboardType: TextInputType.streetAddress,
                    hint: "Address Line 2", controller: _address2,readOnly: !isEditing),
                SizedBox(height: 10.sp),
                MyProfileField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(addressLimit),
                    ],
                    keyboardType: TextInputType.text,
                    hint: "PostalCode", controller: _postalCode,readOnly: !isEditing),
                SizedBox(height: 10.sp),

                MyProfileLocationPicker(isReadOnly: !isEditing,onCity: (city) {
                  this.city = city;
                },onState: (state) {
                  this.state = state;
                },),

                SizedBox(height: 20.sp),

                if(isEditing)
                 AppButton(title: "Save", onTap: () async {

                   try {
                     final req = ReqUpdateUser(
                              firstName: _firstName.text,
                              lastName: _lastName.text,
                              email: _emailName.text,
                              companyName: _companyName.text,
                              designation: _designationName.text,
                              city: city,
                              state: state,
                              addressLine1: _address1.text,
                              addressLine2: _address2.text,
                              country: "India",
                              postalCode: _postalCode.text,
                              profilePic: imagePath);

                          await authProvider.updateUserDetailsById(req: req);

                          Toaster.showMessage(context, msg: "Profile Saved");

                          setState(() {
                            isEditing = false;
                          });

                   } catch (e) {
                     Toaster.showMessage(context, msg: e.toString());
                   }
                 }, isLoading: res.state == Status.loading),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
