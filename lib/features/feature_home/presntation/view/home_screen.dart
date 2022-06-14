import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/features/feature_home/presntation/widget/card_categories_home.dart';
import 'package:innaya_app/features/feature_home/presntation/widget/card_closest.dart';
import 'package:innaya_app/features/feature_my_reservation/presntation/view/my_reservation.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/card_top_rated.dart';
import 'package:innaya_app/features/feature_home/presntation/widget/categories_data.dart';
import 'package:innaya_app/features/feature_home/presntation/widget/closest_data.dart';
import 'package:innaya_app/features/feature_home/presntation/widget/container_type_categories.dart';
import 'package:innaya_app/features/feature_home/presntation/widget/item_row_type.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/top_rated_data.dart';
import 'package:innaya_app/features/feature_places/presntation/view/places_screen.dart';
import 'package:innaya_app/localization/lang/message.dart';
import 'package:innaya_app/widget/custom_app_bar.dart';
import 'package:innaya_app/widget/custome_text.dart';
import 'package:innaya_app/widget/navigation_drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  int typeGender = 1;

  HomeScreen({
    required this.typeGender,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController? controller;
  int selectedImage = 0;
  int? indexImage;
  int indexContainer = 1;
  bool showMenu = false;

  List<CategoriesData> listCategory1 = [
    CategoriesData(title: 'قص شعر', image: 'assets/images/1.png'),
    CategoriesData(title: 'مكياج', image: 'assets/images/2.png'),
    CategoriesData(title: 'تضفير', image: 'assets/images/3.png'),
    CategoriesData(title: 'سشوار', image: 'assets/images/4.png'),
    CategoriesData(title: 'صبغات', image: 'assets/images/5.png'),
    CategoriesData(title: 'غسيل', image: 'assets/images/6.png'),
    CategoriesData(title: 'سبا', image: 'assets/images/7.png'),
  ];

  List<CategoriesData> listCategory3 = [
    CategoriesData(title: 'الاسترخاء', image: 'assets/images/17.png'),
    CategoriesData(title: 'الانعكاسي', image: 'assets/images/18.png'),
    CategoriesData(title: 'بالاحجار', image: 'assets/images/19.png'),
    CategoriesData(title: 'بالزيت', image: 'assets/images/20.png'),
    CategoriesData(title: 'بالعطر', image: 'assets/images/21.png'),
    CategoriesData(title: 'السويدي', image: 'assets/images/22.png'),
  ];

  List<CategoriesData> listCategory2 = [
    CategoriesData(title: 'شد الجلد', image: 'assets/images/10.png'),
    CategoriesData(title: 'تكبير الثدي', image: 'assets/images/11.png'),
    CategoriesData(title: 'تصغير الثدي', image: 'assets/images/12.png'),
    CategoriesData(title: 'شفط الدهون', image: 'assets/images/13.png'),
    CategoriesData(title: 'حقن الدهون', image: 'assets/images/14.png'),
    CategoriesData(title: 'شد الوجه', image: 'assets/images/15.png'),
    CategoriesData(title: 'ازالة الشامات', image: 'assets/images/16.png'),
  ];

  List<CategoriesData> listCategoryMen1 = [
    CategoriesData(title: 'قص شعر', image: 'assets/images/1.png'),
    CategoriesData(title: 'حلق لحية', image: 'assets/images/men2.png'),
    CategoriesData(title: 'فرد الشعر', image: 'assets/images/men3.png'),
    CategoriesData(title: 'سشوار', image: 'assets/images/4.png'),
    CategoriesData(title: 'صبغات', image: 'assets/images/5.png'),
    CategoriesData(title: 'غسيل', image: 'assets/images/men6.png'),
    CategoriesData(title: 'ماسكات', image: 'assets/images/men7.png'),
  ];

  List<CategoriesData> listCategoryMen2 = [
    CategoriesData(title: 'شد الجلد', image: 'assets/images/10.png'),
    CategoriesData(title: 'تصغير الثدي', image: 'assets/images/men11.png'),
    CategoriesData(title: 'شفط الدهون', image: 'assets/images/men12.png'),
    CategoriesData(title: 'حقن الدهون', image: 'assets/images/men13.png'),
    CategoriesData(title: 'شد الوجه', image: 'assets/images/men14.png'),
    CategoriesData(title: 'ازالة الشامات', image: 'assets/images/men15.png'),
  ];

  var listSlider = [
    'assets/images/face.jpg',
    'assets/images/face2.jpg',
    'assets/images/face3.jpg',
  ];

  var listSliderMen1 = [
    'assets/images/face_men1.jpg',
    'assets/images/face_men2.jpg',
    'assets/images/face_men3.jpg',
    'assets/images/face_men4.jpg',
  ];

  var listSliderMen2 = [
    'assets/images/face_men11.jpg',
    'assets/images/face_men12.jpg',
    'assets/images/face_men13.jpg',
    'assets/images/face_men14.jpg',
  ];

  var listSliderMen3 = [
    'assets/images/face_men21.jpg',
    'assets/images/face_men22.jpg',
    'assets/images/face_men23.jpg',
    'assets/images/face_men24.jpg',
  ];

  List<ClosestData> listClosest = [
    ClosestData(
        image: 'assets/images/001.jpg',
        title: 'صالون سارة و يارا للجمال والصحة',
        subTitle: 'الرياض ومقابل عمارة الرشيد',
        length: 500),
    ClosestData(
        image: 'assets/images/002.jpg',
        title: 'صالون القمر للجمال والصحة',
        subTitle: 'الرياض ومقابل عمارة الرشيد',
        length: 600),
    ClosestData(
        image: 'assets/images/003.jpg',
        title: 'صالون الاميرة للجمال والصحة',
        subTitle: 'الرياض ومقابل عمارة الرشيد',
        length: 2500),
  ];

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BGroundStartPage,
        key: _key,
        // appBar: AppBar(),
        drawer: NavigationDrawer(typeGender: widget.typeGender),
        body: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                typeGender: widget.typeGender,
                pressCard: (){
                  Get.back();
                },
                pressMenu: () => _key.currentState!.openDrawer(),
              ),
              SizedBox(
                height: SCREEN_HIGHT * 0.8,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 250.h,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            PageView.builder(
                              controller: controller,
                              itemCount: widget.typeGender == 1
                                  ? listSlider.length
                                  : listSliderMen1.length,
                              clipBehavior: Clip.antiAlias,
                              onPageChanged: (index) {
                                setState(() {
                                  selectedImage = index;
                                });
                              },
                              itemBuilder: (context, index) {
                                String listImageSlider = widget.typeGender == 1
                                    ? listSlider.elementAt(index)
                                    : widget.typeGender == 2 &&
                                            indexContainer == 1
                                        ? listSliderMen1.elementAt(index)
                                        : widget.typeGender == 2 &&
                                                indexContainer == 2
                                            ? listSliderMen2.elementAt(index)
                                            : listSliderMen3.elementAt(index);
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 10.h),
                                  child: Card(
                                    elevation: 5,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: Image.asset(
                                      listImageSlider,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      isAntiAlias: true,
                                    ),
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              bottom: 15.h,
                              right: 0,
                              left: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Card(
                                    color: Colors.white.withOpacity(0.4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.h),
                                      child: SmoothPageIndicator(
                                          controller: controller!,
                                          // PageController
                                          count: widget.typeGender == 1
                                              ? listSlider.length
                                              : listSliderMen1.length,
                                          effect: WormEffect(
                                              dotWidth: 10.0.w,
                                              dotHeight: 10.0.w,
                                              activeDotColor: Colors.blue),
                                          // your preferred effect
                                          onDotClicked: (_currentLocation) {}),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 15.h),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ContainerTypeCategories(
                                  title: widget.typeGender == 1
                                      ? 'صالون الكوافير'
                                      : 'صالون',
                                  bGColor: Colors.white,
                                  select: indexContainer == 1 ? true : false,
                                  typeGender: widget.typeGender,
                                  pressCard: () {
                                    setState(() {
                                      if (indexContainer != 1) {
                                        indexContainer = 1;
                                        indexImage = null;
                                        selectedImage = 0;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(width: 10.w),
                                ContainerTypeCategories(
                                  title: 'عيادات تجميل',
                                  select: indexContainer == 2 ? true : false,
                                  typeGender: widget.typeGender,
                                  pressCard: () {
                                    setState(() {
                                      if (indexContainer != 2) {
                                        indexContainer = 2;
                                        indexImage = null;
                                        selectedImage = 0;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(width: 10.w),
                                ContainerTypeCategories(
                                  title: 'تدليك & ساونا',
                                  select: indexContainer == 3 ? true : false,
                                  typeGender: widget.typeGender,
                                  pressCard: () {
                                    setState(() {
                                      if (indexContainer != 3) {
                                        indexContainer = 3;
                                        indexImage = null;
                                        selectedImage = 0;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            Container(
                              height: 120.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              padding: EdgeInsetsDirectional.only(top: 15.h,bottom:5.h,),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    indexContainer == 1 && widget.typeGender == 1
                                        ? listCategory1.length
                                        : indexContainer == 1 &&
                                                widget.typeGender == 2
                                            ? listCategoryMen1.length
                                            : indexContainer == 2 &&
                                                    widget.typeGender == 1
                                                ? listCategory2.length
                                                : indexContainer == 2 &&
                                                        widget.typeGender == 2
                                                    ? listCategoryMen2.length
                                                    : listCategory3.length,
                                itemBuilder: (context, index) {
                                  CategoriesData listImages =
                                      indexContainer == 1 &&
                                              widget.typeGender == 1
                                          ? listCategory1.elementAt(index)
                                          : indexContainer == 1 &&
                                                  widget.typeGender == 2
                                              ? listCategoryMen1.elementAt(index)
                                              : indexContainer == 2 &&
                                                      widget.typeGender == 1
                                                  ? listCategory2.elementAt(index)
                                                  : indexContainer == 2 &&
                                                          widget.typeGender == 2
                                                      ? listCategoryMen2
                                                          .elementAt(index)
                                                      : listCategory3
                                                          .elementAt(index);
                                  return CardCategoriesHome(
                                    image: listImages.image,
                                    title: listImages.title,
                                    select: indexImage == index ? true : false,
                                    typeGender: widget.typeGender,
                                    pressCard: () {
                                      setState(() {
                                        if (indexImage != index) {
                                          indexImage = index;
                                        } else {
                                          indexImage = -1;
                                        }
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 10.h),
                            ItemRowType(
                              title: HTopRated.tr,
                              typeGender: widget.typeGender,
                              pressCard: () {
                                Get.to(PlacesScreen(
                                  typeGender: widget.typeGender,
                                ));
                              },
                            ),
                            SizedBox(
                              height: 250.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: listClosest.length,
                                itemBuilder: (context, index) {
                                  ClosestData closestData =
                                      listClosest.elementAt(index);
                                  return CardClosest(
                                    title: closestData.title,
                                    subTitle: closestData.subTitle,
                                    image: closestData.image,
                                    length: closestData.length.toString(),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 5.h),
                            ItemRowType(
                              title: HClosestToYou.tr,
                              typeGender: widget.typeGender,
                              pressCard: () {
                                Get.to(PlacesScreen(
                                  typeGender: widget.typeGender,
                                ));
                              },
                            ),
                            SizedBox(
                              height: 270.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: listClosest.length,
                                itemBuilder: (context, index) {
                                  ClosestData closestData =
                                      listClosest.elementAt(index);
                                  return CardClosest(
                                    title: closestData.title,
                                    subTitle: closestData.subTitle,
                                    image: closestData.image,
                                    length: closestData.length.toString(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
