import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custome_text.dart';


class CardCategoriesPlaceDetails extends StatelessWidget {
  String image;
  String title;
  double sizeImage;
  double fontSize;
  double space;
  GestureTapCallback? pressCard;
  bool select;
  int typeGender;

  CardCategoriesPlaceDetails({
    required this.image,
    required this.title,
    this.sizeImage = 20,
    this.fontSize = 9,
    this.space = 0,
    this.pressCard,
    this.select = false,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressCard,
      child: Container(
        width: 85.w,
        height: 75.h,
        alignment: Alignment.center,
        color: select&&typeGender==1?BGroundCategoryHomePage:select&&typeGender==2?BGroundCategoryHomePageMen2:Colors.transparent,
        padding: EdgeInsetsDirectional.only(top: 5.h),
        child: Column(
          children: [
            Image.asset(
              image,
              width: sizeImage.w,
              height: sizeImage.h,
              color: typeGender==1?titleStartPage:titleStartPage2,
            ),
            SizedBox(height: space.h,),
            CustomeText(
              title: title,
              color: typeGender==1?titleStartPage:titleStartPage2,
              fontSize: fontSize.sp,
            ),
          ],
        ),
      ),
    );
  }
}
