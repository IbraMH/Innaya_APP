
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_font.dart';
import 'package:innaya_app/core/app_size.dart';


class TextFiledSearch extends StatefulWidget {
  late TextEditingController searchQuery;
  ValueChanged<String>? onSubmitted;
  FocusNode ? focusNode ;
  GestureTapCallback ?pressClose;
  String? imageSearch;
  int? widthImageSearch;
  int? heightImageSearch;

      TextFiledSearch({Key? key,required this.searchQuery,this.pressClose,this.onSubmitted,this.focusNode,this.imageSearch = 'assets/images/search.png',this.heightImageSearch = 30,this.widthImageSearch = 30}) : super(key: key);

  @override
  State<TextFiledSearch> createState() => _TextFiledSearchState();
}

class _TextFiledSearchState extends State<TextFiledSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
         ),
      child: TextField(
        maxLines: 1,
        minLines: 1,
          autofocus:false,
        // enabled: false,
        style:const TextStyle(
          color: titleStartPage,
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

          hintText:'ابحثي عن ...',
          filled: true,
          fillColor: Colors.white,

          prefixIconConstraints: BoxConstraints(minWidth: 23, maxHeight: 20),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 5, left: 8),
            child: Image.asset(widget.imageSearch!,width: widget.widthImageSearch!.w,height: widget.heightImageSearch!.h,)//SvgPicture.asset(ICON_SEARCH,color: Colors.white,),
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
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
              ),
          disabledBorder:InputBorder.none,


          hintStyle: TextStyle(
              color: Colors.grey,
              fontFamily: FONT_APP,
              fontSize: fontSize15),
        ),
        textAlign: TextAlign.start,
      ),
    );;
  }
}
