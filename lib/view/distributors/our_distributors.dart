import 'package:briskon/provider/documents_provider.dart';
import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OurDistributorsView extends StatefulWidget {
  const OurDistributorsView({Key? key}) : super(key: key);

  @override
  State<OurDistributorsView> createState() => _OurDistributorsViewState();
}

class _OurDistributorsViewState extends State<OurDistributorsView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      context.read<DocumentsProvider>().getDistributorList();

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Distributors"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [

              AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  padding: EdgeInsets.all(15.sp),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Assets.mapsImg,
                  ),
                ),
              ),

              ListView.builder(itemBuilder: (context, index) {

                return Container(
                  margin: EdgeInsets.all(15.sp),
                  padding: EdgeInsets.only(top: 5.sp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 7,
                            offset: Offset(0,2.5.sp),
                            spreadRadius: 2
                        )
                      ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(2.5.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 7,
                                    spreadRadius: 2,
                                    offset: const Offset(0,3)
                                  )
                                ]
                              ),
                              width: 20.w,
                              height: 20.w,
                              child: Assets.appLogoLight(),
                            ),
                            SizedBox(width: 10.sp),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Briskon TMT Bars Manufacturers",style: TextStyleConstant.textStyleFont600FontSize16),
                                  SizedBox(height: 5.sp),
                                  Text("713/2,712/2 harsol vavdi chokdi road, opp. Talco Extrusion LLP, Talod, Gujarat 383215",style: TextStyleConstant.textStyleFont400FontSize16)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 5.sp),

                      Row(
                        children: [
                          Expanded(child: Container(
                            color: kPrimaryColor,
                            padding: EdgeInsets.all(10.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Assets.phoneIcon(color: Colors.white),
                                SizedBox(width: 5.sp),
                                Flexible(child: Text("CALL",style: TextStyleConstant.textStyleFont500FontSize12.copyWith(color: Colors.white),))
                              ],
                            ),
                          )),
                          SizedBox(width: 2.5.sp),
                          Expanded(child: Container(
                            color: kPrimaryColor,
                            padding: EdgeInsets.all(10.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Assets.emailIcon(color: Colors.white),
                                SizedBox(width: 5.sp),
                                Flexible(child: Text("EMAIL",style: TextStyleConstant.textStyleFont500FontSize12.copyWith(color: Colors.white),))
                              ],
                            ),
                          )),
                          SizedBox(width: 2.5.sp),
                          Expanded(child: Container(
                            color: kPrimaryColor,
                            padding: EdgeInsets.all(10.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Assets.locationMarkIcon(color: Colors.white),
                                SizedBox(width: 5.sp),
                                Flexible(child: Text("AREA",style: TextStyleConstant.textStyleFont500FontSize12.copyWith(color: Colors.white),))
                              ],
                            ),
                          )),
                        ],
                      ),

                      // SizedBox(height: 10.sp)
                    ],
                  ),
                );

              }, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),itemCount: 1),

            ],
          ),
        ),
      ),
    );
  }
}
