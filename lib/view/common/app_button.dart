import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils.dart';

class AppButton extends StatelessWidget {
  const AppButton({Key? key, this.onTap, required this.title, this.isLoading}) : super(key: key);
  final GestureTapCallback? onTap;
  final String title;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading == true ? null : onTap,
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

        child: isLoading == true ? const Center(
          child: SizedBox(
            height: 22,
            width: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ) : Center(
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
