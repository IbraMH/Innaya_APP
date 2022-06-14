import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:innaya_app/core/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innaya_app/features/feature_chat/presntation/view/chat_screen.dart';
import 'package:innaya_app/features/feature_favorite/presntation/view/favorite_screen.dart';
import 'package:innaya_app/features/feature_home/presntation/view/home_screen.dart';
import 'package:innaya_app/features/feature_home/presntation/widget/container_type_categories.dart';
import 'package:innaya_app/features/feature_my_reservation/presntation/widget/data_my_reservation.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/alert_dialog_map.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/alert_dialog_stare.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/card_categories_place_details.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/card_top_rated.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/container_btn.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/container_btn_confirm.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/container_check.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/container_conf_bo.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/container_reservation_place_details.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/container_service.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/container_time.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/data_image_details.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/data_my_reservation_place_details.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/data_service_details.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/divider_check.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/image_details.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/item_column_emp_details.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/item_column_image_details.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/item_reservation_container.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/item_row_card_note.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/item_row_confirm_details.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/item_row_service.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/persentIndicator.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/text_check.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/top_rated_data.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/card_image_slider.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/data_image_slider.dart';
import 'package:innaya_app/features/feature_place_details/presntation/widget/item_row_title.dart';
import 'package:innaya_app/features/feature_places/presntation/widget/card_categories_place.dart';
import 'package:innaya_app/features/feature_places/presntation/widget/categories_data_place.dart';
import 'package:innaya_app/widget/custom_textfilled_app.dart';
import 'package:innaya_app/widget/custome_text.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

class PlaceDetails extends StatefulWidget {
  int page = 1;
  int typeGender = 1;

  PlaceDetails({
    required this.page,
    required this.typeGender,
  });

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  PageController? controller;
  int selectedImage = 0;
  int selectedContainer = -1;
  int? indexList;
  int indexContainer = 1;
  int indexGridTime = -1;
  bool isToggled = false;
  int selectWidgetReservation = 1;
  bool showDate = false;
  bool showTime = false;
  bool showRow = false;
  bool showSwBtn = false;
  bool isVisible = false;
  bool selectCard = false;

  DateTime date = DateTime.now();
  final firstDate = DateTime(1900);
  final lastDate = DateTime(2100);

  TextEditingController? notesController;

  List<CategoriesDataPlace> listCategory1 = [
    CategoriesDataPlace(
        title: 'قص شعر', image: 'assets/images/1.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'مكياج', image: 'assets/images/2.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'تضفير', image: 'assets/images/3.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'سشوار', image: 'assets/images/4.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'صبغات', image: 'assets/images/5.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'غسيل', image: 'assets/images/6.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'سبا', image: 'assets/images/7.png', numberProduct: 0),
  ];

