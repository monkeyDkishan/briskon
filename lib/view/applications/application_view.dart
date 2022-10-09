import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';

class ApplicationView extends StatelessWidget {
  ApplicationView({Key? key}) : super(key: key);

  final images = [
    "applications_dummy_0.jpg",
    "applications_dummy_1.jpg",
    "applications_dummy_2.jpg",
  ];

  final names = [
    "Concrete reinforcement structure",
    "High-rise building",
    "Warehouses",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Applications"),),
      body: ListView.builder(itemBuilder: (context, index) {

        return AspectRatio(
          aspectRatio: 1.5,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset("assets/images/${images[index]}",fit: BoxFit.cover),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0),
                        // Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.5)
                          ])
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 10.sp),
                    child: Text(names[index],style: TextStyleConstant.textStyleFont500FontSize15,),
                  ))
            ],
          ),
        );

      },itemCount: images.length,),
    );
  }
}
