
import 'package:flutter/material.dart';

import '../../../utils.dart';

class OrderKeyValue extends StatelessWidget {
  const OrderKeyValue({Key? key, required this.title, required this.value}) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title, style: TextStyleConstant.textStyleFont400FontSize16)),
        Expanded(child: Text(value, style: TextStyleConstant.textStyleFont500FontSize16, textAlign: TextAlign.end,)),
      ],
    );
  }
}