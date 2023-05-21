part of utils;

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, this.isLoading, this.icon, bool? primary, bool? disabled, this.onTap}) : primary = primary ?? true, disabled = disabled ?? false, super(key: key);

  final String text;
  final bool? isLoading;
  final Widget? icon;
  final bool primary;
  final bool disabled;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {

    return Opacity(
      opacity: disabled ? 0.5 : 1,
      child: InkWell(
        onTap: isLoading == true || disabled ? null : onTap,
        child: Container(
          decoration: BoxDecoration(
              color: primary ? kPrimaryColor : Colors.transparent,
              border: primary ? null : Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(5)
          ),
          padding: EdgeInsets.symmetric(vertical: 15.sp,horizontal: 10.sp),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(isLoading != true)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text,
                        style: TextStyle(
                            color: primary ? Colors.white : kPrimaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700)),
                    if(icon != null)
                  Row(
                    children: [
                      SizedBox(width: 5.sp),
                      icon!
                    ],
                  )
                ],
              ),

              if(isLoading == true)
                SizedBox(
                  width: 22.sp,
                  height: 22.sp,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(primary == true ? Colors.black : kPrimaryColor),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
