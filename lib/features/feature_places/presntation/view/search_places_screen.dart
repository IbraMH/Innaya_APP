import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/features/feature_home/presntation/widget/container_type_categories.dart';
import 'package:innaya_app/features/feature_place_details/presntation/view/place_details.dart';
import 'package:innaya_app/features/feature_places/presntation/widget/card_categories_place.dart';
import 'package:innaya_app/features/feature_places/presntation/widget/categories_data_place.dart';
import 'package:innaya_app/features/feature_places/presntation/widget/container_place_screen.dart';
import 'package:innaya_app/features/feature_places/presntation/widget/place_data.dart';
import 'package:innaya_app/widget/custome_text.dart';
import 'package:innaya_app/widget/text_filed_search.dart';

class SearchPlacesScreen extends StatefulWidget {
  int typeGender = 1;

  SearchPlacesScreen({
    required this.typeGender,
  });

  @override
  State<SearchPlacesScreen> createState() => _SearchPalcesScreenState();
}

class _SearchPalcesScreenState extends State<SearchPlacesScreen> {
  int indexContainer = 1;
  TextEditingController? searchQuery;
  int page = 1;

  List<PlaceData> listPlaceData = [
    PlaceData(
        title: 'صالون سارة ويارا للجمال والصحة',
        image: 'assets/images/place1.png',
        placeTitle: 'الرياض , مقابل عمارة الرشيد',
        length: 0.5,
        numUse: 250),
    PlaceData(
        title: 'صالون بيوتفل للجمال والصحة',
        image: 'assets/images/place2.png',
        placeTitle: 'الرياض , شارع الملك عبد العزيز',
        length: 3.5,
        numUse: 28),
    PlaceData(
        title: 'صالون الاميرة للجمال والصحة',
        image: 'assets/images/place3.png',
        placeTitle: 'الرياض , احمد عبد العزيز برج الجمال',
        length: 5.4,
        numUse: 350),
    PlaceData(
        title: 'صالون الفخامة للجمال والصحة',
        image: 'assets/images/place4.png',
        placeTitle: 'الرياض , مقابل برج الساحل',
        length: 7.2,
        numUse: 120),
    PlaceData(
        title: 'صالون الملكة للجمال والصحة',
        image: 'assets/images/place1.png',
        placeTitle: 'الرياض , شارع الرشيد الرئيسي',
        length: 8.6,
        numUse: 90),
    PlaceData(
        title: 'صالون سارة ويارا للجمال والصحة',
        image: 'assets/images/place2.png',
        placeTitle: 'الرياض , مقابل عمارة الرشيد',
        length: 0.5,
        numUse: 250),
  ];

  List<PlaceData> listPlaceData2 = [
    PlaceData(
        title: 'عيادة الفخامة للجمال والصحة',
        image: 'assets/images/place01.png',
        placeTitle: 'الرياض , مقابل برج الساحل',
        length: 0.5,
        numUse: 250),
    PlaceData(
        title: 'عيادة بيوتفل للجمال والصحة',
        image: 'assets/images/place02.png',
        placeTitle: 'الرياض , شارع الملك عبد العزيز',
        length: 3.5,
        numUse: 28),
    PlaceData(
        title: 'عيادة سارة ويارا للجمال والصحة',
        image: 'assets/images/place03.png',
        placeTitle: 'الرياض , احمد عبد العزيز برج الجمال',
        length: 5.4,
        numUse: 350),
    PlaceData(
        title: 'عيادة الاميرة للجمال والصحة',
        image: 'assets/images/place04.png',
        placeTitle: 'الرياض , مقابل برج الساحل',
        length: 7.2,
        numUse: 120),
    PlaceData(
        title: 'صالون الملكة للجمال والصحة',
        image: 'assets/images/place05.png',
        placeTitle: 'الرياض , شارع الرشيد الرئيسي',
        length: 8.6,
        numUse: 90),
    PlaceData(
        title: 'صالون سارة ويارا للجمال والصحة',
        image: 'assets/images/place01.png',
        placeTitle: 'الرياض , مقابل عمارة الرشيد',
        length: 0.5,
        numUse: 250),
  ];

  List<PlaceData> listPlaceData3 = [
    PlaceData(
        title: 'مركز الفخامة للتدليك والساونا',
        image: 'assets/images/40.png',
        placeTitle: 'الرياض , مقابل برج الساحل',
        length: 0.5,
        numUse: 250),
    PlaceData(
        title: 'مركز الصحة للتدليك والساونا',
        image: 'assets/images/41.png',
        placeTitle: 'الرياض , شارع الملك عبد العزيز',
        length: 3.5,
        numUse: 28),
    PlaceData(
        title: 'مركز الاميرة للتدليك والساونا',
        image: 'assets/images/42.png',
        placeTitle: 'الرياض , احمد عبد العزيز برج الجمال',
        length: 5.4,
        numUse: 350),
    PlaceData(
        title: 'مركز سارا ويارا للتدليك والساونا',
        image: 'assets/images/43.png',
        placeTitle: 'الرياض , مقابل برج الساحل',
        length: 7.2,
        numUse: 120),
    PlaceData(
        title: 'مركز رماس للتدليك والساونا',
        image: 'assets/images/44.png',
        placeTitle: 'الرياض , شارع الرشيد الرئيسي',
        length: 8.6,
        numUse: 90),
    PlaceData(
        title: 'صالون سارة ويارا للجمال والصحة',
        image: 'assets/images/40.png',
        placeTitle: 'الرياض , مقابل عمارة الرشيد',
        length: 0.5,
        numUse: 250),
  ];

  @override
  void initState() {
    // TODO: implement initState
    searchQuery = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BGroundStartPage,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/menu.png',
                    width: 25.w,
                    height: 25.h,
                    color: titleStartPage,
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/images/logo_home.png',
                    width: 70.w,
                    height: 70.h,
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/images/search.png',
                    width: 25.w,
                    height: 25.h,
                    color: titleStartPage,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
                child: Column(
                  children: [

                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 10,
                              blurRadius: 12,
                              offset:
                                  Offset(0, 23), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 10.w, end: 10.w, top: 15.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              SizedBox(height: 10.h),
                              CustomeText(
                                title:"نتائج الحث",
                                color: Colors.grey.shade600,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 10.h),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: indexContainer == 1
                                      ? listPlaceData.length
                                      : indexContainer == 2
                                          ? listPlaceData2.length
                                          : listPlaceData3.length,
                                  padding:
                                      EdgeInsetsDirectional.only(bottom: 15.h),
                                  itemBuilder: (context, index) {
                                    PlaceData placeData = indexContainer == 1
                                        ? listPlaceData.elementAt(index)
                                        : indexContainer == 2
                                            ? listPlaceData2.elementAt(index)
                                            : listPlaceData3.elementAt(index);
                                    return ContainerPlaceScreen(
                                      title: placeData.title,
                                      image: placeData.image,
                                      placeTitle: placeData.placeTitle,
                                      length: placeData.length,
                                      numUes: placeData.numUse,
                                      indexContainer: indexContainer,
                                      typeGender:  widget.typeGender,
                                      pressCard: () {
                                        Get.to(() => PlaceDetails(
                                              page: page,
                                          typeGender: widget.typeGender,
                                            ));
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
