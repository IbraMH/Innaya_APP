import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_font.dart';
import 'package:innaya_app/core/app_images.dart';
import 'package:innaya_app/localization/lang/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:innaya_app/core/app_size.dart';

class TextFiledSearch extends StatefulWidget {
  late TextEditingController searchQuery;
  ValueChanged<String>? onSubmitted;
  FocusNode ? focusNode ;
  GestureTapCallback ?pressClose;

      TextFiledSearch({Key? key,required this.searchQuery,this.pressClose,this.onSubmitted,this.focusNode}) : super(key: key);

  @override
  State<TextFiledSearch> createState() => _TextFiledSearchState();
}

class _TextFiledSearchState extends State<TextFiledSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: kSearchFiledColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: kSearchFiledColor, width: 0.5)),
      child: TextField(
        maxLines: 1,
        minLines: 1,
          autofocus:false,
        // enabled: false,
        style:const TextStyle(
            color: kTextColor,
            fontFamily: FONT_APP,
            fontSize: fontSize13),
        textInputAction: TextInputAction.search,
        onSubmitted: widget.onSubmitted,
        focusNode: widget.focusNode,

        controller: widget.searchQuery,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(

          hintText:kSearch.tr,
          filled: true,
          fillColor: Colors.white.withOpacity(0.3),

          prefixIconConstraints: BoxConstraints(minWidth: 23, maxHeight: 20),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 5, left: 8),
            child: SvgPicture.asset(ICON_SEARCH,color: Colors.white,),
          ),
          suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 35),
          suffixIcon: GestureDetector(
            onTap: widget.pressClose,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Icon(
                Icons.close,
                color: widget.searchQuery.text.isEmpty
                    ? Colors.transparent
                    : /*kUnSelectTabColor*/Colors.white,
              ),
            ),
          ),

          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: kSearchFiledColor, width: 0.5)),
          disabledBorder:InputBorder.none,


          hintStyle: TextStyle(
              color: kBorderColor,
              fontFamily: FONT_APP,
              fontSize: fontSize15),
        ),
        textAlign: TextAlign.start,
      ),
    );;
  }
}
