import 'package:flutter/material.dart';

import '../../utils.dart';

class AuthBG extends StatelessWidget {
  const AuthBG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Assets.logoBg,
          Center(child: SizedBox(
            width: 40.w,
              child: Assets.briskonLogo))
        ],
      ),
    );
  }
}
