import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/features/feature_my_reservation/presntation/widget/item_row_res.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ContainerReservation extends StatelessWidget {
  int typeGender;
  String date;
  String time;
  String title;
  String subTitle;
  String image;

  ContainerReservation({
    this.typeGender = 1,
    required this.date,
    required this.time,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      margin: EdgeInsetsDirectional.only(bottom: 15.h),
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
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: 7.w,
              decoration: BoxDecoration(
                color: typeGender == 1 ? BGDate : BGDateMen,
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(10.r),
                    bottomStart: Radius.circular(10.r)),
              ),
            ),
            Container(
              height: double.infinity,
              width: 100.w,
              color: typeGender == 1 ? BGTextDate : BGTextDateMen,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomeText(
                    title: date,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  SizedBox(height: 7.h),
                  CustomeText(
                    title: time,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SizedBox(width: 10.w),
                      Container(
                        width: 40.w,
                        height: 40.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset(
                          image,
                          width: 50.w,
                          height: 50.h,
                          isAntiAlias: true,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: CustomeText(
                                    title: title,
                                    fontSize: 12.sp,
                                    color: typeGender == 1
                                        ? BGTextDate
                                        : BGTextDateMen,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/goRe.png',
                                  width: 15.w,
                                  height: 15.h,
                                  color: typeGender == 1
                                      ? BGTextDate
                                      : BGTextDateMen,
                                ),
                                SizedBox(width: 10.w),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            CustomeText(
                              title: subTitle,
                              color: Colors.grey,
                              fontSize: 12.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 30.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: typeGender == 1 ? BGDate : BGDateMen,
                      borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(10.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ItemRowRes(
                          image: 'assets/images/edit.png',
                          title: 'تعديل الحجز',
                          typeGender: typeGender,
                        ),
                        ItemRowRes(
                            image: 'assets/images/cancel.png',
                            title: 'الغاء الحجز',
                          typeGender: typeGender,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
