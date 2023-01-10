import 'package:final_project/core/app_network/cache_helper.dart';
import 'package:final_project/features/settings_feature/presentation/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_colors/app_colors.dart';

import '../../../../core/app_sizes/app_sizes.dart';
import '../../../../core/app_texts/app_texts.dart';

class LangScreen extends GetView<SettingController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:     AppBar(
        title: const Text(AppTexts.langs),
        backgroundColor: context.theme.scaffoldBackgroundColor,
      ),
      body: SafeArea(

        child: Column(
          children: [

            Padding(
              padding:  EdgeInsets.all(AppSizes.padding20.h.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    StatefulBuilder(
                      builder: (context, setState) => Column(
                        children: [
                          SizedBox(height: 20.h),
                          ListTile(
                              title: Text(AppTexts.system.tr,
                              style: context.theme.textTheme.headline6,
                              ),
                              leading: Radio<Language>(
                                  activeColor: AppColors.primaryColor,
                                  value: Language.System,
                                  groupValue: controller.language,
                                  onChanged: (value) {
                                    setState(
                                          () {

                                       controller.language = value!;
                                       SharedPrefs.saveData(key: 'value', value: value);
                                      },
                                    );
                                    controller
                                    .update();
                                 controller.changeLang( Get.deviceLocale.toString())  ;

                                  })),
                          ListTile(
                            title:Text(AppTexts.arabic.tr,
                              style: context.theme.textTheme.headline6,
                            ),
                            leading: Radio<Language>(
                                activeColor: AppColors.primaryColor,
                                value: Language.Arabic,
                                groupValue: controller.language,
                                onChanged: (value) {
                                  setState(
                                        () {
                                      controller.language = value!;
                                      SharedPrefs.saveData(key: 'value', value: value);
                                    },
                                  );
                                  controller.  update();
                                  controller.changeLang('ar');


                                }),
                          ),
                          ListTile(
                            title: Text(AppTexts.english.tr,
                              style: context.theme.textTheme.headline6,
                            ),
                            leading: Radio<Language>(activeColor: AppColors.primaryColor,
                                value: Language.English,
                                groupValue: controller.language,
                                onChanged: (value) {
                                  setState(
                                        () {
                                      controller.language = value!;
                                      SharedPrefs.saveData(key: 'value', value: value);
                                    },
                                  );
                                  controller.update();
                                 controller. changeLang('en');

                                }),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
