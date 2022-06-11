import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/features/feature_home/controller/home_controller.dart';
import 'package:innaya_app/features/feature_home/data/model/department.dart';
import 'package:innaya_app/features/feature_home/presntation/widget/item_department.dart';
import 'package:innaya_app/features/feature_home/presntation/widget/item_sub_department.dart';
import 'package:shimmer/shimmer.dart';



class DepartmentListView extends StatefulWidget {
  List<Department>listDepartment;

  DepartmentListView({
    Key? key,
    required this.listDepartment
  }) : super(key: key);

  @override
  State<DepartmentListView> createState() => _DepartmentListeViewState();
}

class _DepartmentListeViewState extends State<DepartmentListView> {
  HomeController  ?homeController;

  int postionSelect=0;

  @override
  void initState() {
    // TODO: implement initState
    homeController=Get.put(HomeController());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
     context
          
          ,
      designSize: const Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return Column(
      children: [
        SizedBox(
          height: 90.h,
          child: ListView.builder(
            itemCount: widget.listDepartment.length,
              scrollDirection: Axis.horizontal,
              //physics: const NeverScrollableScrollPhysics(),

          //  shrinkWrap: true,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  SizedBox(width: 5,),

                  ItemDepartment(department: widget.listDepartment[index],
                    press: () async {

                      setState(() {
                        postionSelect=index;

                        resetItem(index);
                      });

                      homeController!.isVisible.value=false;
                      homeController!.departmentSelect.value=index;
                      await Future.delayed(const Duration(milliseconds:500));
                    },
                  ),
                  SizedBox(width: 5,)
                ],
              );
            }),
        ),
        ItemSubDepartment(departmentService:widget.listDepartment[postionSelect].departmentService,),

      ],
    );
  }

 resetItem(int index){
    for(int i=0;i<widget.listDepartment.length;i++){
      if(i==index){
        widget.listDepartment[i].isSelect=true;
      }else{
        widget.listDepartment[i].isSelect=false;
        resetSubItem(i);
      }
    }

 }

  resetSubItem(int index){
    for(int i=0;i<widget.listDepartment[index].departmentService!.length;i++){
      widget.listDepartment[index].departmentService![i].service!.isSelect=false;

    }

  }
}
