import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/features/widget/custome_text.dart';
import 'package:innaya_app/utility/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class ItemSelectData extends StatelessWidget {
   String ?text;
   GestureTapCallback ?press;
   Color ?color;
   ItemSelectData({Key? key,this.text,this.press,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
     context
          
          ,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return GestureDetector(
      onTap: press,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.w),
              height: 53,

              decoration: BoxDecoration(
                border: Border.all(
                    color: kBorderColor, width: 0.5),
                borderRadius:
                BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                    padding: EdgeInsets.only(
                        left: 12.w,
                        bottom: 8.h,
                        right: 12.w,
                        top: 8.h),
                    child: CustomeText(
                      title: text,
                      textAlign: TextAlign.start,
                      color:color?? kUnSelectTabColor,
                      fontSize: fontSize15.sp,
                    ),
                  ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
        Container(
        height: 53.h,
        width: 50.w,
        padding: EdgeInsets.all(10),
        // decoration: BoxDecoration(
        //   color: kColorButtom,
        //   border: Border.all(color: kBorderColor, width: 0.5),
        //   borderRadius: BorderRadius.all(Radius.circular(8)),
        // ),
        decoration: BoxDecoration(
          color:Colors.white, // color: kColorButtom,
          border: Border.all(color: kBorderColor, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          "assets/icons/arrow_buttom.svg",
          color: kColorButtom,
          // color: Colors.white,
          height: getProportionateScreenWidth(8),
          width: getProportionateScreenWidth(8),
        ),
      )
        ],
      ),
    );
  }
}
