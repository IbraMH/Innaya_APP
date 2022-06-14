import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/features/feature_favorite/presntation/widget/container_favorite.dart';
import 'package:innaya_app/features/feature_favorite/presntation/widget/data_favorite.dart';
import 'package:innaya_app/widget/custom_app_bar.dart';
import 'package:innaya_app/widget/custome_text.dart';
import 'package:innaya_app/widget/navigation_drawer.dart';

class FavoriteScreen extends StatefulWidget {
  int typeGender = 1;

  FavoriteScreen({
    required this.typeGender,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<DataFavorite> listMyFavorite = [
    DataFavorite(
        image: 'assets/images/place01.png',
        title: 'صالون بيتفول للجمال والصحة',
        subTitle: 'صبغة شعر'),
    DataFavorite(
        image: 'assets/images/place1.png',
        title: 'صالون بيتفول للجمال والصحة',
        subTitle: 'سشوار'),
    DataFavorite(
        image: 'assets/images/place03.png',
        title: 'عيادة الاميرة للجمال والصحة',
        subTitle: 'شد وجه'),
    DataFavorite(
        image: 'assets/images/place2.png',
        title: 'عيادة الاميرة للجمال والصحة',
        subTitle: 'ازالة الشامات'),
    DataFavorite(
        image: 'assets/images/place1.png',
        title: 'مركز رماس للتدليك والساونا',
        subTitle: 'حمام مغربي'),
    DataFavorite(
        image: 'assets/images/place02.png',
        title: 'مركز رماس للتدليك والساونا',
        subTitle: 'تدليك'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        backgroundColor: BGroundStartPage,
        drawer: NavigationDrawer(typeGender: widget.typeGender),
        body: Column(
          children: [
            CustomAppBar(
              typeGender: widget.typeGender,
              pressCard: () {
                Get.back();
              },
              pressMenu: () => _key.currentState!.openDrawer(),
            ),
            CustomeText(
              title: 'المفضلة',
              fontSize: 22.sp,
              color: widget.typeGender == 1
                  ? textTitleMyReservation
                  : BGTextDateMen,
              decoration: TextDecoration.underline,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: ListView.builder(
                  itemCount: listMyFavorite.length,
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.r, vertical: 15.h),
                  itemBuilder: (context, index) {
                    DataFavorite dataMyReservation =
                        listMyFavorite.elementAt(index);
                    return ContainerFavorite(
                      title: dataMyReservation.title,
                      subTitle: dataMyReservation.subTitle,
                      image: dataMyReservation.image,
                      typeGender: widget.typeGender,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
