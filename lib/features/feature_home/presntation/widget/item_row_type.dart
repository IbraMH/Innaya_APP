import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ItemRowType extends StatelessWidget {
  String title;
  GestureTapCallback? pressCard;
  int typeGender;

  ItemRowType({
    required this.title,
    this.pressCard,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 15.w, end: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomeText(
            title: title,
            fontSize: 16.sp,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
          ),
          GestureDetector(
            onTap: pressCard,
            child: Row(
              children: [
                CustomeText(
                  title: 'الكل',
                  fontSize: 16.sp,
                  color: typeGender==1?titleStartPage:titleStartPage2,
                ),
                SizedBox(width: 5.w),
                Image.asset(
                  'assets/images/next.png',
                  width: 20.w,
                  height: 20.h,
                  matchTextDirection: true,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
