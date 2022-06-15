import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/features/feature_notifications/presntation/widget/item_notification.dart';
import 'package:innaya_app/widget/custom_app_bar.dart';
import 'package:innaya_app/widget/custome_text.dart';
import 'package:innaya_app/widget/navigation_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  int typeGender = 1;

  NotificationScreen({
    required this.typeGender,
  });

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BGroundStartPage,
        key: _key,
        // appBar: AppBar(),
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
            SizedBox(height: 15.h),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return ItemNotification();
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
