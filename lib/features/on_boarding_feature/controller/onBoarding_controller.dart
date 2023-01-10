import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_images/app_images.dart';
import '../../../core/app_texts/app_texts.dart';


class OnBoardingController extends GetxController{
  var onboardController = PageController();
  bool isLast = false;
  int index=0;
  List<String> screens=[
    AppRoutes.getLayoutRout(),
    AppRoutes.getSignINRout(),
    AppRoutes.getSignUpRout(),
  ];
  List<String> onboardImages=[
  AppImages.onboard1,
  AppImages.onboard2,
  AppImages.onboard3,
  ];
  List<String> onboardTitles=[
    AppTexts.onBoardingTitle.tr,
    AppTexts.onBoardingTitle1.tr,
    AppTexts.onBoardingTitle2.tr,
  ];
 List<String> onboardDes=[
    AppTexts.onBoardingDescription.tr,
    AppTexts.onBoardingDescription1.tr,
    AppTexts.onBoardingDescription2.tr,
  ];


  void  onPageChanged(index) {
    if (index ==onboardImages.length - 1) {
      isLast = true;
      update(

      );
      print('last');
    } else {
      isLast = false;
      update(

      );
      print('not last');
    }
  }
}