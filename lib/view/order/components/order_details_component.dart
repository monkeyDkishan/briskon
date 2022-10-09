import 'package:flutter/material.dart';

import '../../../utils.dart';

class OrderDetailsComponent extends StatelessWidget {
  const OrderDetailsComponent({Key? key, required this.title, required this.child}) : super(key: key);

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyleConstant.textStyleFont600FontSize19.copyWith(color: const Color(0xff444444)),),
        SizedBox(height: 10.sp),

        Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: child
        )

      ],
    );
  }
}