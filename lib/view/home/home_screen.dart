import 'package:briskon/provider/auth_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:briskon/utils.dart';
import 'package:briskon/model/home/menu_model.dart';
import 'package:provider/provider.dart';

import '../pdf_view/pdf_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int bannerIndex = 0;

  final List<int> bannerIndexName = [0,1,2,3];

  int selectedMenu = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AuthProvider>().getUserDetailsById();
    });

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: SizedBox(
          width: 98.sp,
            height: 36.sp,
            child: Assets.briskonLogo),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20.sp),

              CarouselSlider.builder(
                itemCount: bannerIndexName.length,
                itemBuilder: (context, index, realIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                      child: Image.asset("assets/images/banner-$index.png",fit: BoxFit.cover,));
                },
                options: CarouselOptions(height: 170.sp, viewportFraction: 0.9,autoPlay: true),
              ),

              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
                shrinkWrap: true,
                itemCount: MenuModel.menus.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 6.sp,
                  mainAxisSpacing: 6.sp,
                  crossAxisCount: SizerUtil.gridCount,
                  childAspectRatio: 181/140
                ),
                itemBuilder: (context, index) {

                  final menu = MenuModel.menus.firstWhere((element) => element.order == index);

                  final isSelected = selectedMenu == menu.order;

                  return InkWell(
                    splashColor: kPrimaryColor,
                    onTap: () {

                      if(menu.route == "product_quality") {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PDFViewer(asset: "assets/files/briskon_quality.pdf", title: "Product Quality"),));
                        return;
                      } else if(menu.route == "brochure") {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PDFViewer(asset: "assets/files/briskon_quality.pdf", title: "Brochure"),));
                        return;
                      } else if(menu.route == "about_us") {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PDFViewer(asset: "assets/files/briskon_brochure.pdf", title: "About Us"),));
                        return;
                      }

                      if([kAddEnquiryRoute,kOrderListRoute].contains(menu.route)) {
                        final auth = context.read<AuthProvider>();
                        if(!auth.isLogin) {
                          if(auth.isGuest) {
                            Toaster.showMessage(context, msg: "Please Login to access this part of the section");
                            Navigator.of(context).pushNamed(kLoginRoute,arguments: {
                              "is_from_guest" : true
                            });
                            return;
                          }
                        }
                      }

                      Navigator.of(context).pushNamed(menu.route);
                    },
                    onTapDown: (details) {
                      setState(() {
                        selectedMenu = menu.order;
                      });
                    },
                    onTapUp: (details) {
                      // setState(() {
                      //   selectedMenu = -1;
                      // });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? kPrimaryColor : Colors.white,
                        border: Border.all(color: kFontGrayColor.withOpacity(0.25)),
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: [
                          if(isSelected)
                          BoxShadow(
                            color: kPrimaryColor.withOpacity(0.5),
                            blurRadius: 15,
                            spreadRadius: 1
                          )
                        ]
                      ),
                      child: Stack(
                        children: [

                          if(isSelected)
                          Padding(
                            padding: EdgeInsets.only(top: 15.sp,right: 20.sp),
                            child: Image.asset(
                                "assets/images/img-menu-grid-steel-bar.png",
                                fit: BoxFit.contain,
                              colorBlendMode: BlendMode.darken,
                              color: kPrimaryColor,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    width: 64.sp,
                                    height: 64.sp,
                                    child: menu.svgIcon(isSelected),
                                  ),
                                ),
                                const Spacer(),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(menu.title,
                                        style: TextStyleConstant
                                            .textStyleFont400FontSize16
                                            .copyWith(
                                          color: isSelected ? Colors.white : kFontGrayColor,
                                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                          fontSize: isSelected ? 18.sp : 16.sp,
                                        )))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );

    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: SafeArea(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: [
    //           SizedBox(height: 10.w),
    //
    //           //MARK :- App logo
    //           SizedBox(
    //               height: 10.w,
    //               child: Assets.briskonLogo),
    //
    //           //MARK :- Banners
    //           SizedBox(
    //             height: 50.w,
    //             child: Column(
    //               children: [
    //                 SizedBox(height: 10.sp),
    //                 Expanded(
    //                   child: PageView.builder(
    //                     itemBuilder: (context, index) {
    //                       return Container(
    //                         margin: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 12.sp),
    //                         decoration: BoxDecoration(
    //                             color: Colors.white,
    //                             boxShadow: [
    //                               BoxShadow(
    //                                   color: Colors.black.withOpacity(0.1),
    //                                   blurRadius: 10.sp,
    //                                   spreadRadius: 3.sp,
    //                                   offset: Offset(0, 2.sp)
    //                               )
    //                             ],
    //                             borderRadius: BorderRadius.circular(15.sp)
    //                         ),
    //                         child: Center(child: Assets.appLogoLight(width: 30.w)),
    //                       );
    //                     },
    //                     itemCount: 5,
    //                     onPageChanged: (index){
    //                       setState(() {
    //                         bannerIndex = index;
    //                       });
    //                     },
    //                   ),
    //                 ),
    //                 // SizedBox(height: 5.sp),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: List.generate(5, (index) {
    //
    //                     bool isOnView = bannerIndex == index;
    //
    //                     return AnimatedContainer(
    //                       margin: EdgeInsets.symmetric(horizontal: 3.5.sp),
    //                       duration: const Duration(milliseconds: 300),
    //                       height: isOnView ? 1.8.w : 1.2.w,
    //                       width: isOnView ? 1.8.w : 1.2.w,
    //                       decoration: BoxDecoration(
    //                         // border: isOnView ? null : Border.all(color: Colors.grey),
    //                         color: isOnView ? kPrimaryColor : Colors.black12,
    //                         shape: BoxShape.circle,
    //                       ),
    //                     );
    //                   }),
    //                 ),
    //               ],
    //             ),
    //           ),
    //
    //           SizedBox(height: 20.sp),
    //
    //           //MARK :- Menu
    //           GridView.builder(
    //             shrinkWrap: true,
    //             physics: const NeverScrollableScrollPhysics(),
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 110.sp,), itemBuilder: (context, index) {
    //
    //             final menu = MenuModel.menus[index];
    //
    //             return InkWell(
    //               onTap: () {
    //                 Navigator.of(context).pushNamed(menu.route);
    //               },
    //               child: Column(
    //                 children: [
    //                   Container(
    //                     decoration: BoxDecoration(
    //                         shape: BoxShape.circle,
    //                         boxShadow: [
    //                           BoxShadow(
    //                               color: menu.colors.first.withOpacity(0.5),
    //                               blurRadius: 4.sp,
    //                               offset: Offset(0, 4.sp)
    //                           )
    //                         ],
    //                         gradient: LinearGradient(
    //                             colors: menu.colors
    //                         )
    //                     ),
    //                     margin: EdgeInsets.only(bottom: 15.sp),
    //                     height: 55.sp,
    //                     child: Center(child: menu.icon),
    //                   ),
    //                   Text(menu.title,textAlign: TextAlign.center,style: TextStyleConstant.textStyleFont500FontSize15.copyWith(color: Colors.black),)
    //                 ],
    //               ),
    //             );
    //
    //           },itemCount: MenuModel.menus.length,)
    //
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
