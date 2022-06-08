import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/data_image_details.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/item_column_image_details.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/item_row_service.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ContainerService extends StatelessWidget {
  List<DataImageDetails> listDataImageDetails1 = [
    DataImageDetails(
      image: 'assets/images/q1.png',
      title: 'Style #01',
    ),
    DataImageDetails(
      image: 'assets/images/q2.png',
      title: 'Style #02',
    ),
    DataImageDetails(
      image: 'assets/images/q3.png',
      title: 'Style #03',
    ),
    DataImageDetails(
      image: 'assets/images/q4.png',
      title: 'Style #04',
    ),
    DataImageDetails(
      image: 'assets/images/q5.png',
      title: 'Style #05',
    ),
  ];

  List<DataImageDetails> listDataImageDetails2 = [
    DataImageDetails(
      image: 'assets/images/m1.png',
      title: 'Style #01',
    ),
    DataImageDetails(
      image: 'assets/images/m2.png',
      title: 'Style #02',
    ),
    DataImageDetails(
      image: 'assets/images/m3.png',
      title: 'Style #03',
    ),
    DataImageDetails(
      image: 'assets/images/m4.png',
      title: 'Style #04',
    ),
    DataImageDetails(
      image: 'assets/images/m5.png',
      title: 'Style #05',
    ),
  ];

  List<DataImageDetails> listDataImageDetails3 = [
    DataImageDetails(
      image: 'assets/images/s1.png',
      title: 'Style #01',
    ),
    DataImageDetails(
      image: 'assets/images/s2.png',
      title: 'Style #02',
    ),
    DataImageDetails(
      image: 'assets/images/s3.png',
      title: 'Style #03',
    ),
    DataImageDetails(
      image: 'assets/images/s4.png',
      title: 'Style #04',
    ),
    DataImageDetails(
      image: 'assets/images/s5.png',
      title: 'Style #05',
    ),
  ];

  List<DataImageDetails> listDataImageDetails4 = [
    DataImageDetails(
      image: 'assets/images/sh1.png',
      title: 'Style #01',
    ),
    DataImageDetails(
      image: 'assets/images/sh2.png',
      title: 'Style #02',
    ),
    DataImageDetails(
      image: 'assets/images/sh3.png',
      title: 'Style #03',
    ),
    DataImageDetails(
      image: 'assets/images/sh4.png',
      title: 'Style #04',
    ),
    DataImageDetails(
      image: 'assets/images/sh5.png',
      title: 'Style #05',
    ),
  ];

  List<DataImageDetails> listDataImageDetails11 = [
    DataImageDetails(
      image: 'assets/images/as1.png',
      title: 'Style #01',
    ),
    DataImageDetails(
      image: 'assets/images/as2.png',
      title: 'Style #02',
    ),
    DataImageDetails(
      image: 'assets/images/as3.png',
      title: 'Style #03',
    ),
  ];

  List<DataImageDetails> listDataImageDetails12 = [
    DataImageDetails(
      image: 'assets/images/ad1.png',
      title: 'Style #01',
    ),
    DataImageDetails(
      image: 'assets/images/ad2.png',
      title: 'Style #02',
    ),
    DataImageDetails(
      image: 'assets/images/ad3.png',
      title: 'Style #03',
    ),
  ];

  List<DataImageDetails> listDataImageDetails13 = [
    DataImageDetails(
      image: 'assets/images/af1.png',
      title: 'Style #01',
    ),
    DataImageDetails(
      image: 'assets/images/af2.png',
      title: 'Style #02',
    ),
    DataImageDetails(
      image: 'assets/images/af3.png',
      title: 'Style #03',
    ),
  ];

  List<DataImageDetails> listDataImageDetails14 = [
    DataImageDetails(
      image: 'assets/images/ag1.png',
      title: 'Style #01',
    ),
    DataImageDetails(
      image: 'assets/images/ag2.png',
      title: 'Style #02',
    ),
    DataImageDetails(
      image: 'assets/images/ag3.png',
      title: 'Style #03',
    ),
  ];

  List<DataImageDetails> listDataImageDetails15 = [
    DataImageDetails(
      image: 'assets/images/ah1.png',
      title: 'Style #01',
    ),
    DataImageDetails(
      image: 'assets/images/ah2.png',
      title: 'Style #02',
    ),
    DataImageDetails(
      image: 'assets/images/ah3.png',
      title: 'Style #03',
    ),
  ];

  List<DataImageDetails> listDataImageDetails21 = [
    DataImageDetails(
      image: 'assets/images/m111.png',
      title: 'Style #01',
    ),
    DataImageDetails(
      image: 'assets/images/m112.png',
      title: 'Style #02',
    ),
    DataImageDetails(
      image: 'assets/images/m113.png',
      title: 'Style #03',
    ),
  ];

  List<DataImageDetails> listDataImageDetails22 = [
    DataImageDetails(
      image: 'assets/images/m11.png',
      title: 'Style #01',
    ),
    DataImageDetails(
      image: 'assets/images/m12.png',
      title: 'Style #02',
    ),
    DataImageDetails(
      image: 'assets/images/m13.png',
      title: 'Style #03',
    ),
  ];
  List<DataImageDetails> listDataImageDetails23 = [
    DataImageDetails(
      image: 'assets/images/m21.png',
      title: 'Style #01',
    ),
    DataImageDetails(
      image: 'assets/images/m22.png',
      title: 'Style #02',
    ),
    DataImageDetails(
      image: 'assets/images/m23.png',
      title: 'Style #03',
    ),
  ];
  List<DataImageDetails> listDataImageDetails24 = [
    DataImageDetails(
      image: 'assets/images/m31.png',
      title: 'Style #01',
    ),
    DataImageDetails(
      image: 'assets/images/m32.png',
      title: 'Style #02',
    ),
    DataImageDetails(
      image: 'assets/images/m33.png',
      title: 'Style #03',
    ),
  ];
  List<DataImageDetails> listDataImageDetails25 = [
    DataImageDetails(
      image: 'assets/images/m41.png',
      title: 'Style #01',
    ),
    DataImageDetails(
      image: 'assets/images/m42.png',
      title: 'Style #02',
    ),
    DataImageDetails(
      image: 'assets/images/43.png',
      title: 'Style #03',
    ),
  ];

  List<DataImageDetails> listDataImageDetails31 = [
    DataImageDetails(
      image: 'assets/images/sh1.png',
      title: 'Style #01',
    ),
    DataImageDetails(
      image: 'assets/images/sh2.png',
      title: 'Style #02',
    ),
    DataImageDetails(
      image: 'assets/images/sh3.png',
      title: 'Style #03',
    ),
    DataImageDetails(
      image: 'assets/images/sh4.png',
      title: 'Style #04',
    ),
    DataImageDetails(
      image: 'assets/images/sh5.png',
      title: 'Style #05',
    ),
    DataImageDetails(
      image: 'assets/images/sh5.png',
      title: 'Style #05',
    ),
    DataImageDetails(
      image: 'assets/images/sh5.png',
      title: 'Style #05',
    ),
  ];

  String title;
  String image;
  String time;
  String price;
  int indexList;
  int page;
  int typeGender;

  ContainerService({
    required this.title,
    required this.image,
    required this.time,
    required this.price,
    required this.indexList,
    this.page = 1,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          bottom: 20.h, start: 10.w, end: 10.w, top: 15.h),
      child: Container(
        width: double.infinity,
        height: 240.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: 10.w),
                Container(
                  width: 60.w,
                  height: 60.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.asset(
                    image,
                    width: 35.w,
                    height: 35.h,
                    color: typeGender==1?titleStartPage:titleStartPage2,
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ItemRowService(
                          title: 'الخدمة',
                          image: 'assets/images/service.png',
                          details: title,
                          typeGender: typeGender,
                        ),
                        SizedBox(width: 15.w),
                        ItemRowService(
                            title: 'السعر',
                            image: 'assets/images/cardPayment.png',
                            details: price,
                            typeGender: typeGender,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        ItemRowService(
                            title: 'المدة',
                            image: 'assets/images/time.png',
                            details: time,
                            typeGender: typeGender,
                        ),
                        SizedBox(width: 50.w),
                        Container(
                          height: 30.h,
                          width: 80.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            gradient: LinearGradient(
                                colors: [typeGender==1?Color(0xff6D096D):Color(0xff1A1A1A),typeGender==1?Color(0xffFAC5DC):Color(0xffCCCCCC)],
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          child: CustomeText(
                            title: 'احجز الان',
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.h),
            // ItemColumnImageDetails(),
            SizedBox(
              height: 130.h,
              child: ListView.builder(
                itemCount: page == 1
                    ? listDataImageDetails1.length
                    : page == 2
                        ? listDataImageDetails11.length
                        : listDataImageDetails21.length,
                // indexList == 0 && page == 1
                //     ? listDataImageDetails1.length
                //     : indexList == 0 && page == 2
                //         ? listDataImageDetails11.length
                //         : indexList == 1 && page == 1
                //             ? listDataImageDetails2.length
                //             : indexList == 1 && page == 2
                //                 ? listDataImageDetails12.length
                //                 : indexList == 2 && page == 1
                //                     ? listDataImageDetails2.length
                //                     : indexList == 2 && page == 2
                //                         ? listDataImageDetails13.length
                //                         : indexList == 3 && page == 1
                //                             ? listDataImageDetails4.length
                //                             : listDataImageDetails3.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  DataImageDetails dataImageDetails = indexList == 0 &&
                          page == 1
                      ? listDataImageDetails1.elementAt(index)
                      : indexList == 0 && page == 2
                          ? listDataImageDetails11.elementAt(index)
                          : indexList == 0 && page == 3
                              ? listDataImageDetails21.elementAt(index)
                              : indexList == 1 && page == 1
                                  ? listDataImageDetails2.elementAt(index)
                                  : indexList == 1 && page == 2
                                      ? listDataImageDetails12.elementAt(index)
                                      : indexList == 1 && page == 3
                                          ? listDataImageDetails22
                                              .elementAt(index)
                                          : indexList == 2 && page == 1
                                              ? listDataImageDetails3
                                                  .elementAt(index)
                                              : indexList == 2 && page == 2
                                                  ? listDataImageDetails13
                                                      .elementAt(index)
                                                  : indexList == 2 && page == 3
                                                      ? listDataImageDetails23
                                                          .elementAt(index)
                                                      : indexList == 3 &&
                                                              page == 1
                                                          ? listDataImageDetails4
                                                              .elementAt(index)
                                                          : indexList == 3 &&
                                                                  page == 2
                                                              ? listDataImageDetails14
                                                                  .elementAt(
                                                                      index)
                                                              : indexList == 3 &&
                                                                      page == 3
                                                                  ? listDataImageDetails24
                                                                      .elementAt(
                                                                          index)
                                                                  : indexList ==
                                                                              4 &&
                                                                          page ==
                                                                              2
                                                                      ? listDataImageDetails15
                                                                          .elementAt(index)
                                                                      : indexList == 4 && page == 3
                                                                          ? listDataImageDetails25.elementAt(index)
                                                                          : listDataImageDetails25.elementAt(index);
                  return ItemColumnImageDetails(
                    title: dataImageDetails.title,
                    image: dataImageDetails.image,
                    page: page,
                    typeGender: typeGender,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