  List<CategoriesDataPlace> listCategory3 = [
    CategoriesDataPlace(
        title: 'الاسترخاء', image: 'assets/images/17.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'الانعكاسي', image: 'assets/images/18.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'بالاحجار', image: 'assets/images/19.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'بالزيت', image: 'assets/images/20.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'بالعطر', image: 'assets/images/21.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'السويدي', image: 'assets/images/22.png', numberProduct: 0),
  ];

  List<CategoriesDataPlace> listCategory2 = [
    CategoriesDataPlace(
        title: 'شد الجلد', image: 'assets/images/10.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'تكبير الثدي', image: 'assets/images/11.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'تصغير الثدي', image: 'assets/images/12.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'شفط الدهون', image: 'assets/images/13.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'حقن الدهون', image: 'assets/images/14.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'شد الوجه', image: 'assets/images/15.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'ازالة الشامات',
        image: 'assets/images/16.png',
        numberProduct: 0),
  ];

  List<CategoriesDataPlace> listCategoryMen1 = [
    CategoriesDataPlace(
        title: 'قص شعر', image: 'assets/images/1.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'حلق لحية', image: 'assets/images/men2.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'فرد الشعر', image: 'assets/images/men3.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'سشوار', image: 'assets/images/4.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'صبغات', image: 'assets/images/5.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'غسيل', image: 'assets/images/men6.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'ماسكات', image: 'assets/images/men7.png', numberProduct: 0),
  ];

  List<CategoriesDataPlace> listCategoryMen2 = [
    CategoriesDataPlace(
        title: 'شد الجلد', image: 'assets/images/10.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'تصغير الثدي',
        image: 'assets/images/men11.png',
        numberProduct: 0),
    CategoriesDataPlace(
        title: 'شفط الدهون',
        image: 'assets/images/men12.png',
        numberProduct: 0),
    CategoriesDataPlace(
        title: 'حقن الدهون',
        image: 'assets/images/men13.png',
        numberProduct: 0),
    CategoriesDataPlace(
        title: 'شد الوجه', image: 'assets/images/men14.png', numberProduct: 0),
    CategoriesDataPlace(
        title: 'ازالة الشامات',
        image: 'assets/images/men15.png',
        numberProduct: 0),
  ];

  List<DataImageSlider> listImageSlider = <DataImageSlider>[
    DataImageSlider(image: 'assets/images/place1.png', index: 0),
    DataImageSlider(image: 'assets/images/place2.png', index: 1),
    DataImageSlider(image: 'assets/images/place3.png', index: 2),
    DataImageSlider(image: 'assets/images/place4.png', index: 3),
    DataImageSlider(image: 'assets/images/place1.png', index: 4),
    DataImageSlider(image: 'assets/images/place2.png', index: 5),
  ];

  List<DataImageSlider> listImageSlider2 = <DataImageSlider>[
    DataImageSlider(image: 'assets/images/place01.png', index: 0),
    DataImageSlider(image: 'assets/images/place02.png', index: 1),
    DataImageSlider(image: 'assets/images/place03.png', index: 2),
    DataImageSlider(image: 'assets/images/place04.png', index: 3),
    DataImageSlider(image: 'assets/images/place05.png', index: 4),
    DataImageSlider(image: 'assets/images/place01.png', index: 5),
  ];

  List<DataImageSlider> listImageSlider3 = <DataImageSlider>[
    DataImageSlider(image: 'assets/images/40.png', index: 0),
    DataImageSlider(image: 'assets/images/41.png', index: 1),
    DataImageSlider(image: 'assets/images/42.png', index: 2),
    DataImageSlider(image: 'assets/images/43.png', index: 3),
    DataImageSlider(image: 'assets/images/44.png', index: 4),
    DataImageSlider(image: 'assets/images/40.png', index: 5),
  ];

  List<TopRatedData> listTopRated = [
    TopRatedData(
        image: 'assets/images/01.jpg', title: 'سوزان', subTitle: 'مصففة شعر'),
    TopRatedData(
        image: 'assets/images/02.jpg', title: 'سناء', subTitle: 'مكياج'),
    TopRatedData(
        image: 'assets/images/03.jpg', title: 'سعاد', subTitle: 'صبغ شعر'),
    TopRatedData(
        image: 'assets/images/04.jpg', title: 'سميرة', subTitle: 'تضفير'),
    TopRatedData(
        image: 'assets/images/05.jpg', title: 'سوسن', subTitle: 'سشوار'),
  ];

  List<TopRatedData> listTopRated2 = [
    TopRatedData(
        image: 'assets/images/dr1.png',
        title: 'د. خليل المصري',
        subTitle: 'جراحة تجميل'),
    TopRatedData(
        image: 'assets/images/dr2.png',
        title: 'د. يوسف الحميدي',
        subTitle: 'اخصائي ترميم'),
    TopRatedData(
        image: 'assets/images/d3.png',
        title: 'د.سعاد المصري',
        subTitle: 'اخصائي ليزر'),
    TopRatedData(
        image: 'assets/images/d4.png',
        title: 'د. سميرة سعيد',
        subTitle: 'جراحة تجميل'),
  ];

  List<TopRatedData> listTopRated3 = [
    TopRatedData(
        image: 'assets/images/h1.jpg', title: 'محمد', subTitle: 'حلاق'),
    TopRatedData(
        image: 'assets/images/h2.jpg', title: 'خالد', subTitle: 'حلاق'),
    TopRatedData(
        image: 'assets/images/h3.jpg', title: 'جهاد', subTitle: 'حلاق'),
    TopRatedData(
        image: 'assets/images/h4.jpg', title: 'صهيب', subTitle: 'حلاق'),
    TopRatedData(
        image: 'assets/images/h5.jpg', title: 'رامي', subTitle: 'حلاق'),
  ];

  List<DataServiceDetails> listDataService = [
    DataServiceDetails(
        title: 'قص شعر',
        image: 'assets/images/1.png',
        price: '120 ر. س',
        time: '30  دقيقة'),
    DataServiceDetails(
        title: 'مكياج',
        image: 'assets/images/2.png',
        price: '300 ر. س',
        time: '50  دقيقة'),
    DataServiceDetails(
        title: 'تضفير',
        image: 'assets/images/3.png',
        price: '140 ر. س',
        time: '30  دقيقة'),
    DataServiceDetails(
        title: 'صبغة شعر',
        image: 'assets/images/4.png',
        price: '200 ر. س',
        time: '60  دقيقة'),
  ];

  List<DataServiceDetails> listDataService2 = [
    DataServiceDetails(
        title: 'شد الوجه',
        image: 'assets/images/z1.png',
        price: '120 ر. س',
        time: '30  دقيقة'),
    DataServiceDetails(
        title: 'تكبير الثدي',
        image: 'assets/images/z2.png',
        price: '300 ر. س',
        time: '50  دقيقة'),
    DataServiceDetails(
        title: 'تصغير الثدي',
        image: 'assets/images/z3.png',
        price: '140 ر. س',
        time: '30  دقيقة'),
    DataServiceDetails(
        title: 'شفط الدهون',
        image: 'assets/images/z4.png',
        price: '200 ر. س',
        time: '60  دقيقة'),
    DataServiceDetails(
        title: 'حقن الدهون',
        image: 'assets/images/z5.png',
        price: '200 ر. س',
        time: '60  دقيقة'),
  ];

  List<DataServiceDetails> listDataService3 = [
    DataServiceDetails(
        title: 'مساج بالاحجار',
        image: 'assets/images/90.png',
        price: '120 ر. س',
        time: '30  دقيقة'),
    DataServiceDetails(
        title: 'مساج حوامل',
        image: 'assets/images/91.png',
        price: '300 ر. س',
        time: '50  دقيقة'),
    DataServiceDetails(
        title: 'مساج الانعكاسي',
        image: 'assets/images/92.png',
        price: '140 ر. س',
        time: '30  دقيقة'),
    DataServiceDetails(
        title: 'المساج بالزيت',
        image: 'assets/images/93.png',
        price: '200 ر. س',
        time: '60  دقيقة'),
    DataServiceDetails(
        title: 'مساج الضهر',
        image: 'assets/images/93.png',
        price: '200 ر. س',
        time: '60  دقيقة'),
  ];

  var listTime = [
    '11:00-12:00 AM',
    '10:00-11:00 AM',
    '09:00-10:00 AM',
    '02:00-03:00 PM',
    '01:00-02:00 PM',
    '12:00-01:00 PM',
    '05:00-06:00 PM',
    '04:00-05:00 PM',
    '03:00-04:00 PM',
  ];

  List<DataMyReservationPlaceDetails> listMyReservation = [
    DataMyReservationPlaceDetails(
        date: 'May 22',
        time: '11:00 AM',
        image: 'assets/images/logoRe1.png',
        title: 'صالون بيتفول للجمال والصحة',
        subTitle: 'صبغة شعر'),
    DataMyReservationPlaceDetails(
        date: 'May 22',
        time: '12:00 AM',
        image: 'assets/images/logoRe1.png',
        title: 'صالون بيتفول للجمال والصحة',
        subTitle: 'سشوار'),
    DataMyReservationPlaceDetails(
        date: 'June 05',
        time: '11:00 AM',
        image: 'assets/images/logoRe2.png',
        title: 'عيادة الاميرة للجمال والصحة',
        subTitle: 'شد وجه'),
    DataMyReservationPlaceDetails(
        date: 'June 05',
        time: '02:00 PM',
        image: 'assets/images/logoRe2.png',
        title: 'عيادة الاميرة للجمال والصحة',
        subTitle: 'ازالة الشامات'),
    DataMyReservationPlaceDetails(
        date: 'June 15',
        time: '02:00 PM',
        image: 'assets/images/logoRe3.png',
        title: 'مركز رماس للتدليك والساونا',
        subTitle: 'حمام مغربي'),
    DataMyReservationPlaceDetails(
        date: 'June 15',
        time: '11:00 AM',
        image: 'assets/images/logoRe3.png',
        title: 'مركز رماس للتدليك والساونا',
        subTitle: 'تدليك'),
  ];

  var numRate = [100,70,130,40,7];
  int sum = 0;
  // double average = 0;
  int sumNumRate(){
    for(int i = 0; i<=numRate.length;i++){
      sum = sum + numRate[i];
    }
    print('sumsum $sum');
    return sum;
  }

  double _initialRating = 2;
  late double _rating;
  late final _ratingController;

  Future<bool> _onWillPopStare() async {
    return await showDialog(
          context: context,
          // barrierDismissible: true,
          builder: (context) => AlertDialogStareFun(
            typeGender: widget.typeGender,
            notesController: notesController,
            initialRating: _initialRating,
            rating: _rating,
            ratingController: _ratingController,
          ),
        ) ??
        false;
  }

  Future<bool> _onWillPopMap() async {
    return await showDialog(
          context: context,
          // barrierDismissible: true,
          builder: (context) => AlertDialogMapFun(),
        ) ??
        false;
  }






  @override
  void initState() {
    // TODO: implement initState
    controller = PageController();
    notesController = TextEditingController();
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
    // average = numRate[0]/sumNumRate();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    notesController!.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: BGroundStartPage,
        body: Column(
          children: [
            SizedBox(
              height: 250.h,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: controller,
                    itemCount: widget.page == 1
                        ? listImageSlider.length
                        : widget.page == 2
                            ? listImageSlider2.length
                            : listImageSlider3.length,
                    clipBehavior: Clip.antiAlias,
                    onPageChanged: (index) {
                      setState(() {
                        selectedImage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      DataImageSlider listImagesSlider = widget.page == 1
                          ? listImageSlider.elementAt(selectedImage)
                          : widget.page == 2
                              ? listImageSlider2.elementAt(selectedImage)
                              : listImageSlider3.elementAt(selectedImage);
                      return Image.asset(
                        listImagesSlider.image,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        isAntiAlias: true,
                      );
                    },
                  ),
                  Column(
                    children: [
                      ImageDetails(
                        image: widget.typeGender == 1
                            ? 'assets/images/chat2.png'
                            : 'assets/images/chat_men.png',
                        onTap: () {
                          Get.to(ChatScreen(typeGender: widget.typeGender));
                        },
                      ),
                      ImageDetails(
                          image: widget.typeGender == 1
                              ? 'assets/images/favorite2.png'
                              : 'assets/images/favorite_men.png'),
                      ImageDetails(
                          image: widget.typeGender == 1
                              ? 'assets/images/share2.png'
                              : 'assets/images/share_men.png'),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 55.w),
                      ImageDetails(
                          image: widget.typeGender == 1
                              ? 'assets/images/whatsapp.png'
                              : 'assets/images/whatsapp.png'),
                      ImageDetails(
                          image: widget.typeGender == 1
                              ? 'assets/images/call.png'
                              : 'assets/images/call_men.png'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ImageDetails(
                        onTap: () {
                          _onWillPopStare();
                        },
                        image: widget.typeGender == 1
                            ? 'assets/images/stare.png'
                            : 'assets/images/stare.png',
                      ),
                      SizedBox(width: 55.w),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            elevation: 5,
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0.h, horizontal: 8.w),
                              child: CustomeText(
                                title: 'OPEN',
                                color: Colors.white,
                                textAlign: TextAlign.center,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      // SizedBox(
                      //   height: 55.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Image.asset(
                                    widget.typeGender == 1
                                        ? 'assets/images/back.png'
                                        : 'assets/images/back_men.png',
                                    width: 55.w,
                                    height: 55.h,
                                  )),
                              ImageDetails(
                                  onTap: () {
                                    _onWillPopMap();
                                  },
                                  image: widget.typeGender == 1
                                      ? 'assets/images/map.png'
                                      : 'assets/images/map.png'),
                              ImageDetails(
                                  image: widget.typeGender == 1
                                      ? 'assets/images/video.png'
                                      : 'assets/images/video_men.png'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 5.h,
                    right: 0,
                    left: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: SizedBox(
                        height: 50.h,
                        child: ListView.builder(
                          itemCount: listImageSlider.length,
                          scrollDirection: Axis.horizontal,
                          // controller: controller,
                          itemBuilder: (context, index) {
                            DataImageSlider listImagesSlider =
                                listImageSlider.elementAt(index);
                            return CardImageSlider(
                              select: selectedImage == index ? true : false,
                              image: listImagesSlider.image,
                              pressCard: () {
                                setState(() {
                                  selectedImage = index;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ContainerTypeCategories(
                          title: widget.page == 1
                              ? 'عن الصالون'
                              : widget.page == 2
                                  ? 'عن المركز'
                                  : 'عن المركز',
                          bGColor: Colors.white,
                          select: indexContainer == 1 ? true : false,
                          typeGender: widget.typeGender,
                          pressCard: () {
                            setState(() {
                              if (indexContainer != 1) {
                                indexContainer = 1;
                                showTime = false;
                                showSwBtn = false;
                                showRow = false;
                                showDate = false;
                                selectCard = false;
                                selectedContainer = -1;
                                indexGridTime = -1;
                                date = DateTime.now();
                              }
                            });
                          },
                        ),
                        SizedBox(width: 10.w),
                        ContainerTypeCategories(
                          title: 'الخدمات',
                          select: indexContainer == 2 ? true : false,
                          typeGender: widget.typeGender,
                          pressCard: () {
                            setState(() {
                              if (indexContainer != 2) {
                                indexContainer = 2;
                                showTime = false;
                                showSwBtn = false;
                                showRow = false;
                                showDate = false;
                                selectCard = false;
                                selectedContainer = -1;
                                indexGridTime = -1;
                                date = DateTime.now();
                              }
                            });
                          },
                        ),
                        SizedBox(width: 10.w),
                        ContainerTypeCategories(
                          title: 'الحجوزات',
                          select: indexContainer == 3 ? true : false,
                          typeGender: widget.typeGender,
                          pressCard: () {
                            setState(() {
                              if (indexContainer != 3) {
                                indexContainer = 3;
                                selectWidgetReservation = 1;
                                showTime = false;
                                showSwBtn = false;
                                showRow = false;
                                showDate = false;
                                selectCard = false;
                                selectedContainer = -1;
                                indexGridTime = -1;
                                date = DateTime.now();
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 10,
                              blurRadius: 12,
                              offset:
                                  Offset(0, 23), // changes position of shadow
                            ),
                          ],
                        ),
                        child: indexContainer == 1
                            ? columnAbout()
                            : indexContainer == 2
                                ? services()
                                : reservation(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget columnAbout() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 60.w, end: 20.w),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10.w),
                    CustomeText(
                      title: widget.page == 1
                          ? 'صالون بيوتفل للجمال والصحة'
                          : widget.page == 2
                              ? 'عيادة الاميرة للتجميل'
                              : 'مركز الاميرة للتدليك والساونا',
                      fontSize: 16.sp,
                      color: widget.typeGender == 1
                          ? titleStartPage
                          : titleStartPage2,
                      fontWeight: FontWeight.w700,
                    ),
                    Spacer(),
                    Container(
                      height: 30.h,
                      width: 85.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: widget.typeGender == 1
                            ? BGroundCategoryHomePage
                            : BGroundCategoryHomePageMen,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: CustomeText(
                        title: 'احجز الان',
                        color: widget.typeGender == 1
                            ? titleStartPage
                            : titleStartPage2,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                ItemRowTitle(
                  title: 'الرياض , شارع الملك عبد العزيز',
                  image: 'assets/images/location2.png',
                  typeGender: widget.typeGender,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    ItemRowTitle(
                      title: '(1260) مشاهدة',
                      image: 'assets/images/show.png',
                      typeGender: widget.typeGender,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        CustomeText(
                          title: '(350)',
                          fontSize: 12.sp,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(width: 5.w),
                        RatingBar.builder(
                          textDirection: TextDirection.ltr,
                          ignoreGestures: true,
                          initialRating: 4.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0),
                          itemSize: 12,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: widget.typeGender == 1
                                ? titleStartPage
                                : titleStartPage2,
                          ),
                          onRatingUpdate: (rating) {
                            // ProductGetxController.to.rattingProduct(
                            //     productId: controller.productsDetails[0]!.id,
                            //     context: context,
                            //     rate: rating);
                          },
                        ),
                        SizedBox(width: 25.w),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w),
                child: CustomeText(
                  title: 'نبذة',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color:
                      widget.typeGender == 1 ? titleStartPage : titleStartPage2,
                ),
              ),
              SizedBox(
                width: 300.w,
                child: Divider(
                  height: 40.h,
                  thickness: 2.h,
                  color:
                      widget.typeGender == 1 ? titleStartPage : titleStartPage2,
                  endIndent: 20.w,
                  indent: 70.w,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 40.w, end: 40.w),
            child: CustomeText(
              title: widget.page == 1
                  ? 'صالون بيتيفول للجمال والصحة أحد أفضل صالونات التجميل في سط مدينة دبي, والذي حاز على شهرة كبيرة من قبل الرجال والنساء على حدٍ سواءٍ, حيث يحصل الرجال على مجموعة من الخدمات, بما في ذلك قص الشعر وحلاقة اللحية والعناية بالوجه, أما بالنسبة للسيدات, فهناك خدمات متعددة لهن, مثل المكياج والعناية بالشعر ولا سيما الأظافر وجلسات العناية بالبشرة. '
                  : widget.page == 2
                      ? 'فريق مؤهل من الأخصائيين الذين يستخدمون مواداً عالية الجودة, وطاقم تمريض كفء ومتفانٍ . معايير الجودة هنا ليست شعارات جوفاء؛ فبالإضافة للخبرة, يقوم طاقم المستشفى بالتركيز على آراء العملاء, للتأكد من إحساس عملائهم بأنهم يتلقون أفضل معاملة بكل معنى الكلمة, منذ الفحص الأولي, وحتى أخر الإجراءات الطبية. تتم كل الفحوصات والإجراءات بواسطة جراحي تجميل'
                      : 'فريق مؤهل من الأخصائيين الذين يستخدمون مواداً عالية الجودة, وطاقم تمريض كفء ومتفانٍ . معايير الجودة هنا ليست شعارات جوفاء؛ فبالإضافة للخبرة, يقوم طاقم المستشفى بالتركيز على آراء العملاء, للتأكد من إحساس عملائهم بأنهم يتلقون أفضل معاملة بكل معنى الكلمة, منذ الفحص الأولي, وحتى أخر الإجراءات الطبية. تتم كل الفحوصات والإجراءات بواسطة جراحي تجميل',
              fontSize: 12.sp,
              color: Colors.black,
              fontHeight: 1.8.h,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w),
                child: CustomeText(
                  title: 'مواعيد العمل',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color:
                      widget.typeGender == 1 ? titleStartPage : titleStartPage2,
                ),
              ),
              SizedBox(
                width: 250.w,
                child: Divider(
                  height: 40.h,
                  thickness: 2.h,
                  color:
                      widget.typeGender == 1 ? titleStartPage : titleStartPage2,
                  endIndent: 32.w,
                  indent: 7.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.w),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomeText(
                    title: 'السبت - الخميس',
                    fontSize: 16.sp,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w800,
                  ),
                  SizedBox(width: 20.w),
                  CustomeText(
                    title: '8:00 ص   الى   9:00 م',
                    fontSize: 14.sp,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w800,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w),
                child: CustomeText(
                  title: 'طاقم العمل',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color:
                      widget.typeGender == 1 ? titleStartPage : titleStartPage2,
                ),
              ),
              SizedBox(
                width: 250.w,
                child: Divider(
                  height: 40.h,
                  thickness: 2.h,
                  color:
                      widget.typeGender == 1 ? titleStartPage : titleStartPage2,
                  endIndent: 25.w,
                  indent: 15.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.w),
          SizedBox(
            height: 270.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.page == 1 && widget.typeGender == 1
                  ? listTopRated.length
                  : widget.page == 1 && widget.typeGender == 2
                      ? listTopRated3.length
                      : widget.page == 2
                          ? listTopRated2.length
                          : widget.typeGender == 1
                              ? listTopRated.length
                              : listTopRated3.length,
              itemBuilder: (context, index) {
                TopRatedData closestData =
                    widget.page == 1 && widget.typeGender == 1
                        ? listTopRated.elementAt(index)
                        : widget.page == 1 && widget.typeGender == 2
                            ? listTopRated3.elementAt(index)
                            : widget.page == 2
                                ? listTopRated2.elementAt(index)
                                : widget.typeGender == 1
                                    ? listTopRated.elementAt(index)
                                    : listTopRated3.elementAt(index);
                return CardTopRated(
                  title: closestData.title,
                  subTitle: closestData.subTitle,
                  image: closestData.image,
                );
              },
            ),
          ),
          SizedBox(height: 15.w),
          Row(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w),
                child: CustomeText(
                  title: 'اراء الزبائن',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color:
                      widget.typeGender == 1 ? titleStartPage : titleStartPage2,
                ),
              ),
              SizedBox(
                width: 250.w,
                child: Divider(
                  height: 40.h,
                  thickness: 2.h,
                  color:
                      widget.typeGender == 1 ? titleStartPage : titleStartPage2,
                  endIndent: 10.w,
                  indent: 30.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.w),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              'assets/images/star.png',
                              width: 100.w,
                              height: 100.h,

                            ),
                            Positioned(
                              left: 37.w,
                              top: 37.h,
                              child: CustomeText(
                                title: '3.6',
                                fontSize: 20.sp,
                                textAlign: TextAlign.center,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        CustomeText(
                          title: 'متوسط التقييمات',
                          fontSize: 14.sp,
                          color: widget.typeGender==1?titleStartPage:titleStartPage2,
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        PersentIndicator(leading: '5 نجوم', trailing: numRate[0].toString(), percent: numRate[0]/347),
                        SizedBox(height: 5.h),
                        PersentIndicator(leading: '4 نجوم', trailing: numRate[1].toString(), percent: numRate[1]/347),
                        SizedBox(height: 5.h),
                        PersentIndicator(leading: '3 نجوم', trailing: numRate[2].toString(), percent: numRate[2]/347),
                        SizedBox(height: 5.h),
                        PersentIndicator(leading: '2 نجوم', trailing: numRate[3].toString(), percent: numRate[3]/347),
                        SizedBox(height: 5.h),
                        PersentIndicator(leading: '1 نجوم', trailing: numRate[4].toString(), percent: numRate[4]/347),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 15.w),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Container(
                width: double.infinity,
                height: 400.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ItemColumnEmpDetails();
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 25.w),
        ],
      ),
    );
  }

  Widget services() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.page == 1
                ? listDataService.length
                : widget.page == 2
                    ? listDataService2.length
                    : listDataService3.length,
            itemBuilder: (context, index) {
              DataServiceDetails listImages = widget.page == 1
                  ? listDataService.elementAt(index)
                  : widget.page == 2
                      ? listDataService2.elementAt(index)
                      : listDataService3.elementAt(index);
              return ContainerService(
                  title: listImages.title,
                  image: listImages.image,
                  time: listImages.time,
                  price: listImages.price,
                  page: widget.page,
                  typeGender: widget.typeGender,
                  indexList: index);
            },
          ),
        ),
        SizedBox(height: 15.h),
      ],
    );
  }

  Widget reservation() {
    return Column(
      children: [
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 30.w),
            Column(
              children: [
                Image.asset(
                  selectWidgetReservation == 1
                      ? 'assets/images/confirm1.png'
                      : selectWidgetReservation == 2
                          ? 'assets/images/confirm2.png'
                          : 'assets/images/confirm3.png',
                  width: 250.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCheck(
                      title: 'الانتهاء',
                      typeGender: widget.typeGender,
                    ),
                    SizedBox(width: 75.w),
                    TextCheck(
                      title: 'الدفع',
                      typeGender: widget.typeGender,
                    ),
                    SizedBox(width: 85.w),
                    TextCheck(
                      title: 'الحجز',
                      typeGender: widget.typeGender,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 20.w),
            selectWidgetReservation == 2 || selectWidgetReservation == 3
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectWidgetReservation == 3) {
                          selectWidgetReservation = 2;
                        } else {
                          selectWidgetReservation = 1;
                        }
                      });
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/backAB.png',
                          width: 25.w,
                          height: 25.h,
                          color: widget.typeGender == 1
                              ? titleStartPage
                              : titleStartPage2,
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     ContainerCheck(),
        //     SizedBox(width: 10.w),
        //     DividerCheck(),
        //     SizedBox(width: 10.w),
        //     ContainerCheck(),
        //     SizedBox(width: 10.w),
        //     DividerCheck(),
        //     SizedBox(width: 10.w),
        //     ContainerCheck(),
        //   ],
        // ),

        selectWidgetReservation == 1
            ? columnReservation()
            : selectWidgetReservation == 2
                ? columnConfirmReservation()
                : columnConfirm(),
      ],
    );
  }

  Widget columnReservation() {
    return Expanded(
      child: Column(
        children: [
          ItemReservationContainer(
            title: 'نوع الخدمة',
            image: 'assets/images/service.png',
            typeGender: widget.typeGender,
            heightContainer: 130,
            widget: SizedBox(
              height: 75.h,
              child: ListView.builder(
                itemCount: widget.page == 1
                    ? listCategory1.length
                    : widget.page == 2
                        ? listCategory2.length
                        : listCategory3.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsetsDirectional.only(start: 15.w),
                itemBuilder: (context, index) {
                  CategoriesDataPlace categoryDataPlace = widget.page == 1
                      ? listCategory1.elementAt(index)
                      : widget.page == 2
                          ? listCategory2.elementAt(index)
                          : listCategory3.elementAt(index);
                  return CardCategoriesPlaceDetails(
                    image: categoryDataPlace.image,
                    title: categoryDataPlace.title,
                    sizeImage: 30,
                    fontSize: 14,
                    space: 5,
                    select: selectedContainer == index ? true : false,
                    numProduct: categoryDataPlace.numberProduct!,
                    showWidget: categoryDataPlace.numberProduct! != 0
                        ? isVisible
                        : false,
                    typeGender: widget.typeGender,
                    pressCard: () {
                      setState(() {
                        if (selectedContainer != index) {
                          selectedContainer = index;
                          showDate = true;
                          indexList = index;
                        } else {
                          selectedContainer = -1;
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  showDate
                      ? ItemReservationContainer(
                          title: 'التاريخ',
                          image: 'assets/images/calendar.png',
                          typeGender: widget.typeGender,
                          heightContainer: 150,
                          widget: SizedBox(
                            height: 80.h,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: WeeklyDatePicker(
                                selectedDay: date,
                                changeDay: (value) => setState(() {
                                  date = value;
                                  showTime = true;
                                }),
                                selectedDigitColor: widget.typeGender == 1
                                    ? titleStartPage
                                    : titleStartPage2,
                                enableWeeknumberText: false,
                                weeknumberColor: widget.typeGender == 1
                                    ? titleStartPage
                                    : titleStartPage2,
                                weeknumberTextColor: widget.typeGender == 1
                                    ? titleStartPage
                                    : titleStartPage2,
                                backgroundColor:
                                    widget.typeGender == 1 ? BGDate : BGDateMen,
                                weekdayTextColor: widget.typeGender == 1
                                    ? BGTextDate
                                    : BGTextDateMen,
                                digitsColor: widget.typeGender == 1
                                    ? BGTextDate
                                    : BGTextDateMen,
                                selectedBackgroundColor: Colors.white,
                                weekdays: [
                                  "Sun",
                                  "Mon",
                                  "Tue",
                                  "Wed",
                                  "Thu",
                                  "Fri",
                                  "Sat"
                                ],
                                daysInWeek: 7,
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                  showTime
                      ? ItemReservationContainer(
                          title: 'الساعة',
                          image: 'assets/images/clock.png',
                          typeGender: widget.typeGender,
                          heightContainer: 200,
                          widget: SizedBox(
                            height: 145.h,
                            child: GridView.builder(
                              itemCount: listTime.length,
                              padding: EdgeInsets.all(5.h),
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 2.8,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5),
                              itemBuilder: (context, index) {
                                String time = listTime.elementAt(index);
                                return ContainerTime(
                                  title: time,
                                  select: indexGridTime == index ? true : false,
                                  typeGender: widget.typeGender,
                                  presCard: () {
                                    setState(() {
                                      if (indexGridTime != index) {
                                        indexGridTime = index;
                                        showRow = true;
                                      } else {
                                        indexGridTime = -1;
                                      }
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                        )
                      : SizedBox(),
                  /*ItemReservationContainer(
                title: 'ملاحظات',
                image: 'assets/images/notes.png',
                typeGender: widget.typeGender,
                heightContainer: 190,
                widget: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: CustomTextFilledApp(
                    hintText: 'اكتب ملاحظة ',
                    typeGender: widget.typeGender,
                    controller: notesController,
                  ),
                ),
              ),*/
                  SizedBox(height: 15.h),
                  showRow
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ItemRowCardNote(
                                image: 'assets/images/add_note.png',
                                title: 'اضف \nملاحظة'),
                            SizedBox(width: 25.w),
                            ItemRowCardNote(
                              image: 'assets/images/add_to_res.png',
                              title: 'اضف لقائمة \nالحجوزات',
                              select: selectCard,
                              presCard: () {
                                setState(() {
                                  CategoriesDataPlace categoryDataPlace = widget
                                              .page ==
                                          1
                                      ? listCategory1.elementAt(indexList!)
                                      : widget.page == 2
                                          ? listCategory2.elementAt(indexList!)
                                          : listCategory3.elementAt(indexList!);

                                  if (selectCard == false) {
                                    selectCard = true;
                                    showSwBtn = true;
                                    categoryDataPlace.numberProduct =
                                        categoryDataPlace.numberProduct! + 1;
                                    isVisible = true;
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 25.w),
                            showSwBtn
                                ? ItemRowCardNote(
                                    image: 'assets/images/new_res.png',
                                    title: 'اضف حجز \nجديد',
                                    presCard: () {
                                      setState(() {
                                        showTime = false;
                                        showSwBtn = false;
                                        showRow = false;
                                        showDate = false;
                                        selectCard = false;
                                        selectedContainer = -1;
                                        indexGridTime = -1;
                                        date = DateTime.now();
                                      });
                                    },
                                  )
                                : SizedBox(),
                          ],
                        )
                      : SizedBox(),
                  SizedBox(height: 15.h),
                  showSwBtn
                      ? Row(
                          children: [
                            SizedBox(width: 30.w),
                            FlutterSwitch(
                              width: 60.w,
                              height: 25.h,
                              padding: 2.0,
                              toggleSize: 20.0,
                              borderRadius: 15.0,
                              activeColor: titleStartPage,
                              value: isToggled,
                              // activeIcon: ,
                              onToggle: (value) {
                                setState(() {
                                  isToggled = value;
                                });
                              },
                            ),
                            SizedBox(width: 15.w),
                            CustomeText(
                              title: 'ارسال رسالة تذكير قبل الموعد بساعة',
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ],
                        )
                      : SizedBox(),
                  SizedBox(height: 15.h),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectWidgetReservation = 2;
                      });
                    },
                    child: Container(
                      height: 45.h,
                      width: 165.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: widget.typeGender == 1
                            ? BGroundCategoryHomePage
                            : BGroundCategoryHomePageMen,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/list_res.png',
                            width: 25.w,
                            height: 25.h,
                            color: widget.typeGender == 1
                                ? titleStartPage
                                : titleStartPage2,
                          ),
                          SizedBox(width: 10.w),
                          CustomeText(
                            title: 'قائمة الحجوزات',
                            color: widget.typeGender == 1
                                ? titleStartPage
                                : titleStartPage2,
                            fontSize: 14.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget columnConfirmReservation() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            /*Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Container(
                width: double.infinity,
                height: 200.h,
                padding:
                    EdgeInsetsDirectional.only(top: 12.h, bottom: 12.h, start: 7.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/place2.png',
                        width: 150.w,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ItemRowConfirmDetails(
                          title: 'الاسم',
                          subTitle: 'صالون بيتفول للجمال والصحة',
                          typeGender: widget.typeGender,
                        ),
                        SizedBox(height: 5.h),
                        ItemRowConfirmDetails(
                          title: 'العنوان',
                          subTitle: 'الرياض , شارع الملك عبد العزيز',
                          typeGender: widget.typeGender,
                        ),
                        SizedBox(height: 5.h),
                        ItemRowConfirmDetails(
                          title: 'الخدمة',
                          subTitle: 'مكياج',
                          typeGender: widget.typeGender,
                        ),
                        SizedBox(height: 5.h),
                        ItemRowConfirmDetails(
                          title: 'التاريخ',
                          subTitle: 'الاربعاء 13 / 04 / 2022',
                          typeGender: widget.typeGender,
                        ),
                        SizedBox(height: 5.h),
                        ItemRowConfirmDetails(
                          title: 'الساعة',
                          subTitle: '01:00-02:00 مساء',
                          typeGender: widget.typeGender,
                        ),
                        SizedBox(height: 5.h),
                        ItemRowConfirmDetails(
                          title: 'الرسوم',
                          subTitle: '300  ر.س',
                          typeGender: widget.typeGender,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),*/
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Container(
                width: double.infinity,
                height: 450.h,
                padding: EdgeInsetsDirectional.only(
                    top: 12.h, bottom: 12.h, start: 7.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logoRe1.png',
                          width: 45.w,
                          height: 45.h,
                        ),
                        SizedBox(width: 15.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomeText(
                              title: 'صالون بيوتفل للجمال الصحة',
                              fontSize: 18.sp,
                              // fontWeight: FontWeight.w900,
                              color: widget.typeGender == 1
                                  ? titleStartPage
                                  : titleStartPage2,
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomeText(
                                  title: 'العنوان',
                                  fontSize: 18.sp,
                                  // fontWeight: FontWeight.w900,
                                  color: widget.typeGender == 1
                                      ? titleStartPage
                                      : titleStartPage2,
                                ),
                                SizedBox(width: 15.w),
                                CustomeText(
                                  title: 'الرياض, شارع الملك عبد العزيز',
                                  fontSize: 11.sp,
                                  color: Colors.grey.shade500,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: listMyReservation.length,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.r, vertical: 15.h),
                        itemBuilder: (context, index) {
                          DataMyReservationPlaceDetails dataMyReservation =
                              listMyReservation.elementAt(index);
                          return ContainerReservationPlaceDetails(
                            date: dataMyReservation.date,
                            time: dataMyReservation.time,
                            // title: dataMyReservation.title,
                            // subTitle: dataMyReservation.subTitle,
                            // image: dataMyReservation.image,
                            typeGender: widget.typeGender,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: widget.typeGender == 1 ? BGDate : BGDateMen,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomeText(
                            title: 'اجمالي الرسوم',
                            fontSize: 18.sp,
                            color: widget.typeGender == 1
                                ? titleStartPage
                                : titleStartPage2,
                          ),
                          SizedBox(width: 20.w),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: CustomeText(
                              title: '1950 ر.س',
                              fontSize: 18.sp,
                              color: widget.typeGender == 1
                                  ? titleStartPage
                                  : titleStartPage2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Container(
                width: double.infinity,
                height: 350.h,
                padding: EdgeInsetsDirectional.only(
                    top: 12.h, bottom: 12.h, start: 7.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 15.w),
                        CustomeText(
                          title: 'طريقة الدفع',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                          color: widget.typeGender == 1
                              ? titleStartPage
                              : titleStartPage2,
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Image.asset(
                      'assets/images/cardPayment2.png',
                      width: 340.w,
                      height: 290.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectWidgetReservation = 3;
                });
              },
              child: Container(
                height: 40.h,
                width: 140.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: widget.typeGender == 1
                      ? BGroundCategoryHomePage
                      : BGroundCategoryHomePageMen,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/confirm_check.png',
                      width: 25.w,
                      height: 25.h,
                      color: widget.typeGender == 1
                          ? titleStartPage
                          : titleStartPage2,
                    ),
                    SizedBox(width: 10.w),
                    CustomeText(
                      title: 'تاكيد الدفع',
                      color: widget.typeGender == 1
                          ? titleStartPage
                          : titleStartPage2,
                      fontSize: 14.sp,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget columnConfirm() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.r),
              child: ContainerConfBo(
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Image.asset(
                      'assets/images/confirm.png',
                      width: 100.w,
                      height: 100.h,
                      color: widget.typeGender == 1
                          ? titleStartPage
                          : titleStartPage2,
                    ),
                    SizedBox(height: 20.h),
                    CustomeText(
                      title: 'تم الحجز بنجاح ..!!',
                      color: widget.typeGender == 1
                          ? titleStartPage
                          : titleStartPage2,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        SizedBox(width: 15.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomeText(
                              title: 'صالون بيتفول للجمال والصحة',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900,
                              color: widget.typeGender == 1
                                  ? titleStartPage
                                  : titleStartPage2,
                            ),
                            SizedBox(height: 10.h),
                            ItemRowConfirmDetails(
                                select: true,
                                typeGender: widget.typeGender,
                                image: 'assets/images/location2.png',
                                subTitle: 'الرياض , شارع الملك عبد العزيز'),
                            SizedBox(height: 15.h),
                            ItemRowConfirmDetails(
                                select: true,
                                typeGender: widget.typeGender,
                                image: 'assets/images/calendar.png',
                                subTitle: 'الاربعاء  13 / 04 / 2022'),
                            SizedBox(height: 15.h),
                            ItemRowConfirmDetails(
                                select: true,
                                typeGender: widget.typeGender,
                                image: 'assets/images/clock.png',
                                subTitle: 'مساء 01:00-02:00'),
                            SizedBox(height: 25.h),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ContainerBtn(
                          title: 'تعديل الحجز',
                          image: 'assets/images/edit.png',
                          typeGender: widget.typeGender,
                          presCard: () {},
                        ),
                        SizedBox(width: 15.w),
                        ContainerBtn(
                          title: 'الغاء الحجز',
                          image: 'assets/images/cancel.png',
                          typeGender: widget.typeGender,
                          presCard: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 35.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerBtnConfirm(
                  title: 'الصفحة الرئيسية',
                  typeGender: widget.typeGender,
                  presCard: () {
                    Get.offAll(HomeScreen(
                      typeGender: widget.typeGender,
                    ));
                  },
                ),
                SizedBox(width: 7.w),
                ContainerBtnConfirm(
                  title: 'احجز مواعيد اخرى',
                  typeGender: widget.typeGender,
                  presCard: () {
                    setState(() {
                      selectWidgetReservation = 1;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}


