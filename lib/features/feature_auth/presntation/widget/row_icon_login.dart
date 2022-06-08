import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:innaya_app/features/feature_auth/controller/login_controller.dart';
import 'package:innaya_app/utility/size_config.dart';
import 'package:innaya_app/utility/utility.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'icon_login.dart';
import 'package:get/get.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as facebook_auth;




class RowIconLogin extends StatelessWidget {
  LoginController? loginController;
  String ?_sdkVersion;
  //FacebookAccessToken _token;
  String? email;
  String? Token;
  String ?socialId;
  String? fullName;
  String ?socialType;
  String ?image = "";
  //FacebookAccessToken  token ;
 // FacebookUserProfile _profile;
  Map _userObj = {};
  Map<String, dynamic> ?_userData;
  AccessToken? _accessToken;


  RowIconLogin({this.loginController});

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    'profile',
      //'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  @override
  Widget build(BuildContext context) {
/*    plugin = FacebookLogin(debug: true);
     _getSdkVersion();
     _updateLoginInfo();*/

     return Center(
       child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center ,
        children: [
          IconLogin(svgIcon:'assets/icons/face_icon.svg',press:(){
            _handFacebookLogin(context);
           // _checkIfIsLogged();
          }),
          SizedBox(width: getProportionateScreenWidth(7),),
          IconLogin(svgIcon:'assets/icons/google_icon.svg',press:(){
            _handleSignIn();
          }),


          Visibility(
           visible:(Utility.TypeDevice=="android"?false:true),
            child:  Row(
            children: [

              SizedBox(width: getProportionateScreenWidth(7),),
              IconLogin(svgIcon:'assets/icons/apple_icon.svg',press:(){
                _handAppleSignIn();
              }),
            ],
          ),),



        //  SizedBox(width: getProportionateScreenWidth(7),),
        ],
    ),
     );
  }

  _handAppleSignIn()async{
    final isAvailable = await SignInWithApple.isAvailable();
    if (isAvailable) {
      print(isAvailable);
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email!,
          AppleIDAuthorizationScopes.fullName!,
        ],
      );
      email=credential.email;
      fullName=credential.givenName;
      socialId=credential.userIdentifier;
      socialType='apple';
      Token=credential.identityToken;
     // image=credential.
      print("apple $credential \n email :${email} \n fullName $fullName \n socialId $socialId  \n socialtype $socialType \n  token $Token");
      LoginWithSocial();
      return;
    }
  }


  _handFacebookLogin(BuildContext context) async {
    _login();
  }

  Future<void> _login() async {
   await FacebookAuth.instance.logOut().then((value) {

    });


     final LoginResult result = await FacebookAuth.instance.login(
         loginBehavior: LoginBehavior
             .dialogOnly); // by the fault we request the email and the public profile
     if (result.status == LoginStatus.success) {
       _accessToken = result!.accessToken!;
       _printCredentials();
       // get the user data
       // by default we get the userId, email,name and picture
       final userData = await FacebookAuth.instance.getUserData(
           fields: "email,name,id,picture.width(800).height(800)");
       email = userData['email'];
       fullName = userData['name'];
       socialId = _accessToken!.userId;
       socialType = 'facebook';
       Token = _accessToken!.token;
       image =
"http://graph.facebook.com/${userData["id"]}/picture?type=large";
    userData["picture"]["data"]["url"];
       print(userData);
       print("$image \n email :${email} \n fullName $fullName \n socialId $socialId  \n socialtype $socialType \n  token $Token , ${userData["picture"]}");
       FacebookAuth.instance.logOut();
       LoginWithSocial();
     } else {
       print(result.status);
       print(result.message);
     }

  }



  String prettyPrint(Map json) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String pretty = encoder.convert(json);
    return pretty;
  }

  void _printCredentials() {
    print(
      prettyPrint(_accessToken!.toJson()),
    );
  }
  Future<void> _handleSignIn() async {
    _googleSignIn.signOut();
      _googleSignIn.signIn().then((result) async {
        if (await _googleSignIn.isSignedIn()) {
          result!.authentication.then((googleKey) {
            print("user email gemail ${_googleSignIn.currentUser!.email}");
            Token = googleKey.accessToken;
            email=_googleSignIn.currentUser!.email;
            fullName=_googleSignIn.currentUser!.displayName;
            socialId=_googleSignIn.currentUser!.id;
            socialType='google';
            image = _googleSignIn.currentUser!.photoUrl;
            LoginWithSocial();
            _googleSignIn.signOut();
          }).catchError((err) {
            print("err.toString()");
            print(err.toString());
           // snackError("Error", 'inner error ${err.toString()}');
          });
        }
      }).catchError((err) {
        print("err.toString()");

        print(err.toString());

        // snackError("Error", 'error occured ${err.toString()}');
      });

  }//end

  void LoginWithSocial() {

   // refresh(2);
    var bodyData = {
      "email":email??"",
      "provider_id":socialId,
      "provider":socialType,
      //"device_token":Utility.TokenFCM,
      "device_uuid":Utility.deviceId,
      "device_os":Utility.TypeDevice,
      "access_token":Token,
      "fullName":fullName??"",
      "avatar":image??"",

    };
    print(bodyData);
    loginController!.loginWithSocial(bodyData);
 //   LoginControllerx.LoginUserWithSochial(bodyData);
  }
}


