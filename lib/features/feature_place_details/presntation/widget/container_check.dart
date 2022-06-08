import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';

class ContainerCheck extends StatelessWidget {
  bool select;

  ContainerCheck({
    this.select = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.5.w,
      height: 10.h,
      decoration: BoxDecoration(
        color: select?BGroundContainerCheck:Colors.grey,
        borderRadius: BorderRadius.circular(15.r),
      ),
    );
  }
}
