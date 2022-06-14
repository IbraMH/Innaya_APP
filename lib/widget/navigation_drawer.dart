import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/features/feature_favorite/presntation/view/favorite_screen.dart';
import 'package:innaya_app/features/feature_home/presntation/view/home_screen.dart';
import 'package:innaya_app/features/feature_my_reservation/presntation/view/my_reservation.dart';
import 'package:innaya_app/widget/custome_text.dart';
import 'package:innaya_app/widget/text_filed_search.dart';

class NavigationDrawer extends StatefulWidget {
  int typeGender = 1;

  NavigationDrawer({
    required this.typeGender,
  });

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  TextEditingController? searchQuery;
  List<NavMenuItem> _listNaveItem = [];

  @override
  void initState() {
    AddNaveItem();
    searchQuery = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.typeGender == 1 ? BGDate : BGTextDateMen,
      width: 300.w,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Row(
            children: [
              SizedBox(width: 15.w),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                  child: Image.asset('assets/images/menu.png',
                      width: 20.w, height: 20.h, color: widget.typeGender==1?titleStartPage:Colors.white)),
              SizedBox(width: 25.w),
              Container(
                width: 45.w,
                height: 45.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Image.asset(
                  widget.typeGender==1?'assets/images/profile1.png':'assets/images/profile.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  isAntiAlias: true,
                ),
              ),
              SizedBox(width: 15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomeText(
                    title: widget.typeGender==1?'نور محمد':'خليل عادل',
                    fontSize: 14.sp,
                    color: widget.typeGender==1?titleStartPage:Colors.white,
                  ),
                  CustomeText(
                    title: '632/78',
                    fontSize: 14.sp,
                    color: widget.typeGender==1?titleStartPage:Colors.white,
                  ),
                ],
              ),
              Spacer(),
              CustomeText(
                title: '( مستخدم )',
                fontSize: 14.sp,
                color: widget.typeGender==1?titleStartPage:Colors.white,
              ),
              SizedBox(width: 15.w),
            ],
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: 230.w,
            height: 40.h,
            child: TextFiledSearch(
              searchQuery: searchQuery!,
              borderRadius: 25,
              hintText: '',
              fillColor: widget.typeGender==1?BGTextFiledWomen:BGDateMen,
              colorIcon: widget.typeGender==1?titleStartPage:titleStartPage2,
              pressClose: () {
                setState(() {
                  searchQuery!.clear();
                });
              },
            ),
          ),
          SizedBox(height: 10.h),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return ItemDrawer(_listNaveItem[index], context);
              },
              itemCount: _listNaveItem.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget ItemDrawer(NavMenuItem? mNavMenuItem, BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 20, end: 40),
      // decoration: BoxDecoration(
      //     ),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 1, right: 1),
              child: ListTile(
                  leading: (mNavMenuItem!.id == 2)
                      ? Image.asset(
                          mNavMenuItem.image.toString(),
                          width: 30.w,
                          color: widget.typeGender==1?titleStartPage:Colors.white,
                          height: 30.h,
                        )
                      : Image.asset(
                          mNavMenuItem.image.toString(),
                          color: widget.typeGender==1?titleStartPage:Colors.white,
                          width: 30.w,
                          height: 30.h,
                        ),
                  title: CustomeText(
                    title: mNavMenuItem.title.toString(),
                    color: widget.typeGender==1?titleStartPage:Colors.white,
                    fontSize: 14.sp,
                  ),
                  onTap: () async {
                    switch (mNavMenuItem.id) {
                      case 0:
                        {
                          /*         Get.offAll(() => HomePageScreen(),
                                 transition: Transition.rightToLeftWithFade);*/
                          Get.offAll(
                                  () =>
                                  HomeScreen(typeGender: widget.typeGender),
                              transition: Transition.rightToLeftWithFade);
                          break;
                        }
                      case 3:
                        {
                          /*         Get.offAll(() => HomePageScreen(),
                                 transition: Transition.rightToLeftWithFade);*/
                          Get.to(
                                  () =>
                                  FavoriteScreen(typeGender: widget.typeGender),
                              transition: Transition.rightToLeftWithFade);
                          break;
                        }
                      case 4:
                        {
                          /*         Get.offAll(() => HomePageScreen(),
                                 transition: Transition.rightToLeftWithFade);*/
                          Get.to(
                              () =>
                                  MyReservation(typeGender: widget.typeGender),
                              transition: Transition.rightToLeftWithFade);
                          break;
                        }

                      //      case 20:
                      //        {
                      //          Get.to(() => ViewFavarit(),
                      //              transition: Transition.rightToLeftWithFade);
                      //
                      //          break;
                      //        }
                      //      case 11:
                      //        {
                      //          Get.to(() => ViewMyOrder(),
                      //              transition: Transition.rightToLeftWithFade);
                      //          break;
                      //        }
                      //      case 0:
                      //        {
                      //          Get.to(() => ViewLogin(),
                      //              transition: Transition.rightToLeftWithFade);
                      //
                      //          break;
                      //        }
                      //      case 2:
                      //        {
                      //          Get.to(() => ViewContactUsME(),
                      //              transition: Transition.rightToLeftWithFade);
                      //
                      //          break;
                      //        }
                      //      case 1:
                      //        {
                      //          Get.to(() => ViewAboutUs(),
                      //              transition: Transition.rightToLeftWithFade);
                      //
                      //          break;
                      //        }
                      //      case 5:
                      //        {
                      //          Get.to(() => ViewInfoData(),transition:Transition.rightToLeftWithFade );
                      //
                      //          break;
                      //        }
                      //      case 4:
                      //        {
                      //          ShareAPP();
                      //
                      //          break;
                      //        }
                      //      case 3:
                      //        {
                      //          RateApp();
                      //          break;
                      //        }
                      //      case 6:
                      //        {
                      //          Get.to(
                      //              () => ViewRegister(
                      //                    isEditeProfile: true,
                      //                  ),
                      //              transition: Transition.rightToLeftWithFade);
                      //          break;
                      //        }
                      //      case 7:
                      //        {
                      //          await PreferenceUtils.setLogin(false);
                      //          await PreferenceUtils.setToken("");
                      //       /*   Get.offAll(() => HomePageScreen(),
                      //              transition: Transition.rightToLeftWithFade);*/
                      //          Get.offAll(() => ViewAllProduct(entityCategories: getIt<GetCategoriesList>().listCategories[0].listSubCat![0]!,),
                      //              transition: Transition.rightToLeftWithFade);
                      //          break;
                      //        }
                      //      case 8:
                      //        {
                      //          break;
                      //        }
                    }

                    //   Get.to(mNavMenuItem.Destincation!());

                    /*       if (mNavMenuItem!.id == 3) {
                      if (mNavMenuItem.open!) {
                        mNavMenuItem.open = false;
                      } else {
                        mNavMenuItem.open = true;
                      }
                      setState(() {});
                    } else if (mNavMenuItem.id == 7) {
                    } else if (mNavMenuItem.id == 8) {
                      _launchURL();
                    } else if (mNavMenuItem.id == 9) {
                      Share.share(
                          'https://play.google.com/store/apps/details?id=com.menacoders.havana',
                          subject: 'Share!');
                    }*/
                  })),
          mNavMenuItem.id == 4 || mNavMenuItem.id == 10
              ? Divider(
                  color: widget.typeGender==1?titleStartPage:Colors.white,
                  thickness: mNavMenuItem.id == 11 ? 3 : 2,
                  indent: 30,
                  endIndent: 50,
                )
              : SizedBox(),
          mNavMenuItem.id == 11 ? SizedBox(height: 25.h) : SizedBox(),
          mNavMenuItem.id == 11
              ? Row(
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: Divider(
                        thickness: 3.5,
                        color: widget.typeGender==1?titleStartPage:Colors.white,
                        indent: 25,
                        endIndent: 25,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Image.asset(
                        'assets/images/goRe.png',
                        color: widget.typeGender==1?titleStartPage:Colors.white,
                        width: 20.w,
                        height: 20.h,
                        matchTextDirection: true,
                      ),
                    ),
                  ],
                )
              : SizedBox(),
          mNavMenuItem.id == 11 ? SizedBox(height: 25.h) : SizedBox(),
        ],
      ),
    );
  }

  Future<void> AddNaveItem() async {
    NavMenuItem navMenuItem00 = NavMenuItem(
        title: 'الصفحة الرئيسية', id: 0, image: "assets/images/home.png");
    NavMenuItem navMenuItem0001 = NavMenuItem(
        title: 'اعدادات المستخدم', id: 1, image: "assets/images/userEdit.png");
    NavMenuItem navMenuItem0 = NavMenuItem(
        title: "الاشعارات", id: 2, image: "assets/images/active.png");
    NavMenuItem navMenuItem01 = NavMenuItem(
        title: "قائمة المفضلة", id: 3, image: "assets/images/heart.png");
    NavMenuItem navMenuItem1 = NavMenuItem(
        title: 'حجوزاتي', id: 4, image: "assets/images/calendar.png");
    // NavMenuItem navMenuItem2 = NavMenuItem(
    //     title: 'حجوزاتي', id: 1, image: "assets/images/calendar.png");
    NavMenuItem navMenuItem2 = NavMenuItem(
        title: 'من نحن', id: 5, image: "assets/images/about_us.png");
    NavMenuItem navMenuItem3 = NavMenuItem(
        title: 'اتصل بنا', id: 6, image: "assets/images/callMenu.png");
    NavMenuItem navMenuItem4 = NavMenuItem(
        title: 'مشاركة التطبيق', id: 7, image: "assets/images/shareMenu.png");
    NavMenuItem navMenuItem5 = NavMenuItem(
        title: 'تقييم التطبيق', id: 8, image: "assets/images/ratingApp.png");
    NavMenuItem navMenuItem6 = NavMenuItem(
        title: 'سياسة الخصوصية', id: 9, image: "assets/images/privet.png");
    NavMenuItem navMenuItem7 = NavMenuItem(
        title: 'استخدام التطبيق', id: 10, image: "assets/images/aboutApp.png");
    NavMenuItem navMenuItem8 = NavMenuItem(
        title: 'تسجيل الخروج', id: 11, image: "assets/images/logout.png");

    // NavMenuItem navMenuItem5 = NavMenuItem(
    //     title: kPrivacyPolicy.tr,
    //     id: 5,
    //     image: "assets/icons/icon_privacy_policy.svg");
    // NavMenuItem navMenuItem6 = NavMenuItem(
    //     title: kSignout.tr, id: 7, image: "assets/icons/Log_out.svg");

    // _listNaveItem.add(navMenuItem01);
    // if (await PreferenceUtils.isLogin()) {
    _listNaveItem.add(navMenuItem00);
    _listNaveItem.add(navMenuItem0001);
    //
    //   _listNaveItem.add(navMenuItem001);
    //    _listNaveItem.add(navMenuItem000);
    //
    // } else {
    _listNaveItem.add(navMenuItem0);
    // }
    _listNaveItem.add(navMenuItem01);
    _listNaveItem.add(navMenuItem1);
    _listNaveItem.add(navMenuItem2);
    _listNaveItem.add(navMenuItem3);
    _listNaveItem.add(navMenuItem4);
    _listNaveItem.add(navMenuItem5);
    _listNaveItem.add(navMenuItem6);
    _listNaveItem.add(navMenuItem7);
    _listNaveItem.add(navMenuItem8);
    // if (await PreferenceUtils.isLogin()) {
    //   _listNaveItem.add(navMenuItem6);
    // }
    setState(() {});
    //_listNaveItem.add(navMenuItem5);
    //   SharedPreferenceR1.getInstancee().SetLogin(false);
  }
}

class NavMenuItem {
  String? title;
  GestureTapCallback? Destincation;
  int? id;
  bool? open;
  String? image;

  //List<NavMenuItem?>listNavMenuItem;
  NavMenuItem(
      {this.title, this.Destincation, this.id, this.open = false, this.image});
}
