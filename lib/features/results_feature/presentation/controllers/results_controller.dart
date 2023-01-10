import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ResultsController extends GetxController {
  List<String> estateTypes = [
    AppTexts.house,
    AppTexts.apartment,
    AppTexts.building,
    AppTexts.villa,
    AppTexts.office,
    AppTexts.land,
    AppTexts.chalet
  ];

  List<String> cites = [
    AppTexts.house,
    AppTexts.apartment,
    AppTexts.building,
    AppTexts.villa,
    AppTexts.office,
    AppTexts.land,
    AppTexts.chalet
  ];
  String? selectedValue;
  String? selectedValue1;

  void changeValue(String value) {
    selectedValue = value as String;
    update();
  }

  final double min = 0;
  final double max = 100;
  SfRangeValues values1 = const SfRangeValues(40.0, 60.0);
  SfRangeValues values2 = const SfRangeValues(40.0, 60.0);
  SfRangeValues values3 = const SfRangeValues(40.0, 60.0);
  List<String> estateDetailes = [
    AppTexts.bedroom,
    AppTexts.bath,
    AppTexts.livingRoom,
    AppTexts.kitchen,
  ];
  static var count = 0.obs;
  static var count1 = 0.obs;
  static var count2 = 0.obs;
  static var count3 = 0.obs;

  List counts = [count, count1, count2, count3];
  List<Function> increments = [increment, increment1, increment2, increment3];
  List<Function> decrements = [decrement, decrement1, decrement2, decrement3];

  static void increment() {
    count++;
  }

  static void increment1() {
    count1++;
  }

  static void increment2() {
    count2++;
  }

  static void increment3() {
    count3++;
  }

  static void decrement() {
    count--;
  }

  static void decrement1() {
    count1--;
  }

  static void decrement2() {
    count2--;
  }

  static void decrement3() {
    count3--;
  }
}
