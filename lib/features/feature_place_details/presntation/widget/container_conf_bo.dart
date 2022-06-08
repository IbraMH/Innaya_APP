import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerConfBo extends StatelessWidget {
  Widget? child;
  Color color;

  ContainerConfBo({
    required this.child,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 25.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25.w),
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [
        //     Color(0xffCCEBFA),
        //     Color(0xff5FA6C2),
        //   ],
        // ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
