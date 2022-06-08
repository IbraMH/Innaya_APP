
import 'package:flutter/material.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_font.dart';


ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: kBackGroundApp,
      fontFamily: FONT_CairoFont,
      primaryColor: kColorButtom,
      //Changing this will change the color of the TabBar
      appBarTheme: appBarTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      canvasColor: Colors.transparent,
      colorScheme: const ColorScheme.light(primary: kColorButtom),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }));
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: kBorderColor,
      width: 0.5,
    ),
    gapPadding: 5,
  );

  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
    enabledBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
    labelStyle: const TextStyle(color: kColorButtom),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: kBorderFocuseColor,
        width: 0.5,
      ),
      gapPadding: 5,
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 0.5, color: kBorderColor),
      gapPadding: 5,
    ),
    border: outlineInputBorder,
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 0.5, color: Colors.red),
      gapPadding: 5,
    ),
  );
}


AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.black,
    elevation: 0,
    iconTheme: IconThemeData(color:Colors.black),

  );
}
