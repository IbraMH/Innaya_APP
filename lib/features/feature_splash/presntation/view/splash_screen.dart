import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/features/feature_auth/presntation/view/view_login.dart';
import 'package:innaya_app/features/feature_home/controller/home_controller.dart';
import 'package:innaya_app/features/feature_splash/presntation/widget/item_card.dart';
import 'package:innaya_app/features/feature_splash/presntation/widget/item_image_splash.dart';
import 'package:innaya_app/features/feature_start/presntation/view/start_page.dart';
import 'package:innaya_app/utility/size_config.dart';
import 'package:innaya_app/utility/utility.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HomeController ?homeController;
  int typeGender = 1;


  @override
  void initState() {
    // TODO: implement initState
    homeController=Get.put(HomeController());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        // backgroundColor: BGroundStartPage,
        body: Stack(
          children: [
            Image.asset('assets/images/bgSplash.png',width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.h),
                    Image.asset(
                      'assets/images/title_splash.png',
                      width: 220.w,
                      height: 30.h,
                    ),
                    SizedBox(height: 30.h),
                    Image.asset(
                      'assets/images/title2_splash.png',
                      width: 220.w,
                      height: 70.h,
                    ),
                    SizedBox(height: 60.h),
                    // Container(
                    //   width: double.infinity,
                    //   height: SCREEN_HIGHT*0.68,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.withOpacity(0.9),
                    //         spreadRadius: 5,
                    //         blurRadius: 10,
                    //         offset: Offset(0, 3), // changes position of shadow
                    //       ),
                    //     ],
                    //   ),
                    //   child:

                    // ),


                  ],
                ),
              ],
            ),
            ItemImageSplash(image: 'assets/images/logo_women.png',topPositioned: 310.h,rightPositioned: 40.w,),
            ItemCard(
              image: 'assets/images/next.png',
              topPositioned: 520.h,
              rightPositioned: 45.w,
              // imageColor: titleStartPage,
              pressCard: () async {
                goToHome(2);

              },
            ),
            ItemImageSplash(image: 'assets/images/logo_men.png',bottomPositioned: 60.h,leftPositioned: 30.w,widthImage: 180.w,),
            ItemCard(
              image: 'assets/images/next.png',
              bottomPositioned: 40.h,
              leftPositioned: 150.w,
              pressCard: () async {
                goToHome(1);
              },
            ),
          ],
        ),
      ),
    );
  }
  goToHome(int typeGender) async {
    homeController!.showDiloge();
    Utility.typeGender=typeGender;
    await homeController!.getSlider();
    await homeController!.getDepartments();
    homeController!.hideDiloge();

    Get.to(() => ViewLogin(typeGender: typeGender,),
    transition: Transition.rightToLeftWithFade);
  }
}

