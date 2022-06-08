import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innaya_app/utility/size_config.dart';

class IconLogin extends StatelessWidget {
  IconLogin({
    Key ?key,
    this.press,
    @required this.svgIcon,
  }) : super(key: key);
   String ?svgIcon;
   GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SvgPicture.asset(
        svgIcon!,
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(40),
      ),
    );
  }
}
