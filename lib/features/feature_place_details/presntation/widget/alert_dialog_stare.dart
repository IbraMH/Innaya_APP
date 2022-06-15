import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/widget/custom_textfilled_app.dart';
import 'package:innaya_app/widget/custome_btn.dart';
import 'package:innaya_app/widget/custome_text.dart';

class AlertDialogStareFun extends StatefulWidget {
  int typeGender = 1;
  double rating;
  double initialRating = 2;
  late final ratingController;
  TextEditingController? notesController;

  AlertDialogStareFun({
    required this.typeGender,
    required this.initialRating,
    required this.notesController,
    required this.rating,
    required this.ratingController,
  });

  @override
  State<AlertDialogStareFun> createState() => _AlertDialogStareFunState();
}

class _AlertDialogStareFunState extends State<AlertDialogStareFun> {
  @override
  Widget build(BuildContext context) {
    // double _initialRating = 2;
    // late final _ratingController;

    //
    // initState()

    return AlertDialog(
      backgroundColor: BGroundStartPage,
      //widget.typeGender==1?BGDate:BGDateMen,
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
      contentPadding: EdgeInsets.zero,
      // buttonPadding: EdgeInsets.only(left: 15,right: 15,bottom: 5),
      elevation: 5,
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.h),
            CustomeText(
              title: 'تقييم الخدمة',
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
              color: widget.typeGender == 1 ? titleStartPage : titleStartPage2,
            ),
            SizedBox(height: 10.h),
            RatingBar.builder(
              ignoreGestures: true,
              initialRating: widget.initialRating,
              minRating: 1,
              textDirection: TextDirection.ltr,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 0),
              itemSize: 40,
              updateOnDrag: true,
              // unratedColor: ,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color:
                    widget.typeGender == 1 ? titleStartPage : titleStartPage2,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  widget.rating = rating;
                });
              },
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomTextFilledApp(
                hintText: 'اكتب تعليق',
                typeGender: widget.typeGender,
                controller: widget.notesController,
              ),
            ),
          ],
        ),
      ),
      actions: [
        CustomeBtn(
          title: 'موافق',
          pressBtn: () {
            Navigator.pop(context);
          },
          btnColor: widget.typeGender == 1 ? BGDate : BGDateMen,
          fontSize: 16.sp,
          textColor: widget.typeGender == 1 ? titleStartPage : titleStartPage2,
        ),
        SizedBox(width: 15.w),
        CustomeBtn(
          title: 'الغاء',
          pressBtn: () {
            Navigator.pop(context);
          },
          btnColor: widget.typeGender == 1 ? BGDate : BGDateMen,
          fontSize: 16.sp,
          textColor: widget.typeGender == 1 ? titleStartPage : titleStartPage2,
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    ); //showAlertDialog(context);
  }
}
