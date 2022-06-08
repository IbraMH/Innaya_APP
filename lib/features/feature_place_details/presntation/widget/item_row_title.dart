import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ItemRowTitle extends StatelessWidget {
  String title;
  String image;
  int typeGender;

  ItemRowTitle({
    required this.title,
    required this.image,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 25.w,
          height: 25.h,
          color: typeGender==1?titleStartPage:titleStartPage2,
        ),
        SizedBox(width: 10.w),
        CustomeText(
          title: title,
          fontSize: 12.sp,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          // textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
