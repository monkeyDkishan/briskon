import 'package:briskon/utils.dart';
import 'package:briskon/view/contact_us/component/contact_us_btn.dart';
import 'package:flutter/material.dart';

class ContactUsView extends StatelessWidget {
  ContactUsView({Key? key}) : super(key: key);

  final socialImages = [
    Assets.facebookIcon,
    Assets.twitterIcon,
    Assets.linkedInIcon,
    Assets.instagramIcon,];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: const Text("Contact Us"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            ContactUsButton(
              icon: Assets.emailIcon(),
              text: "briskontmt@gmail.com",
            ),

            SizedBox(height: 10.sp),

            ContactUsButton(
              icon: Assets.locationMarkIcon(),
              text: "SHIVAM MONREVE, NR. SHANTANU BUNGLOWS OPP. BABUL PARTY PLOT, BODAKDEV AHMEDABAD Ahmedabad GJ 380054 IN",
            ),

            SizedBox(height: 10.sp),

            ContactUsButton(
              icon: Assets.websiteIcon(),
              text: "www.briskon.co.in",
            ),

            SizedBox(height: 10.sp),

            ContactUsButton(
              icon: Assets.phoneIcon(),
              text: "022 666011000",
            ),

            SizedBox(height: 10.sp),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(socialImages.length, (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: InkWell(
                    onTap: (){},
                    child: Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: SizedBox(
                          height: 30.sp,
                          width: 30.sp,
                          child: socialImages[index]),
                    ),
                  ),
                );
              }),
            )

          ],
        ),
      ),
    );
  }
}
