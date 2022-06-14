import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/features/feature_my_reservation/presntation/widget/container_reservation.dart';
import 'package:innaya_app/features/feature_my_reservation/presntation/widget/data_my_reservation.dart';
import 'package:innaya_app/features/feature_my_reservation/presntation/widget/item_row_res.dart';
import 'package:innaya_app/widget/custom_app_bar.dart';
import 'package:innaya_app/widget/custome_text.dart';
import 'package:innaya_app/widget/navigation_drawer.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

class MyReservation extends StatefulWidget {
  int typeGender =  1;

  MyReservation({
    required this.typeGender,
  });

  @override
  State<MyReservation> createState() => _MyReservationState();
}

class _MyReservationState extends State<MyReservation> {
  DateTime date = DateTime.now();
  final firstDate = DateTime(1900);
  final lastDate = DateTime(2100);

  List<DataMyReservation> listMyReservation = [
    DataMyReservation(
        date: 'May 22',
        time: '11:00 AM',
        image: 'assets/images/logoRe1.png',
        title: 'صالون بيتفول للجمال والصحة',
        subTitle: 'صبغة شعر'),
    DataMyReservation(
        date: 'May 22',
        time: '12:00 AM',
        image: 'assets/images/logoRe1.png',
        title: 'صالون بيتفول للجمال والصحة',
        subTitle: 'سشوار'),
    DataMyReservation(
        date: 'June 05',
        time: '11:00 AM',
        image: 'assets/images/logoRe2.png',
        title: 'عيادة الاميرة للجمال والصحة',
        subTitle: 'شد وجه'),
    DataMyReservation(
        date: 'June 05',
        time: '02:00 PM',
        image: 'assets/images/logoRe2.png',
        title: 'عيادة الاميرة للجمال والصحة',
        subTitle: 'ازالة الشامات'),
    DataMyReservation(
        date: 'June 15',
        time: '02:00 PM',
        image: 'assets/images/logoRe3.png',
        title: 'مركز رماس للتدليك والساونا',
        subTitle: 'حمام مغربي'),
    DataMyReservation(
        date: 'June 15',
        time: '11:00 AM',
        image: 'assets/images/logoRe3.png',
        title: 'مركز رماس للتدليك والساونا',
        subTitle: 'تدليك'),
  ];

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        backgroundColor: BGroundStartPage,
        drawer: NavigationDrawer(typeGender: widget.typeGender),
        body: Column(
          children: [
            CustomAppBar(typeGender: widget.typeGender,pressCard: (){
              Get.back();
            },
              pressMenu: () => _key.currentState!.openDrawer(),
            ),
            CustomeText(
              title: 'حجوزاتي',
              fontSize: 22.sp,
              color: widget.typeGender == 1
                  ? textTitleMyReservation
                  : BGTextDateMen,
              decoration: TextDecoration.underline,
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Container(
                width: double.infinity,
                height: 150.h,
                padding: EdgeInsets.symmetric(vertical: 15.h),
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
                child: SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: WeeklyDatePicker(
                      selectedDay: date,
                      changeDay: (value) => setState(() {
                        date = value;
                      }),
                      selectedDigitColor: widget.typeGender == 1
                          ? titleStartPage
                          : titleStartPage2,
                      enableWeeknumberText: false,
                      weeknumberColor: widget.typeGender == 1
                          ? titleStartPage
                          : titleStartPage2,
                      weeknumberTextColor: widget.typeGender == 1
                          ? titleStartPage
                          : titleStartPage2,
                      backgroundColor: widget.typeGender == 1
                          ? BGDate
                          : BGDateMen,
                      weekdayTextColor: widget.typeGender==1?BGTextDate:BGTextDateMen,
                      digitsColor: widget.typeGender==1?BGTextDate:BGTextDateMen,
                      selectedBackgroundColor: Colors.white,
                      weekdays: [
                        "Sun",
                        "Mon",
                        "Tue",
                        "Wed",
                        "Thu",
                        "Fri",
                        "Sat"
                      ],
                      daysInWeek: 7,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20.w),
                        CustomeText(
                          title: 'الكل',
                          fontSize: 18.sp,
                          color: widget.typeGender == 1
                              ? BGTextDate
                              : BGTextDateMen,
                        ),
                      ],
                    ),
                    // SizedBox(height: 10.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: listMyReservation.length,
                        padding: EdgeInsets.symmetric(horizontal: 10.r,vertical: 15.h),
                        itemBuilder: (context, index) {
                          DataMyReservation dataMyReservation =
                              listMyReservation.elementAt(index);
                          return ContainerReservation(
                            date: dataMyReservation.date,
                            time: dataMyReservation.time,
                            title: dataMyReservation.title,
                            subTitle: dataMyReservation.subTitle,
                            image: dataMyReservation.image,
                            typeGender: widget.typeGender,
                          );
                        },
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
