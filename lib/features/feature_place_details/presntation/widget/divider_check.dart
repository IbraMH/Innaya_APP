import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerCheck extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      child: Divider(
        color: Colors.grey,
        thickness: 1.5.h,
      ),
    );
  }
}