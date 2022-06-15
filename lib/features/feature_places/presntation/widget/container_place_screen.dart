import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/features/feature_chat/presntation/view/chat_screen.dart';
import 'package:innaya_app/features/feature_places/presntation/widget/card_categories_place.dart';
import 'package:innaya_app/features/feature_places/presntation/widget/categories_data_place.dart';
import 'package:innaya_app/features/feature_places/presntation/widget/container_icon.dart';
import 'package:innaya_app/widget/custome_text.dart';

class ContainerPlaceScreen extends StatelessWidget {
  List<CategoriesDataPlace> listCategory1 = [
    CategoriesDataPlace(title: 'قص شعر', image: 'assets/images/1.png'),
    CategoriesDataPlace(title: 'مكياج', image: 'assets/images/2.png'),
    CategoriesDataPlace(title: 'تضفير', image: 'assets/images/3.png'),
    CategoriesDataPlace(title: 'سشوار', image: 'assets/images/4.png'),
    CategoriesDataPlace(title: 'صبغات', image: 'assets/images/5.png'),
    CategoriesDataPlace(title: 'غسيل', image: 'assets/images/6.png'),
    CategoriesDataPlace(title: 'سبا', image: 'assets/images/7.png'),
  ];
  List<CategoriesDataPlace> listCategory3 = [
    CategoriesDataPlace(title: 'الاسترخاء', image: 'assets/images/17.png'),
    CategoriesDataPlace(title: 'الانعكاسي', image: 'assets/images/18.png'),
    CategoriesDataPlace(title: 'بالاحجار', image: 'assets/images/19.png'),
    CategoriesDataPlace(title: 'بالزيت', image: 'assets/images/20.png'),
    CategoriesDataPlace(title: 'بالعطر', image: 'assets/images/21.png'),
    CategoriesDataPlace(title: 'السويدي', image: 'assets/images/22.png'),
  ];

  List<CategoriesDataPlace> listCategory2 = [
    CategoriesDataPlace(title: 'شد الجلد', image: 'assets/images/10.png'),
    CategoriesDataPlace(title: 'تكبير الثدي', image: 'assets/images/11.png'),
    CategoriesDataPlace(title: 'تصغير الثدي', image: 'assets/images/12.png'),
    CategoriesDataPlace(title: 'شفط الدهون', image: 'assets/images/13.png'),
    CategoriesDataPlace(title: 'حقن الدهون', image: 'assets/images/14.png'),
    CategoriesDataPlace(title: 'شد الوجه', image: 'assets/images/15.png'),
    CategoriesDataPlace(title: 'ازالة الشامات', image: 'assets/images/16.png'),
  ];

  List<CategoriesDataPlace> listCategoryMen1 = [
    CategoriesDataPlace(title: 'قص شعر', image: 'assets/images/1.png'),
    CategoriesDataPlace(title: 'حلق لحية', image: 'assets/images/men2.png'),
    CategoriesDataPlace(title: 'فرد الشعر', image: 'assets/images/men3.png'),
    CategoriesDataPlace(title: 'سشوار', image: 'assets/images/4.png'),
    CategoriesDataPlace(title: 'صبغات', image: 'assets/images/5.png'),
    CategoriesDataPlace(title: 'غسيل', image: 'assets/images/men6.png'),
    CategoriesDataPlace(title: 'ماسكات', image: 'assets/images/men7.png'),
  ];

  List<CategoriesDataPlace> listCategoryMen2 = [
    CategoriesDataPlace(title: 'شد الجلد', image: 'assets/images/10.png'),
    CategoriesDataPlace(title: 'تصغير الثدي', image: 'assets/images/men11.png'),
    CategoriesDataPlace(title: 'شفط الدهون', image: 'assets/images/men12.png'),
    CategoriesDataPlace(title: 'حقن الدهون', image: 'assets/images/men13.png'),
    CategoriesDataPlace(title: 'شد الوجه', image: 'assets/images/men14.png'),
    CategoriesDataPlace(
        title: 'ازالة الشامات', image: 'assets/images/men15.png'),
  ];

  String title;
  String image;
  String placeTitle;
  double length;
  num numUes;
  int indexContainer;
  GestureTapCallback? pressCard;
  int typeGender;

