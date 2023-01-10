import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/features/addingProperty_feature/presentation/controllers/addingProperty_controller.dart';
import 'package:final_project/features/addingProperty_feature/presentation/pages/addingProperty_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeLayout extends StatelessWidget {
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            Get.toNamed(AppRoutes.getAddPropertyRout());
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined), label: AppTexts.home.tr),
            BottomNavigationBarItem(
                icon: const Icon(Icons.message_outlined),
                label: AppTexts.messages.tr),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite_border_outlined),
                label: AppTexts.favorite.tr),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings_outlined),
                label: AppTexts.settings.tr),
          ],
          selectedLabelStyle: const TextStyle(
              fontFamily: AppTexts.appFontFamily,
              fontSize: AppSizes.fontSize12),
          unselectedLabelStyle:
              TextStyle(fontFamily: AppTexts.appFontFamily, fontSize: 10.sp),
          selectedItemColor: AppColors.primaryColor,
          currentIndex: controller.index,
          onTap: (index) => controller.changScreen(index),
        ),
        body: controller.screens[controller.index],
      ),
    );
  }
}
