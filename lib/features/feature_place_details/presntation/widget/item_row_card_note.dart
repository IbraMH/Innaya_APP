import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ItemRowCardNote extends StatelessWidget {
  String image;
  String title;
  int typeGender;
  GestureTapCallback? presCard;
  bool select;

  ItemRowCardNote({
    required this.image,
    required this.title,
    this.typeGender = 1,
    this.presCard,
    this.select = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: presCard,
      child: Container(
        width: 85.w,
        height: 85.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: select?Colors.grey.shade300:Colors.transparent,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              width: 1.w,
              color: Colors.grey.shade500,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 40.w,
              height: 40.h,
              color: typeGender == 1 ? titleStartPage : titleStartPage2,
            ),
            SizedBox(height: 7.h),
            CustomeText(
              title: title,
              fontSize: 12.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w900,
              fontHeight: 1.h,
              color: typeGender == 1 ? titleStartPage : titleStartPage2,
            ),
          ],
        ),
      ),
    );
  }
}
