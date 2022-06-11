import 'package:flutter/material.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custome_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemRowRes extends StatelessWidget {
  String image;
  String title;
  int typeGender;

  ItemRowRes({
    required this.image,
    required this.title,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 16.w,
          height: 16.h,
          color: typeGender==1?BGTextDate:BGTextDateMen,
        ),
        SizedBox(width: 10.w),
        CustomeText(
          title: title,
          fontSize: 12.sp,
          color: typeGender==1?BGTextDate:BGTextDateMen,
        ),
      ],
    );
  }
}
