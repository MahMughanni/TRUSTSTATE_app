import 'package:final_project/features/results_feature/presentation/controllers/results_controller.dart';
import 'package:get/get.dart';

class ResultsBinding extends Bindings{
  @override
  void dependencies() {
  Get.put<ResultsController>(ResultsController());
  }


}