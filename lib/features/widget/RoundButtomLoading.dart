import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_font.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/utility/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class RoundButtomLoading extends StatelessWidget {
   const RoundButtomLoading(
      {Key? key, this.title, this.colore=kColorPrimary, this.isIcon=false,this.icon,this.press, this.state,this.fontSize=fontSize14,this.colorText=Colors.black})
      : super(key: key);
  final String? title;
   final Color? colore;
   final Color colorText;
   final bool ? isIcon;
   final String ? icon;

  final GestureTapCallback? press;
   final int? state;
   final double? fontSize;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
     context
          
          ,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return Container(
      width: SizeConfig.screenWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ElevatedButton(
          //   padding: EdgeInsets.symmetric(vertical: 18,horizontal: 10),
          onPressed: press,
          style: ElevatedButton.styleFrom(
              primary: colore,//change background color of button
              onPrimary: Colors.yellow,////change text color of button
              onSurface: Colors.grey,

              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
              textStyle:
                  TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold,color: Colors.white)),
          child: setUpButtonChild(),
        ),
      ),
    );
  }

  Widget setUpButtonChild() {
    if (state == 1) {
      return (isIcon!)?Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Image.asset(icon!,width: 20.w,height: 20.w,),
          SizedBox(width: 10.w,),
          Text(
            title!.tr,
            style: TextStyle(
                color: colorText,
                fontSize: fontSize16.sp,
                fontFamily: FONT_APP),
          ),
        ],
      ):Text(
        title!.tr,
        style: TextStyle(
            color: colorText,
            fontSize: fontSize18.sp,
            fontFamily: FONT_APP),
      );
    } else if (state == 2) {
      return SizedBox(
        width: getProportionateScreenWidth(20),
        height: getProportionateScreenWidth(20),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black38),
        ),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }
}
