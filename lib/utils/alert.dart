part of utils;

class Alert extends StatelessWidget {
  const Alert({Key? key, this.title, required this.message, this.onPrimaryAction, this.onSecondaryAction, this.primary, this.secondary}) : super(key: key);

  final String? title;
  final String message;
  final Function? onPrimaryAction;
  final Function? onSecondaryAction;
  final String? primary;
  final String? secondary;

  static show(BuildContext context,{String? title, required String message, Function? onPrimaryAction, Function? onSecondaryAction, String? primary, String? secondary}) {

    showModalBottomSheet(context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
      return Alert(title: title, message: message,onPrimaryAction: onPrimaryAction,primary: primary,onSecondaryAction: onSecondaryAction,secondary: secondary,);
    },);

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.sp,vertical: 20.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(50.sp),topLeft: Radius.circular(50.sp)),
              color: kBGColor,
          ),
          child: SafeArea(
            top: false,
            child: Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [

                  if(title != null)
                  Text(title ?? "", style: TextStyleConstant.textStyleFont500FontSize20.copyWith(color: kPrimaryColor),textAlign: TextAlign.center),

                  SizedBox(height: 30.sp),

                  Text(message, style: TextStyleConstant.textStyleFont400FontSize16,textAlign: TextAlign.center),

                  SizedBox(height: 40.sp),

                  Row(
                    children: [
                      if(secondary != null)
                      Expanded(child: CustomButton(text: secondary ?? "", onTap: () {
                        Navigator.of(context).pop();

                        if(onSecondaryAction != null) {
                          onSecondaryAction!();
                        }

                      },primary: false,)),
                      SizedBox(width: 15.sp),
                      if(primary != null)
                        Expanded(child: CustomButton(text: primary ?? "", onTap: () {
                          Navigator.of(context).pop();

                          if(onPrimaryAction != null) {
                            onPrimaryAction!();
                          }

                        },))
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

