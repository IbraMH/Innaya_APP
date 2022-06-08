import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_font.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/features/widget/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:innaya_app/core/app_size.dart';
class ItemSelect extends StatelessWidget {
  final bool? select , showImage;
  GestureTapCallback? press;
  String ?text;
  final String ? imgUrl;
  ItemSelect({this.select, this.press, this.text, this.showImage = false, this.imgUrl});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
     context
          
          ,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.only(top:12.h ,bottom: 12.h,right:10.w,left: 10.w),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    color: kBorderColor.withOpacity(0.3), width: 0.5
                )
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            // SizedBox(width: 8,),

            CustomeText(
              title: "$text",fontSize: 12.sp,
              fontFamily: FONT_APP,
            ),
            SizedBox(width: 5.w,),

            SvgPicture.asset(
                (select!)? "assets/icons/check_select.svg": "assets/icons/check_not_select.svg",
                height: 15.h),

          ],
        ),
      ),
    );
  }
}
