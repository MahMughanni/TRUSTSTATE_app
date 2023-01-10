import 'package:get/get.dart';

import '../app_transilations/arabic.dart';
import '../app_transilations/english.dart';

class MyLocal implements Translations{
  @override

  Map<String, Map<String, String>> get keys => {
    'en':en,
    'ar':ar



  };

}