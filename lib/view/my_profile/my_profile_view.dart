import 'package:briskon/utils.dart';
import 'package:briskon/view/my_profile/component/my_profile_field.dart';
import 'package:briskon/view/my_profile/component/my_profile_location_picker.dart';
import 'package:flutter/material.dart';

import '../common/app_button.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: Text("My Profile"),
        actions: [
          InkWell(
            onTap: (){},
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Assets.editIcon(),
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
                Center(
                  child: SizedBox(
                    height: 30.w,
                    width: 30.w,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                            height: 30.w,
                            width: 30.w,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          child: Icon(Icons.photo_library_rounded,size: 15.w,color: Colors.white,),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 30.sp,
                            width: 30.sp,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              shape: BoxShape.circle
                            ),
                            padding: EdgeInsets.all(7.sp),
                            child: Assets.cameraIcon(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20.sp),

                MyProfileField(hint: "Name"),

                SizedBox(height: 10.sp),

                MyProfileField(hint: "Mobile Number"),

                SizedBox(height: 10.sp),

                MyProfileField(hint: "Email ID"),

                SizedBox(height: 10.sp),

                MyProfileField(hint: "Designation"),

                SizedBox(height: 10.sp),

                MyProfileLocationPicker(),

                SizedBox(height: 20.sp),

                const AppButton(title: "Save"),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
