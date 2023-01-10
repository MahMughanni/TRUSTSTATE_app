import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/onBoarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
   PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    /* void submit() {
      SharedPrefs.saveData(key: 'onBoarding', value: true).then(((value) {
        if (value = true) {
          Get.offAndToNamed(RoutesClass.getLoginRoute());

        }
      }));
    }*/

    return GetBuilder<OnBoardingController>(
        init: OnBoardingController(),
        builder: ((onboardingcontroller) => Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.padding20.w.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: PageView.builder(
                          itemBuilder: (context, index) => Column(
                            children: [
                              Image.asset(
                                onboardingcontroller.onboardImages[index],
                                height: 335,
                                width: 335,
                              ),
                              Text(
                                onboardingcontroller.onboardTitles[index]
                                    .toUpperCase(),
                                style: context.theme.textTheme.headline1
                                    ?.copyWith(fontSize: 18.sp),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                onboardingcontroller.onboardDes[index],
                                style: context.theme.textTheme.headline3,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          onPageChanged: (index) =>
                              onboardingcontroller.onPageChanged(index),
                          controller: pageController,
                          itemCount: onboardingcontroller.onboardImages.length,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: AppSizes.height40.h),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: onboardingcontroller.onboardImages.length,
                          effect: WormEffect(
                              activeDotColor: AppColors.primaryColor,
                              dotColor: AppColors.primaryColor.withOpacity(0.7),
                              dotWidth: AppSizes.radius12.w,
                              dotHeight: AppSizes.radius8.h),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Get.offAndToNamed(AppRoutes.getLayoutRout());
                        },
                        color: AppColors.primaryColor,
                        child: Text(
                          AppTexts.explore.tr,
                          style: context.theme.textTheme.headline2,
                        ),
                      ),
                      SizedBox(
                        height: AppSizes.padding20.h,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.getSignINRout());
                        },
                        color: AppColors.primaryColor,
                        child: Text(
                          AppTexts.signIn.tr,
                          style: context.theme.textTheme.headline2,
                        ),
                      ),
                      SizedBox(
                        height: AppSizes.padding20.h,
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
