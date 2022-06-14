import 'package:flutter/material.dart';
import 'package:innaya_app/widget/custome_text.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersentIndicator extends StatelessWidget {
  String leading;
  String trailing;
  double percent;

  PersentIndicator({
    required this.leading,
    required this.trailing,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      width: 150.0,
      lineHeight: 25.0,
      percent: percent,
      isRTL: true,
      barRadius: Radius.circular(15.r),
      trailing: CustomeText(
        title: trailing,
        fontSize: 14.sp,
        color: Colors.grey,
      ),
      leading: CustomeText(
        title: leading,
        fontSize: 14.sp,
        color: Colors.grey,
      ),
      linearStrokeCap: LinearStrokeCap.roundAll,
      backgroundColor: Colors.grey.shade200,
      progressColor: Colors.amber,
    );
  }
}
