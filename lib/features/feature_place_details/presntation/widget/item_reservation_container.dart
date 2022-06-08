import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ItemReservationContainer extends StatelessWidget {
  String title;
  String image;
  Widget widget;
  double heightContainer;
  int typeGender;

  ItemReservationContainer({
    required this.title,
    required this.image,
    required this.widget,
    this.heightContainer = 150,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Container(
        width: double.infinity,
        height: heightContainer.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: 15.w),
                Image.asset(
                  image,
                  width: 30.w,
                  height: 30.h,
                  color: typeGender==1?titleStartPage:titleStartPage2,
                ),
                SizedBox(width: 15.w),
                CustomeText(
                  title: title,
                  color: typeGender==1?titleStartPage:titleStartPage2,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            widget,
            // Container(
            //   child: Column(
            //     children: [
            //       CardCategoriesPlace(image: 'assets/images/1.png', title: 'title')
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
