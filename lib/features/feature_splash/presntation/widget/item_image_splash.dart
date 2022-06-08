import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemImageSplash extends StatelessWidget {
  String image;
  double widthImage;
  double? topPositioned;
  double? bottomPositioned;
  double? leftPositioned;
  double? rightPositioned;

  ItemImageSplash({
    required this.image,
    this.widthImage = 200,
    this.topPositioned,
    this.bottomPositioned,
    this.leftPositioned,
    this.rightPositioned,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topPositioned,
      right: rightPositioned,
      left: leftPositioned,
      bottom: bottomPositioned,
      child: Image.asset(image,
          width: widthImage.w, height: 250.h),
    );
  }
}
