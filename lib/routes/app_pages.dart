// ignore_for_file: always_specify_types

import 'package:get/get.dart';
import 'package:innaya_app/features/feature_auth/presntation/view/login.dart';
import 'package:innaya_app/features/feature_auth/presntation/view/register.dart';
import 'package:innaya_app/features/feature_my_reservation/presntation/view/my_reservation.dart';
import 'package:innaya_app/features/feature_place_details/presntation/view/place_details.dart';
import 'package:innaya_app/features/feature_splash/presntation/view/splash_screen.dart';
import 'package:innaya_app/features/feature_start/presntation/view/start_page.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => LoginScreen(),
    ),
    // GetPage(
    //
    //   name: Routes.HOME,
    //   // binding: HomeBinding(),
    //
    //   page: () => HomePageScreen(),
    // ),
  ];
}
