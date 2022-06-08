import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custome_text.dart';


class CardCategoriesPlace extends StatelessWidget {
  String image;
  String title;
  double sizeImage;
  double fontSize;
  int typeGender;

  CardCategoriesPlace({
    required this.image,
    required this.title,
    this.sizeImage = 20,
    this.fontSize = 9,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 20.w),
      child: Column(
        children: [
          Image.asset(
            image,
            width: sizeImage.w,
            height: sizeImage.h,
            color: typeGender==1?titleStartPage:titleStartPage2,
          ),
          SizedBox(height: 0,),
          CustomeText(
            title: title,
            color: typeGender==1?titleStartPage:titleStartPage2,
            fontSize: fontSize.sp,
          ),
        ],
      ),
    );
  }
}
