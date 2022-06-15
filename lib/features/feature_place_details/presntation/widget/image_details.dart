import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageDetails extends StatelessWidget {
  String image;
  GestureTapCallback? onTap;

  ImageDetails({
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        image,
        width: 55.w,
        height: 55.h,
      ),
    );
  }
}
