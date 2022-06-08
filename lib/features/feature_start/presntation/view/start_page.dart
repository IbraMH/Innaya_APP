import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/features/feature_home/presntation/view/home_screen.dart';

class StartPage extends StatefulWidget {
  int typeGender = 1;

  StartPage({
    required this.typeGender,
  });

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  TextEditingController? searchQuery;

  @override
  void initState() {
    // TODO: implement initState
    searchQuery = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchQuery!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: BGroundStartPage,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            Image.asset(
              'assets/images/title.png',
              width: 120.w,
              height: 40.h,
            ),
            SizedBox(height: 80.h),
            Image.asset(
              widget.typeGender==1?'assets/images/logo.png':'assets/images/logo_men.png',
              width: double.infinity,
              height: 280.h,
            ),
            SizedBox(height: 30.h),
            Image.asset(
              'assets/images/title1.png',
              width: 220.w,
              height: 30.h,
              color: widget.typeGender==1?titleStartPage:titleStartPage2,
            ),
            Image.asset(
              'assets/images/title2.png',
              width: 220.w,
              height: 35.h,
              color: widget.typeGender==1?titleStartPage:titleStartPage2,
            ),
            Spacer(),
            Image.asset(
              widget.typeGender==1?'assets/images/title3.png':'assets/images/title3_men.png',
              width: 240.w,
              height: 40.h,
              color: widget.typeGender==1?titleStartPage:titleStartPage2,
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(elevation: 5, primary: Colors.white),
              onPressed: () {
                Get.to(HomePageScreen(typeGender: widget.typeGender,));
              },
              child: Image.asset(
                'assets/images/btn.png',
                width: 80.w,
                height: 40.h,
                color: widget.typeGender==1?titleStartPage:titleStartPage2,
              ),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
