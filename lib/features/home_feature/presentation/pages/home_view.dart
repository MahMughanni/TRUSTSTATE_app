import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:final_project/features/home_feature/domain/entities/home_item_entity.dart';
import 'package:final_project/features/home_feature/presentation/controllers/home_controller.dart';
import 'package:final_project/features/notification_feature/presentation/controllers/notification_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/estate_card_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.padding20.h.w),
        child: GetBuilder<HomeController>(
          builder: (controller) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(AppRoutes.getProfileRout()),
                      child: const CircleAvatar(
                        backgroundImage: ExactAssetImage(AppImages.userImage),
                        radius: 25,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.getNotificationRout());
                        },
                        icon: const Icon(
                          Icons.notifications_none,
                          size: AppSizes.height20 + 10,
                          color: AppColors.iconsColor,
                        ))
                  ],
                ),
                SizedBox(
                  height: AppSizes.height26.h,
                ),
                Text(
                  AppTexts.searchSentance.tr,
                  style: context.theme.textTheme.bodyText1,
                ),
                SizedBox(
                  height: AppSizes.height10.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 50,
                        child: Card(
                          child: Center(
                            child: Text(
                              AppTexts.buy.tr,
                              style: context.theme.textTheme.headline3,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        height: 50,
                        child: Card(
                          child: Center(
                            child: Text(
                              AppTexts.rent.tr,
                              style: context.theme.textTheme.headline3,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSizes.padding20.h,
                ),
                SizedBox(
                  height: AppSizes.height57,
                  child: DefaultTextForm(
                    textEditingController: controller.searchController,
                    textInputType: TextInputType.text,
                    validator: (value) => '',
                    label: AppTexts.searchLabel.tr,
                    iconDataSuffixx: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppSizes.height10.w),
                      child: InkWell(
                          onTap: () => Get.toNamed(AppRoutes.getFilterRout()),
                          child: SvgPicture.asset(
                            AppImages.filterIcon,
                            height: 20,
                            width: 20,
                            color: AppColors.iconsColor,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSizes.height26.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppTexts.exploreSentance.tr,
                      style: context.theme.textTheme.bodyText1,
                    ),
                    Card(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                controller.changeView1();
                                print(controller.changeView1Bool);
                              },
                              icon: SvgPicture.asset(
                                AppImages.verticalMenu,
                                color: controller.changeView1Bool
                                    ? AppColors.headLine3Color
                                    : AppColors.primaryColor,
                              )),
                          IconButton(
                              onPressed: () {
                                controller.changeView2();
                                print(controller.changeView2Bool);
                              },
                              icon: SvgPicture.asset(
                                AppImages.horizontalMenu,
                                color: controller.changeView2Bool
                                    ? AppColors.headLine3Color
                                    : AppColors.primaryColor,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: AppSizes.height10.h,
                ),
                SizedBox(
                  height: AppSizes.height478,
                  child: Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => EstateCard(
                        homeEntity: HomeEntity(
                          image: AppImages.houses[index],
                          area: '200 م2'.tr,
                          bathrooms: AppTexts.bath.tr + "" + "2",
                          bedrooms: AppTexts.bedroom.tr + "" + "2",
                          location: AppTexts.palestine.tr,
                          subLocation1: AppTexts.gaza.tr,
                          subLocation2: AppTexts.region.tr,
                        ),
                      ),
                      shrinkWrap: true,
                      itemCount: AppImages.houses.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
