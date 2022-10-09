import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {Key? key,
      required this.prefix,
      required this.hint,
      this.inputFormatters,
      this.keyboardType,
      this.controller,
      this.maxLines,
        this.obscureText
      })
      : super(key: key);

  final Widget prefix;
  final String hint;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? maxLines;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        obscureText: obscureText ?? false,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        controller: controller,
        maxLines: obscureText == true ? 1 : maxLines,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.sp),
            prefixIcon: SizedBox(child: Center(child: prefix), width: 3.w),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xffE5E5E5))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xffE5E5E5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xffA1A1A1))),
            filled: true,
            fillColor: const Color(0xffFAFAFA),
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xffAFAFAF))),
      ),
    );
  }
}
