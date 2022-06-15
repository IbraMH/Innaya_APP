import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/features/feature_my_reservation/presntation/widget/item_row_res.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ContainerFavorite extends StatelessWidget {
  int typeGender;
  String title;
  String subTitle;
  String image;

  ContainerFavorite({
    this.typeGender = 1,
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
                color: typeGender == 1 ? titleStartPage : titleStartPage2,
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(10.r),
                    bottomStart: Radius.circular(10.r)),
              ),
            ),
            Container(
              height: double.infinity,
              width: 100.w,
              child: Image.asset(
                image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SizedBox(width: 10.w),
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
                                    fontSize: 14.sp,
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
                            Row(
                              children: [
                                Image.asset('assets/images/location2.png',
                                    width: 20.w,
                                    height: 20.h,
                                    color: typeGender == 1
                                        ? titleStartPage
                                        : titleStartPage2),
                                SizedBox(width: 5.w),
                                CustomeText(
                                  title: subTitle,
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                ),
                              ],
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20.w),
                        Image.asset('assets/images/location.png',
                            width: 20.w,
                            height: 20.h,
                            color: typeGender == 1
                                ? titleStartPage
                                : titleStartPage2),
                        SizedBox(width: 10.w),
                        CustomeText(
                          title: '500 م',
                          fontSize: 16.sp,
                          color: typeGender == 1
                              ? titleStartPage
                              : titleStartPage2,
                          fontWeight: FontWeight.w900,
                        ),
                        SizedBox(width: 20.w),
                        CustomeText(
                          title: '(650)',
                          fontSize: 12.sp,
                          color: typeGender == 1
                              ? titleStartPage
                              : titleStartPage2,
                        ),
                        SizedBox(width: 5.w),
                        RatingBar.builder(
                          ignoreGestures: true,
                          initialRating: 3.5,
                          minRating: 1,
                          textDirection: TextDirection.ltr,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0),
                          itemSize: 15,
                          updateOnDrag: true,
                          // unratedColor: ,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color:
                            typeGender == 1 ? titleStartPage : titleStartPage2,
                          ),
                          onRatingUpdate: (rating) {
                            // setState(() {
                            //   widget.rating = rating;
                            // });
                          },
                        ),
                        Spacer(),
                        Image.asset('assets/images/delete.png',width: 20.w,height: 20.h,color: typeGender == 1 ? titleStartPage : titleStartPage2,),
                        SizedBox(width: 8.w),
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
