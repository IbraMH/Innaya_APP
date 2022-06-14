import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/features/feature_auth/presntation/view/login.dart';
import 'package:innaya_app/features/feature_auth/presntation/view/register.dart';
import 'package:innaya_app/features/feature_my_reservation/presntation/view/my_reservation.dart';
import 'package:innaya_app/features/feature_place_details/presntation/view/place_details.dart';
import 'package:innaya_app/features/feature_splash/presntation/view/splash_screen.dart';
import 'package:innaya_app/features/feature_start/presntation/view/start_page.dart';
import 'package:innaya_app/localization/lang/message.dart';
import 'package:innaya_app/routes/app_pages.dart';

void main(){
  runApp(MainApp());
}

class MainApp extends StatefulWidget {

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411, 866),
      builder: (BuildContext context,child)=> GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        getPages: AppPages.routes,
        initialRoute: AppPages.INITIAL,
        home: LoginScreen(),
        // theme: theme(),
        title: 'Offer App',
        translations: Messages(),
        // your translations
        locale: Locale('ar'),
        fallbackLocale: Locale('ar'),

      ),
    );
  }
}


