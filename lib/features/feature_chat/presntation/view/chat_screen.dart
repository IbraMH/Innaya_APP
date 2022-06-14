import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:innaya_app/core/app_size.dart';
import 'package:innaya_app/features/feature_chat/presntation/widget/card_message.dart';
import 'package:innaya_app/features/feature_chat/presntation/widget/message.dart';
import 'package:innaya_app/widget/custome_text.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  int typeGender = 1;

  ChatScreen({
    required this.typeGender,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 1)),
      isSentByMe: false,
      image: 'assets/images/profile.png',
    ),
    Message(
      text: 'Are You sure!',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 2)),
      isSentByMe: true,
      image: 'assets/images/profile.png',
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
      isSentByMe: false,
      image: 'assets/images/profile.png',
    ),
    Message(
      text: 'Are You sure!',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 4)),
      isSentByMe: true,
      image: 'assets/images/profile.png',
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(Duration(days: 2, minutes: 5)),
      isSentByMe: false,
      image: 'assets/images/profile.png',
    ),
    Message(
      text: 'Are You sure!',
      date: DateTime.now().subtract(Duration(days: 2, minutes: 6)),
      isSentByMe: true,
      image: 'assets/images/profile.png',
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(Duration(days: 2, minutes: 7)),
      isSentByMe: false,
      image: 'assets/images/profile.png',
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(Duration(days: 2, minutes: 7)),
      isSentByMe: false,
      image: 'assets/images/profile1.png',
    ),
    Message(
      text: 'Are You sure!',
      date: DateTime.now().subtract(Duration(days: 2, minutes: 8)),
      isSentByMe: true,
      image: 'assets/images/profile.png',
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 9)),
      isSentByMe: false,
      image: 'assets/images/profile.png',
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(Duration(days: 2, minutes: 7)),
      isSentByMe: false,
      image: 'assets/images/profile1.png',
    ),
    Message(
      text: 'Are You sure!',
      date: DateTime.now().subtract(Duration(days: 2, minutes: 8)),
      isSentByMe: true,
      image: 'assets/images/profile.png',
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 9)),
      isSentByMe: false,
      image: 'assets/images/profile.png',
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(Duration(days: 2, minutes: 7)),
      isSentByMe: false,
      image: 'assets/images/profile1.png',
    ),
    Message(
      text: 'Are You sure!',
      date: DateTime.now().subtract(Duration(days: 2, minutes: 8)),
      isSentByMe: true,
      image: 'assets/images/profile.png',
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 9)),
      isSentByMe: false,
      image: 'assets/images/profile.png',
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(Duration(days: 2, minutes: 7)),
      isSentByMe: false,
      image: 'assets/images/profile1.png',
    ),
    Message(
      text: 'Are You sure!',
      date: DateTime.now().subtract(Duration(days: 3, minutes: 10)),
      isSentByMe: true,
      image: 'assets/images/profile.png',
    ),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(SCREEN_WIDTH, SCREEN_HIGHT),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 10.w),
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: AssetImage(
                      'assets/images/profile.png',
                    ),
                  ),
                  Spacer(),
                  CustomeText(
                    title: 'صالون بيوتفل للجمال والصحة',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  Spacer(),
                  SizedBox(width: 30.w),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/backAB.png',
                      width: 30.w,
                      height: 30.h,
                    ),
                  ),

                  // GestureDetector(
                  //   onTap: () {
                  //     // Navigator.push(
                  //     //     context,
                  //     //     MaterialPageRoute(
                  //     //         builder: (context) =>
                  //     //             PlaceDetails()));
                  //   },
                  //   child: Card(
                  //     elevation: 5,
                  //     color: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10.r),
                  //     ),
                  //     child: Padding(
                  //       padding: EdgeInsets.symmetric(
                  //           vertical: 5.h, horizontal: 10.w),
                  //       child: Image.asset(
                  //         'assets/images/image.png',
                  //         width: 25.w,
                  //         height: 25.h,
                  //         color: Colors.grey,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 5.h),
              CustomeText(
                title: 'نشط الان',
                fontSize: 18.sp,
              ),
              SizedBox(height: 5.h),
              SizedBox(
                height: 60.h,
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsetsDirectional.only(end: 15.w),
                      child: CircleAvatar(
                        radius: 30.r,
                        backgroundImage: AssetImage(
                          'assets/images/profile1.png',
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Card(
                      elevation: 5,
                      color: Color(0xfff3f6fd),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                          top: 15.h,
                          start: 10.w,
                          end: 10.w,
                          bottom: 15.h,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: Card(
                                  elevation: 3,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child:
                                            GroupedListView<Message, DateTime>(
                                          padding: EdgeInsets.all(8.w),
                                          reverse: true,
                                          order: GroupedListOrder.DESC,
                                          // useStickyGroupSeparators: true,
                                          floatingHeader: true,
                                          elements: messages,
                                          groupBy: (message) => DateTime(
                                            message.date.year,
                                            message.date.month,
                                            message.date.day,
                                          ),
                                          groupHeaderBuilder:
                                              (Message message) => SizedBox(
                                            height: 40.h,
                                            child: Center(
                                              child: CustomeText(
                                                title: DateFormat.yMMMd()
                                                    .format(message.date),
                                                color: Colors.grey.shade700,
                                              ),
                                            ),
                                          ),
                                          itemBuilder:
                                              (context, Message message) =>
                                                  Align(
                                            alignment: message.isSentByMe
                                                ? Alignment.centerRight
                                                : Alignment.centerLeft,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                message.isSentByMe
                                                    ? CircleAvatar(
                                                        radius: 25.r,
                                                        backgroundImage:
                                                            AssetImage(
                                                          message.image,
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                Card(
                                                  elevation: 8,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.r),
                                                  ),
                                                  color: message.isSentByMe &&
                                                          widget.typeGender == 1
                                                      ? BGDate
                                                      : Colors.white,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(12.w),
                                                    child: CustomeText(
                                                      title: message.text,
                                                      color: message.isSentByMe
                                                          ? BGTextDate
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                message.isSentByMe == false
                                                    ? CircleAvatar(
                                                        radius: 25.r,
                                                        backgroundImage:
                                                            AssetImage(
                                                          message.image,
                                                        ),
                                                      )
                                                    : SizedBox(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      CardMessage(
                                        preffix: Container(
                                          padding: EdgeInsets.all(13.w),
                                          child: Image.asset(
                                            'assets/images/microphone_chat.png',
                                            width: 20.w,
                                            height: 20.h,
                                            color: widget.typeGender == 1
                                                ? titleStartPage
                                                : titleStartPage2,
                                          ),
                                        ),
                                        suffix: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              'assets/images/smile_chat.png',
                                              width: 20.w,
                                              height: 20.h,
                                              color: widget.typeGender == 1
                                                  ? titleStartPage
                                                  : titleStartPage2,
                                            ),
                                            SizedBox(width: 7.w),
                                            Image.asset(
                                              'assets/images/image.png',
                                              width: 20.w,
                                              height: 20.h,
                                              color: widget.typeGender == 1
                                                  ? titleStartPage
                                                  : titleStartPage2,
                                            ),
                                            SizedBox(width: 7.w),
                                            Card(
                                                color: widget.typeGender == 1
                                                    ? titleStartPage
                                                    : titleStartPage2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Image.asset(
                                                    'assets/images/send_chat.png',
                                                    width: 20.w,
                                                    height: 20.h,
                                                    color: Colors.white,
                                                    matchTextDirection: true,
                                                  ),
                                                )),
                                          ],
                                        ),
                                        onSubmitted: (text) {
                                          final message = Message(
                                              text: text,
                                              date: DateTime.now(),
                                              image:
                                                  'assets/images/profile.png',
                                              isSentByMe: true);
                                          setState(() {
                                            messages.add(message);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
