import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/features/feature_home/controller/home_controller.dart';
import 'package:innaya_app/features/feature_home/data/model/department.dart';
import 'package:innaya_app/features/feature_home/presntation/widget/card_categories_home.dart';
import 'package:innaya_app/utility/utility.dart';
class ItemSubDepartment extends StatefulWidget {
   GestureTapCallback? pressSub;

  List<DepartmentService> ?departmentService;
   ItemSubDepartment({Key? key,this.departmentService,this.pressSub}) : super(key: key);

  @override
  State<ItemSubDepartment> createState() => _ItemSubDepartmentState();
}

class _ItemSubDepartmentState extends State<ItemSubDepartment> {

  HomeController  ?homeController;


  @override
  void initState() {
    // TODO: implement initState
    homeController=Get.put(HomeController());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return Container(
      height: 130.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(
                0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:widget.departmentService!.length,
        itemBuilder: (context, index) {
          DepartmentService item=widget.departmentService![index];
          return CardCategoriesHome(
            image: item.service!.imageUrl!,
            title: item.service!.name!,
            select: item.service!.isSelect,
            typeGender: Utility.typeGender==2?1:2,
            pressCard: () async {

              setState(() {
                if(widget.departmentService![index].service!.isSelect){
                  widget.departmentService![index].service!.isSelect=false;
                }else{
                  widget.departmentService![index].service!.isSelect=true;

                }
              });
              homeController!.isVisible.value=true;
              await Future.delayed(const Duration(milliseconds:500));

            },
          );
        },
      ),
    );
  }
}
