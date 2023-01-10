import 'package:final_project/features/profile_feature/presentation/controllers/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
  Get.put<ProfileController>(ProfileController());
  }


}