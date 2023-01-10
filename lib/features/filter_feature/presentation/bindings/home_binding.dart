import 'package:final_project/features/filter_feature/presentation/controllers/filter_controller.dart';
import 'package:final_project/features/home_feature/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';

class FilterBinding extends Bindings{
  @override
  void dependencies() {
  Get.put<FilterController>(FilterController());
  }


}