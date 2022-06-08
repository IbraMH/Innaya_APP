import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/widget/custome_text.dart';

class CardTopRated extends StatelessWidget {
  String title;
  String subTitle;
  String image;

  CardTopRated({
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 15.w,top: 15.h,bottom: 15.h,start: 15.w),
      child: Container(
        height: 250.h,
        width: 175.w,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  image,
                  width: double.infinity,
                  height: 160.h,
                  isAntiAlias: true,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 10.w,
                  top: 10.h,
                  child: Image.asset(
                    'assets/images/favorite.png',
                    width: 25.w,
                    height: 25.h,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: 5.w),
                CustomeText(
                  title: title,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                Spacer(),
                // RatingBar.builder(
                //   ignoreGestures: true,
                //   initialRating: 1,
                //   minRating: 1,
                //   direction: Axis.horizontal,
                //   allowHalfRating: true,
                //   itemCount: 1,
                //   itemPadding: EdgeInsets.symmetric(horizontal: 0),
                //   itemSize: 20,
                //   itemBuilder: (context, _) => Icon(
                //     Icons.star,
                //     color: Colors.amber,
                //   ),
                //   onRatingUpdate: (rating) {},
                // ),
                // SizedBox(width: 5.w),
                // CustomeText(
                //   color: Colors.black,
                //   title: '4.5',
                //   fontSize: 16.sp,
                //   fontWeight: FontWeight.bold,
                // ),
                // SizedBox(width: 5.w),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                SizedBox(width: 5.w),
                CustomeText(
                  title: subTitle,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
                Spacer(),
                RatingBar.builder(
                  ignoreGestures: true,
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 1,
                  itemPadding: EdgeInsets.symmetric(horizontal: 0),
                  itemSize: 20,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                SizedBox(width: 5.w),
                CustomeText(
                  color: Colors.black,
                  title: '4.5',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(width: 5.w),
                // Image.asset(
                //   'assets/images/share.png',
                //   width: 25.w,
                //   height: 25.h,
                //   color: Colors.grey.shade700,
                // ),
                // SizedBox(width: 10.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
