import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardMessage extends StatelessWidget {
  ValueChanged<String>? onSubmitted;
  Widget? suffix;
  Widget? preffix;

  CardMessage({
    this.onSubmitted,
    this.suffix,
    this.preffix,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: Card(
        color: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r)
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12.w),
              hintText: 'Type your message here...',
              border: InputBorder.none,
              suffixIcon: suffix,
              prefixIcon: preffix,
            ),
            onSubmitted: onSubmitted,
          ),
        ),
      ),
    );
  }
}
