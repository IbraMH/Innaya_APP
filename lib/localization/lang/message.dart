
import 'package:get/get.dart';

const String HCategories = 'Categories';
const String HTopRated = 'Top Rated';
const String HClosestToYou = 'Closest To You';


class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>{
    'en': {

    }, 'ar': {
      HCategories: 'التصنيفات',
      HTopRated: 'الاعلى تقييما',
      HClosestToYou: 'الاقرب اليك',
    }
  };}