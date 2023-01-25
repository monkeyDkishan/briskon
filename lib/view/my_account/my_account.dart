import 'package:briskon/model/my_account/my_account_list_model.dart';
import 'package:briskon/provider/auth_provider.dart';
import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Account"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListView.builder(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {

            final element = MyAccountListModel.list[index];

            return InkWell(
              onTap: () {
                if(element.key == "my_profile") {
                  Navigator.of(context).pushNamed(kProfileRoute);
                } else if(element.key == "logout") {
                  context.read<AuthProvider>().logout();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                } else if(element.key == "kyc") {
                  Navigator.of(context).pushNamed(kKYCRoute);
                }
              },
              child: Column(
                children: [
                  const Divider(height: 1),
                  SizedBox(height: 10.sp),
                  Row(
                    children: [
                      Container(
                        height: 70.sp,
                        width: 70.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          // color: element.color
                        ),
                        padding: EdgeInsets.all(18.sp),
                        child: element.icon,
                      ),
                      SizedBox(width: 10.sp,),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(element.title,style: TextStyleConstant.textStyleFont600FontSize14,),
                        SizedBox(height: 5.sp),
                        Text(element.subTitle,style: TextStyleConstant.textStyleFont500FontSize12ColorBlackOP05,),
                      ],)),
                      SizedBox(width: 10.sp,),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                  SizedBox(height: 10.sp),
                  if(index == MyAccountListModel.list.length - 1)
                    const Divider()
                ],
              ),
            );

          },itemCount: MyAccountListModel.list.length,padding: EdgeInsets.all(15.sp)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Assets.privacyIcon(),
                  SizedBox(height: 5.sp),
                  Text("Privacy\nPolicy",textAlign: TextAlign.center,style: TextStyleConstant.textStyleFont500FontSize12ColorBlackOP05,)
                ],
              ),
              SizedBox(width: 40.sp),
              Column(
                children: [
                  Assets.shareIcon(),

                  SizedBox(height: 5.sp),
                  Text("Share\nApp",textAlign: TextAlign.center,style: TextStyleConstant.textStyleFont500FontSize12ColorBlackOP05,)
                ],
              ),
              SizedBox(width: 40.sp),
              Column(
                children: [
                  Assets.rateUsIcon(),
                  SizedBox(height: 5.sp),
                  Text("Rate\nUs",textAlign: TextAlign.center,style: TextStyleConstant.textStyleFont500FontSize12ColorBlackOP05,)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
