import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/features/feature_my_reservation/presntation/widget/item_row_res.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/item_row_confirm_details.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/item_row_res.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ContainerReservationPlaceDetails extends StatelessWidget {
  int typeGender;
  String date;
  String time;

  // String title;
  // String subTitle;
  // String image;

  ContainerReservationPlaceDetails({
    this.typeGender = 1,
    required this.date,
    required this.time,
    // required this.title,
    // required this.subTitle,
    // required this.image,
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
                      SizedBox(width: 5.w),
                      ItemRowReservation(
                        select: true,
                        typeGender: typeGender,
                        image: 'assets/images/service.png',
                        subTitle: 'قص شعر',
                      ),
                      ItemRowReservation(
                        select: true,
                        typeGender: typeGender,
                        image: 'assets/images/calendar.png',
                        subTitle: '300 ر.س',
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SizedBox(width: 5.w),
                      ItemRowReservation(
                        typeGender: typeGender,
                        title: 'الاربعاء',
                        // image: 'assets/images/service.png',
                        subTitle: '13:00 - 14:00',
                      ),
                      ItemRowReservation(
                        select: true,
                        typeGender: typeGender,
                        image: 'assets/images/cardPayment.png',
                        subTitle: '22 / 5 / 2022',
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
                          typeGender: typeGender,
                        ),
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
