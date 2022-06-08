import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/utility/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSurffixIcon extends StatelessWidget {
   CustomSurffixIcon({
    Key ?key,
     this.svgIcon,
      this.type
  }) : super(key: key);
   int ?type=0;
   String ?svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: SvgPicture.asset(
        svgIcon!,color:kColorButtom,
        height: getProportionateScreenWidth(8),
      ),
    );
  }
}
