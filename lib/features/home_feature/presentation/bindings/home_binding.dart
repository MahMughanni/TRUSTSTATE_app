import 'package:final_project/features/home_feature/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
  Get.put<HomeController>(HomeController());
  }


}