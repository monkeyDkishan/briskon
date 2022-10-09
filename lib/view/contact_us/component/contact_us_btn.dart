import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactUsButton extends StatelessWidget {
  const ContactUsButton({Key? key, required this.text, this.icon}) : super(key: key);

  final String text;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      // padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 5.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(icon != null)
            SizedBox(child: icon!,height: 20.sp,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Text(text,style: TextStyleConstant.textStyleFont500FontSize15.copyWith(color: Colors.black),),
            ),
          ),
        ],
      ),
    );
  }
}
