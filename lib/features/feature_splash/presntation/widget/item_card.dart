import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCard extends StatelessWidget {
  String image;
  double? topPositioned;
  double? bottomPositioned;
  double? leftPositioned;
  double? rightPositioned;
  // Color imageColor;
  GestureTapCallback? pressCard;


  ItemCard({
    required this.image,
    this.topPositioned,
    this.bottomPositioned,
    this.leftPositioned,
    this.rightPositioned,
    // this.imageColor = Colors.black,
    this.pressCard,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topPositioned,
      right: rightPositioned,
      bottom: bottomPositioned,
      left: leftPositioned,
      child: SizedBox(
        width: 75.w,
        height: 70.h,
        child: GestureDetector(
          onTap: pressCard,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Image.asset(
                image,
                width: 25.w,
                height: 25.h,
                // color: imageColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
