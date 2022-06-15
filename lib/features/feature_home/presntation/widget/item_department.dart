import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/features/feature_home/data/model/department.dart';
import 'package:innaya_app/features/feature_home/presntation/widget/card_categories_home.dart';
import 'package:innaya_app/utility/utility.dart';

import 'container_type_categories.dart';

class ItemDepartment extends StatelessWidget {
  final Department department;
  final GestureTapCallback? press;
  final GestureTapCallback? pressSub;
  final bool select;
  const ItemDepartment ({Key? key,required this.department,this.select=false,this.press,this.pressSub}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return ContainerTypeCategories(
      title: department.name!,
      bGColor: Colors.white,
      select: department!.isSelect,
      typeGender:Utility.typeGender==1?2:1,
      pressCard:press,

    );
  }

  List<CardCategoriesHome> renderServices() {

    return List.generate(department.departmentService!.length, (index) {
      DepartmentService departmentService=department.departmentService![index];
      return CardCategoriesHome(
        image: departmentService.service!.imageUrl!,
        title:  departmentService.service!.name!,
        select: departmentService.service!.isSelect,
        typeGender:Utility.typeGender==1?2:1,
        pressCard:pressSub,
      );;
    });

  }
}
