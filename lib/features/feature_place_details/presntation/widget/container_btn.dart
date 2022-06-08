import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ContainerBtn extends StatelessWidget {
  String title;
  String image;
  GestureTapCallback? presCard;
  int typeGender;


  ContainerBtn({
    required this.title,
    required this.image,
    this.presCard,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: presCard,
      child: Container(
        height: 30.h,
        width: 110.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          // gradient: LinearGradient(
          //     colors: [Color(0xff6D096D), Color(0xffFAC5DC)],
          //     stops: [0.0, 1.0],
          //     tileMode: TileMode.clamp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image,
                width: 17.w, height: 17.h, color: typeGender==1?BGroundTitleColor:BGroundTextColorMen),
            SizedBox(width: 10.w),
            CustomeText(
              title: title,
              color: typeGender==1?titleStartPage:titleStartPage2,
              fontSize: 14.sp,
            ),
          ],
        ),
      ),
    );
  }
}
