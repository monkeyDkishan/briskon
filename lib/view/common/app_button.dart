import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils.dart';

class AppButton extends StatelessWidget {
  const AppButton({Key? key, this.onTap, required this.title}) : super(key: key);
  final GestureTapCallback? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5.0,
            ),]
        ),
        padding: EdgeInsets.symmetric(vertical: 15.sp),

        child: Center(
          child: Text(title,style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700
          ),),
        ),
      ),
    );
  }
}
