import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ItemColumnEmpDetails extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90.h,
              width: 70.w,
              margin: EdgeInsetsDirectional.only(top: 15.h),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.w),
              ),
              child: Image.asset(
                'assets/images/profile.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                isAntiAlias: true,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomeText(
                    title: 'ميادة سعيد',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w900,
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      RatingBar.builder(
                        ignoreGestures: true,
                        initialRating: 4.25,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        textDirection: TextDirection.ltr,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0),
                        itemSize: 20,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      Spacer(),
                      CustomeText(
                        title: '25-06-2022',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                      ),
                      SizedBox(width: 10.w),
                    ],
                  ),
                  CustomeText(
                    title: 'صالون بيتيفول للجمال والصحة أحد أفضل صالونات التجميل في سط مدينة دبي, والذي حاز على شهرة كبيرة من قبل الرجال والنساء على حدٍ سواءٍ, حيث يحصل الرجال على مجموعة من الخدمات, بما في ذلك قص الشعر وحلاقة اللحية والعناية بالوجه.',
                    fontSize: 12.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1.5,
          color: Colors.grey,
          height: 40.h,
          // endIndent: 10.w,
          // indent: 10.w,
        ),
      ],
    );
  }
}