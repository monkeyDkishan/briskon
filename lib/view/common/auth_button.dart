import 'package:flutter/material.dart';

import '../../utils.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key, this.onTap, required this.title}) : super(key: key);
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
            boxShadow: const [BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),]
        ),
        padding: EdgeInsets.symmetric(vertical: 15.sp,horizontal: 70.sp),

        child: Text(title,style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700
        ),),
      ),
    );
  }
}
