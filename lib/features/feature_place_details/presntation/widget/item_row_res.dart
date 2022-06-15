import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ItemRowReservation extends StatelessWidget {
  String? title;
  String subTitle;
  bool select;
  String? image;
  int typeGender;

  ItemRowReservation({
    this.title,
    required this.subTitle,
    this.select = false,
    this.image,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.w,
      child: Row(
        children: [
          select
              ? Image.asset(
                  image!,
                  width: 20.w,
                  height: 20.h,
            color: typeGender==1?titleStartPage:titleStartPage2,
                )
              : CustomeText(
                  title: title,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w900,
                  color: typeGender==1?titleStartPage:titleStartPage2,
                ),
          SizedBox(width: 5.w),
          CustomeText(
            title: subTitle,
            fontSize: 12.sp,
            color: Colors.grey.shade500,
            fontWeight: FontWeight.bold,
            maxLines: 1,
            overflow: 1,
          ),
        ],
      ),
    );
  }
}
