import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:innaya_app/core/const.dart';
import 'package:innaya_app/core/error/failure.dart';
import 'package:innaya_app/core/init_app.dart';
import 'package:innaya_app/features/widget/dialog_custome_login.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/app_colors.dart';
import '../core/dynamic_links_service2.dart';

class Utility {
  static String deviceId = "ww";
  static String TypeDevice = "";
  static BuildContext? context;
  static File? fileVideo;
  static int typeGender=1;

  static playSound(String pathSound) {
/*    AssetsAudioPlayer.newPlayer().open(
      Audio(pathSound),
      autoStart: true,
        forceOpen:false
    );*/
  }

  static getRandomString(int length) {
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  static Future<String> getUId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      TypeDevice = "IOS"; // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      TypeDevice = "android"; // import 'dart:io'

      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  /* static String getText(String key) {
    String text = "";
    print("data setting");
   print(  getIt<GetSettingList>().listSetting!.length);
   for(int i=0;i< getIt<GetSettingList>().listSetting!.length;i++){
     print( getIt<GetSettingList>().listSetting![i].key);
     if( getIt<GetSettingList>().listSetting![i].key==key){
       if(key==keyInfoIcon){
         text= getIt<GetSettingList>().listSetting![i].imgUrlIcon!;
       }else{
         text= getIt<GetSettingList>().listSetting![i].value!;
       }
       return text;

     }

   }
    return text;
  }
}
*/
  void shareImage(String? imageUrl) async {
    final uri = Uri.parse(imageUrl!);
    final response = await http.get(uri);
    final bytes = response.bodyBytes;
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/image.jpg';
    File(path).writeAsBytesSync(bytes);
    await Share.shareFiles([path],
        text:
        '\nلمزيد من العروض حمل تطبيق كل العروض\n${(Platform.isIOS)
            ? kUrlAppStore
            : kUrlGooglePLay}\n ');
  }


  Future<void> ShareProduct(String id, String idCat, int type, String title,
      {String image = "", String rating = "0", String countUser = "0"}) async {
    String url = await DynamicLinksService.createDynamicLink(
        id, idCat, type, title, image: image,
        rating: rating,
        countUser: countUser);
    await Share.share("$url");
  }

  void ShareAPP() async {
    await Share.share(
        "\nتطبيق كل العروض لاجدد واحدث العروض في غزة\n${(Platform.isIOS)
            ? kUrlAppStore
            : kUrlGooglePLay}");
  }

  Future<void> RateApp() async {
    String url = (Platform.isIOS) ? kUrlAppStore : kUrlGooglePLay;
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  Future<void> SendEmail() async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.

    //await launch('mailto:${Utility.getText(keyEmail)}?subject=&body=');
  }

  openwhatsapp(String phoneNumber, {String urlImage = ""}) async {
    var whatsapp = phoneNumber;
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=$urlImage";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse(
        "$urlImage")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }

/*CheckInsertAllCatogry(){
  if(getIt<CategoryRepositories>().listCategoryMain.length>0){
    if(getIt<CategoryRepositories>().listCategoryMain[0].id==-1){
      getIt<CategoryRepositories>().listCategoryMain.removeAt(0);
    }else{

    }
  }


}*/
  int CheckDateRemining(String dateCompare) {
    print("dateCompare ${dateCompare}");

    var spliteDate = dateCompare.split("-");
    print("lenth ${spliteDate.length}");
    if (spliteDate.length != 1) {
      print(" spliteDate  ${int.parse(spliteDate[0])}");
      final birthday = DateTime(int.parse(spliteDate[0]),
          int.parse(spliteDate[1]), int.parse(spliteDate[2]));
      final date2 = DateTime.now();
      final difference = date2.compareTo(birthday);
      print("difference  $difference");
      return difference;
    } else {
      return 0;
    }
  }

/*
Future<void> shareFileWhats(String phone,String imageUrl) async {
  final uri = Uri.parse(imageUrl!);
  final response = await http.get(uri);
  final bytes = response.bodyBytes;
  final temp = await getTemporaryDirectory();
  final path = '${temp.path}/image.jpg';
  File(path).writeAsBytesSync(bytes);
  await WhatsappShare.shareFile(
    text: 'Whatsapp share text',
    phone: '${phone}',
    filePath: [path],
  );
}
*/

  launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  var httpClient = new HttpClient();

  Future<File> downloadFile(String url, String filename) async {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    Utility.fileVideo = file;
    return file;
  }


  Widget frostedRound(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: BackdropFilter(

            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05)),
                child: child)));
  }

  Widget frostedRound2(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
            decoration: BoxDecoration(
                color: kBackgroundFullScreen,

                //     border: Border.all(color: Colors.black, width: 0.5),
                shape: BoxShape.rectangle,
                boxShadow: showShadow2()

            ),
            child: child));
  }

  Widget frostedRound3(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
            decoration: BoxDecoration(
                color: kBackgroundFullScreen,

                //     border: Border.all(color: Colors.black, width: 0.5),
                shape: BoxShape.rectangle,
                boxShadow: showShadow2()

            ),
            child: child));
  }

  Widget frostedRoundOpcity(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
            decoration: BoxDecoration(
              color: kBackgroundFullScreen.withOpacity(0.5),
              //     border: Border.all(color: Colors.black, width: 0.5),
              shape: BoxShape.rectangle,

            ),
            child: child));
  }

  Widget frostedRoundNowShadow(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05)
            ),
            child: child));
  }

  Widget frostedRoundOnly(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Card(
            elevation: 5,
            child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30), child: child)));
  }

  Widget frostedParallel({Widget ?child}) {
    return SizedBox(
        child: child /*Transform(
        transform: Matrix4.skewX(-0.1),
        origin: Offset(50.0, 50.0),child:child),*/
    );
  }


  Widget frostedIconButton(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    shape: BoxShape.circle),
                child: child)));
  }


  printErorr(Failure failure) {
    getIt<ServerFailure>().mapFailureToMessage(failure);
  }

  List<BoxShadow> showShadow() {
    return [
      BoxShadow(
        color: Colors.white.withOpacity(0.5),
        spreadRadius: 3,
        blurRadius: 3,
        offset: Offset(0, 0), // changes position of shadow
      ),
    ];
  }

  List<BoxShadow> showShadow2() {
    return [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ];
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position? position;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return position!;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        /*  Get.snackbar(kErorr.tr, "Location permissions are permanently denied, we cannot request permissions.",
          backgroundColor: Colors.red, colorText: Colors.white);*/
        return position!;
      }

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.

        /*   Get.snackbar(kErorr.tr, "Location permissions are denied",
          backgroundColor: Colors.red, colorText: Colors.white);*/
        return position!;
      }
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> showMyDialogPleaseLogin(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return DialogCustomeLogin(
          pressCanecl: () {
            Get.back();
          },
          pressOk: () {

            /*     Get.to(() => ViewLogin(),
              transition: Transition.rightToLeftWithFade);*/
            //  HomePageControllerx.changedeffrentPage(0);
            //  Get.to(() => ViewAddresses());
          },
        );
      },
    );
  }
}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
