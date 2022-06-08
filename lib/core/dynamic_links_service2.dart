import 'dart:io';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';



class DynamicLinksService {
  static FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  static Future<String> createDynamicLink(String id,String idCat, int type,String title,
      {String image = "",String rating="0",String countUser="0"}) async {

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://carRentResrvtion.page.link',
        link: Uri.parse('https://carRentResrvtion.page.link/?id=$id&type=$type&idCat=$idCat'),
      androidParameters: const AndroidParameters(
        packageName: "com.tripleQ.innaya_app",
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.tripleQ.innaya_app',
        minimumVersion: '0',
      ),
        socialMetaTagParameters: SocialMetaTagParameters(
            title: title,
            // description: event.post?.excerpt,
            imageUrl: Uri.parse(image)
        ),
        navigationInfoParameters: NavigationInfoParameters(
            forcedRedirectEnabled: true
        )

    );

    final ShortDynamicLink shortLink =
    await dynamicLinks.buildShortLink(parameters);
    return shortLink.shortUrl.toString();
  }

  static handelDeepLink(PendingDynamicLinkData dynamicLinkData,
      {Function? function}) {
    PendingDynamicLinkData? data = dynamicLinkData;
    if (data != null) {
      Uri deepLink = data!.link;
      if (deepLink != null) {
        if (deepLink.queryParameters.containsKey('type')) {
          var typee = deepLink!.queryParameters['type'];
          int type = int.parse("$typee");
          var id = deepLink!.queryParameters['id']!;
       //   var idCat = deepLink!.queryParameters['idCat']!;
          switch (type) {
            case 0:
              {
            /*    Get.offAll(() =>
                    productDetails(
                      idCar: int.parse("$id"),
                        isDynamicLink: true, carData: CarData(),));*/
                break;
              }
            case 1:
              {

                break;
              }
            case 3:
              {


                break;
              }
          }

        }
      }else{
       /* if (function != null) {
          function!();
        }*/
      }
    }
  }

  static Future<PendingDynamicLinkData?> handleDynamicLink(BuildContext context,) async {
    PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance
        .getInitialLink();
    if (data == null) {
    } else {
      DynamicLinksService.handelDeepLink(data!);
    }
  }

  static initDynamicLinks() {
    dynamicLinks.onLink.listen((event) {
      handelDeepLink(event);
    });
  }
}
