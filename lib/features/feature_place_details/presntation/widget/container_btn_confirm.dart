import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ContainerBtnConfirm extends StatelessWidget {
  String title;
  GestureTapCallback? presCard;
  int typeGender;


  ContainerBtnConfirm({
    required this.title,
    this.presCard,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: presCard,
      child: Container(
        height: 42.h,
        width: 160.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: typeGender==1?BGroundCategoryHomePage:BGroundCategoryHomePageMen,
        ),
        child: CustomeText(
          title: title,
          color: typeGender==1?titleStartPage:titleStartPage2,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}