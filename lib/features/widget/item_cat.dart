/*
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_font.dart';
import 'package:innaya_app/core/app_images.dart';
import 'package:innaya_app/core/init_app.dart';

import 'package:innaya_app/features/widget/custome_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

class ItemCategory extends StatelessWidget {
  //final EntityCategories ? categoryElement;
  final bool isOpen;

  const ItemCategory({Key? key, this.categoryElement,this.isOpen=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
     context

          ,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(0)),
      child: SizedBox(
        height: 100.h,
        child: Row(
          children: [
            Flexible(
              child: Stack(
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(140),
                      decoration:  BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius:
                           const BorderRadius.all(Radius.circular(RADUIS_CARD_HOME)),
                        border: const Border(
                          bottom: BorderSide( //                   <--- left side
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomeText(title:categoryElement!.title!.toString(),color:Colors.black,fontSize: 13.sp,),
                              ],
                            ),
                          ),
                        ],
                      )),
                  SizedBox(width: 10.w,),
                  Flexible(
                    child: (isOpen==false)?SizedBox():AnimationLimiter(
                      child: GridView.count(
                        mainAxisSpacing: 2,
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        padding:EdgeInsets.all(0),
                        crossAxisSpacing: 2,
                        crossAxisCount: 1,
                        children: List.generate(
                          ( categoryElement!.listSubCat!.length),
                              (int index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              columnCount:1 ,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: GestureDetector(
                                    onTap: (){

                                      // Navigator.push(context, SlideRightRoute(page: SubCatView(subCat: cont.ListCatogri.value[index],)));

                                    },
                                    child: ItemCategory(
                                        categoryElement:
                                        categoryElement!.listSubCat![index]!),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