  ContainerPlaceScreen({
    required this.title,
    required this.image,
    required this.placeTitle,
    required this.length,
    required this.numUes,
    this.indexContainer = 1,
    this.pressCard,
    this.typeGender = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 15.h),
      child: Container(
        width: double.infinity,
        height: 150.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(3, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: pressCard,
                  child: Image.asset(
                    image,
                    width: 150.w,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 5.w,
                  bottom: 5.h,
                  child: Row(
                    children: [
                      ContainerIcon(
                        image: 'assets/images/heart.png',
                        typeGender: typeGender,
                      ),
                      SizedBox(width: 10.w),
                      ContainerIcon(
                        image: 'assets/images/share.png',
                        typeGender: typeGender,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  SizedBox(
                    height: 35.h,
                    child: ListView.builder(
                      itemCount: indexContainer == 1 && typeGender == 1
                          ? listCategory1.length
                          : indexContainer == 1 &&
                          typeGender == 2
                          ? listCategoryMen1.length
                          : indexContainer == 2 &&
                          typeGender == 1
                          ? listCategory2.length
                          : indexContainer == 2 &&
                          typeGender == 2
                          ? listCategoryMen2.length
                          : listCategory3.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsetsDirectional.only(start: 15.sp),
                      itemBuilder: (context, index) {
                        CategoriesDataPlace listCategory =
                        indexContainer == 1 &&
                            typeGender == 1
                            ? listCategory1.elementAt(index)
                            : indexContainer == 1 &&
                            typeGender == 2
                            ? listCategoryMen1.elementAt(index)
                            : indexContainer == 2 &&
                            typeGender == 1
                            ? listCategory2.elementAt(index)
                            : indexContainer == 2 &&
                            typeGender == 2
                            ? listCategoryMen2
                            .elementAt(index)
                            : listCategory3
                            .elementAt(index);
                        return CardCategoriesPlace(
                            image: listCategory.image,
                            title: listCategory.title,
                          typeGender: typeGender,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: pressCard,
                            child: CustomeText(
                              title: title,
                              fontSize: 12.sp,
                              color: typeGender==1?titleStartPage:titleStartPage2,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/location2.png',
                                width: 20.w,
                                height: 20.h,
                                color: typeGender==1?titleStartPage:titleStartPage2,
                              ),
                              SizedBox(width: 5.w),
                              CustomeText(
                                title: placeTitle,
                                fontSize: 10.sp,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          Get.to(ChatScreen(typeGender: typeGender,));
                        },
                        child: SizedBox(
                          height: 60.h,
                          width: 40.w,
                          child: Stack(
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/images/chat.png',
                                  width: 30.w,
                                  height: 30.h,
                                  color: typeGender==1?titleStartPage:titleStartPage2,
                                ),
                              ),
                              Positioned(
                                top: 5.h,
                                right: 0.w,
                                child: Container(
                                  width: 22.w,
                                  height: 22.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: typeGender==1?titleStartPage:titleStartPage2,
                                    borderRadius: BorderRadius.circular(20.r),
                                    border: Border.all(
                                        color: Colors.white, width: 0.5),
                                  ),
                                  child: CustomeText(
                                    title: '14',
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Container(
                        height: 30.h,
                        width: 65.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: typeGender==1?BGroundCategoryHomePage:BGroundCategoryHomePageMen,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: CustomeText(
                          title: 'احجز الان',
                          color: typeGender==1?titleStartPage:titleStartPage2,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      CustomeText(
                        title: '$length km',
                        color: typeGender==1?titleStartPage:titleStartPage2,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w900,
                      ),
                      SizedBox(width: 10.w),
                      CustomeText(
                        title: '($numUes)',
                        color: Colors.grey,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 2.w),
                      RatingBar.builder(
                        textDirection: TextDirection.ltr,
                        ignoreGestures: true,
                        initialRating: 3.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0),
                        itemSize: 12,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: typeGender==1?titleStartPage:Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          // ProductGetxController.to.rattingProduct(
                          //     productId: controller.productsDetails[0]!.id,
                          //     context: context,
                          //     rate: rating);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
