import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ItemNotification extends StatelessWidget {
  const ItemNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Image.asset('assets/images/emailNot.png',width: 40.w,height: 40.h,color: Colors.grey,),
              SizedBox(width: 10.w),
              SizedBox(
                // width: 80.w,
                height: 60.h,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              SizedBox(
                width: 250.w,
                child: CustomeText(
                  title: 'موعدكم غدا الساعة 1:00 ظهرا في صالون يارا للتجميل للمزيد من التفاصيل يرجى الذهاب الى صفحة الحجوزات',
                  fontSize: 14.sp,
                  overflow: 1,
                  maxLines: 2,
                  fontHeight: 2,
                ),
              ),
              Spacer(),
              Image.asset('assets/images/delete.png',width: 25.w,height: 25.h,color: Colors.grey.shade600,),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 35.w),
            child: CustomeText(
              title: '25/05/2022 - 8:00',
              color: Colors.grey.shade600,
              fontSize: 16.sp,
            ),
          ),
          Divider(
            thickness: 2,
            color: Colors.grey,
            height: 30.h,
            endIndent: 35.w,
            indent: 60.w,
            // indent: ,
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}