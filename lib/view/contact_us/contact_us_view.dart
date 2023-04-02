import 'package:briskon/utils.dart';
import 'package:briskon/view/contact_us/component/contact_us_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/settings_provider.dart';

class ContactUsView extends StatefulWidget {
  ContactUsView({Key? key}) : super(key: key);

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SettingsProvider>().getContactUs();

    });

  }

  final socialImages = [
    Assets.facebookIcon,
    Assets.twitterIcon,
    Assets.linkedInIcon,
    Assets.instagramIcon,];

  @override
  Widget build(BuildContext context) {

    final settingsProvider = context.watch<SettingsProvider>();

    final resContactUs = settingsProvider.resContactUs;

    final data = resContactUs.response?.data;

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: const Text("Contact Us"),
      ),
      body: ResultBuilder(result: resContactUs, child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            ContactUsButton(
              icon: Assets.emailIcon(),
              text: data?.email ?? "",
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
      ))
    );
  }
}
