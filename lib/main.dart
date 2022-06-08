import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/push_notification_service.dart';
import 'package:innaya_app/features/feature_place_details/presntation/view/place_details.dart';
import 'package:innaya_app/features/feature_splash/presntation/view/splash_screen.dart';
import 'package:innaya_app/features/feature_start/presntation/view/start_page.dart';
import 'package:innaya_app/localization/lang/message.dart';
import 'package:innaya_app/routes/app_pages.dart';

import 'core/init_app.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();/*

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDo wn,
  ]);*/
  //WidgetsFlutterBinding.ensureInitialized();
/*  await Hive.initFlutter();
  Hive.registerAdapter(AdsAdapter());
  await Hive.openBox<DataAds>('Favarit');*/
  await ScreenUtil.ensureScreenSize();
  await PushNotificationService().setupInteractedMessage();
  await FirebaseMessaging.instance.subscribeToTopic('all');
  init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown,])
      .then((_) {
    runApp(MainApp());
  });
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
        home: SplashScreen(),
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


