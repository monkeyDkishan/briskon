import 'package:flutter/material.dart';

import '../../utils.dart';

class LoadingSmall extends StatelessWidget {
  const LoadingSmall({Key? key, this.color, this.size}) : super(key: key);

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 1,
      child: SizedBox(
        height: size ?? 22,
        width: size ?? 22,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? kPrimaryColor),
        ),
      ),
    );
  }
}

class LoadingWithWhiteBG extends StatelessWidget {
  const LoadingWithWhiteBG({Key? key, this.color, this.size}) : super(key: key);

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15.sp),
        decoration:  BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0,2),
                blurRadius: 7,
                spreadRadius: 2,
              )
            ]
        ),
        child: LoadingSmall(color: kPrimaryColor,size: size));
  }
}

class LoadingWithOpacityBG extends StatelessWidget {
  const LoadingWithOpacityBG({Key? key, this.opacity}) : super(key: key);

  final double? opacity;

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.black.withOpacity(opacity ?? 0.5),
        child: const Center(child: LoadingWithWhiteBG()));
  }
}