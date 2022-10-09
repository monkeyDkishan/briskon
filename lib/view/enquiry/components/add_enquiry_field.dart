import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddEnquiryField extends StatelessWidget {
  const AddEnquiryField({Key? key, required this.hint, this.inputFormatters, this.keyboardType, this.controller, this.maxLines}) : super(key: key);

  final String hint;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5.sp,bottom: 5.sp),
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
      child: TextField(
        maxLines: maxLines ?? 1,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15.sp),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyleConstant.textStyleFont400FontSize12.copyWith(
              color: Colors.black.withOpacity(0.4)
          ),
          labelText: maxLines == null ? hint : null,
          labelStyle: TextStyleConstant.textStyleFont400FontSize12.copyWith(
            color: const Color(0xff808080),
          ),
        ),
      ),
    );
  }
}
