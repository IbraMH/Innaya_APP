import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';

import 'package:flutter/material.dart';
import 'package:innaya_app/localization/lang/message.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get.dart';

snackSuccess({String? title, String? body}) {
  Future.delayed(Duration(seconds: 0)).then((value) {
    Get.snackbar("${title!.tr}", "${body!.tr}",
        colorText: Colors.white,
        margin: EdgeInsets.all(8),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFF10C995).withAlpha(150));
  });
}

snackError({String? title, String ?body}) {
  Future.delayed(Duration(seconds: 0)).then((value) {
    Get.snackbar("${title!.tr}", "${body!.tr}.",
        colorText: Colors.white,
        margin: EdgeInsets.all(8),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.pink.withAlpha(150));
  });


}



hideFocus(BuildContext context) {
  FocusManager.instance.primaryFocus!.unfocus();


}

List<BoxShadow> showShadowBlack() {
  return [
    BoxShadow(
      color: Colors.black.withOpacity(0.5),
      spreadRadius: 3,
      blurRadius: 3,
      offset: Offset(0, 0), // changes position of shadow
    ),
  ];
}
List<BoxShadow> showShadowWhite() {
  return [
    BoxShadow(
      color: Colors.white.withOpacity(0.5),
      spreadRadius: 3,
      blurRadius: 3,
      offset: Offset(0, 0), // changes position of shadow
    ),
  ];
}

Widget imageNetwork(
    {String? imageUrl}) {
  return CachedNetworkImage(
    imageUrl:
    imageUrl??"",
    imageBuilder: (context, imageProvider) => Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: imageProvider, fit: BoxFit.fill),
      ),
    ),
    placeholder: (context, url) => Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        'assets/icons/loading.gif',
        width: 50,
        height: 50,
      ),
    ),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}