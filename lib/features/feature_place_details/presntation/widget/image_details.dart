import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageDetails extends StatelessWidget {
  String image;

  ImageDetails({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 45.w,
      height: 45.h,
    );
  }
}
