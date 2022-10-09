import 'package:briskon/model/order/order_list_items.dart';
import 'package:briskon/utils.dart';
import 'package:briskon/view/common/app_button.dart';
import 'package:flutter/material.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {

        bool isSelecting = false;

        print(isSelecting);

        return StatefulBuilder(
          builder: (context, setState) {
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTapDown: (details) {
                setState(() {
                  isSelecting = true;
                });
              },
              onTapUp: (details) {
                setState(() {
                  isSelecting = false;
                });
              },
              onTapCancel: () {
                setState(() {
                  isSelecting = false;
                });
              },
              onTap: () {
                Navigator.of(context).pushNamed(kOrderDetailsRoute);
              },
              child: AnimatedContainer(
                duration: const Duration(
                    milliseconds: 100
                ),
                margin: EdgeInsets.symmetric(vertical: 5.sp),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow:  [
                      if(!isSelecting)
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: const Offset(0,2)
                        )
                    ]
                ),
                padding: EdgeInsets.all(14.sp),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text("Name of Product", style: TextStyleConstant.textStyleFont500FontSize19),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 10.sp),
                          decoration: BoxDecoration(
                              color: kSuccessOrderColor,
                              borderRadius: BorderRadius.circular(15.sp)
                          ),
                          child: Text("Delivered", style: TextStyleConstant.textStyleFont500FontSize13.copyWith(color: Colors.white)),
                        )
                      ],
                    ),
                    SizedBox(height: 15.sp),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                          childAspectRatio: 133/24,
                          crossAxisCount: SizerUtil.gridCount),
                      itemBuilder: (context, index) {

                        final order = OrderListItem.values[index];

                        return Row(
                          children: [
                            order.svgIcon,
                            SizedBox(width: 10.sp),
                            Text(order.text, style: TextStyleConstant.textStyleFont400FontSize16.copyWith(color: Colors.black))
                          ],
                        );
                      },)
                  ],
                ),
              ),
            );
          },
        );

      },itemCount: 2, padding: EdgeInsets.symmetric(vertical: 15.sp,horizontal: 15.sp),),
    );
  }
}
