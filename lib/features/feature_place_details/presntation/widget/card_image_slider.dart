import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardImageSlider extends StatelessWidget {
  String image;
  bool select;
  GestureTapCallback? pressCard;

  CardImageSlider({
    this.select = false,
    required this.image,
    // this.selected,
    // this.imageColor = Colors.red,
    this.pressCard,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      height: 40.h,
      child: Stack(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            // color: Colors.white,
            child: Image.asset(
              image,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              isAntiAlias: true,
              // color: imageColor,//selected?Colors.transparent:Colors.white.withAlpha(80),
            ),
          ),
          SizedBox(
            width: 60.w,
            height: 50.h,
            child: GestureDetector(
              onTap: pressCard,
              child: Card(
                elevation: 0,
                color: select?Colors.transparent:Colors.white.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
