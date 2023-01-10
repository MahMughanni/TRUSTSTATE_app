import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/features/settings_feature/presentation/controllers/setting_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_images/app_images.dart';
import '../../../../core/app_routes/app_routes.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingController controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppBar(
              title: Text(AppTexts.settings.tr),
              backgroundColor: context.theme.scaffoldBackgroundColor,
              leading: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.getLayoutRout());
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              )),
          Padding(
            padding: EdgeInsets.all(AppSizes.padding20.h.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(AppSizes.padding20 / 2.h.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizes.radius8),
                        color: AppColors.primaryColor.withOpacity(0.8)),
                    child: Row(
                      //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: ExactAssetImage(AppImages.userImage),
                          radius: AppSizes.radius40,
                        ),
                        const SizedBox(
                          width: AppSizes.height10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppTexts.userName.tr,
                              style: context.theme.textTheme.headline2,
                            ),
                            Text(AppTexts.userEmail.tr),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit_outlined,
                              size: AppSizes.height20 + 10,
                              color: AppColors.headLine2Color,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.padding20,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Card(
                            child: ListTile(
                              title: Text(
                                AppTexts.settingListTiles[index].tr,
                                style: context.theme.textTheme.headline4,
                              ),
                              trailing: controller.settingTrailingIcons[index],
                              leading: controller.settingListIcons[index],
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: AppSizes.height10.h,
                          ),
                      itemCount: AppTexts.settingListTiles.length)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
