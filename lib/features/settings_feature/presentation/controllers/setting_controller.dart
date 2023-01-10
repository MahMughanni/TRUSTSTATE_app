import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../../../core/app_network/cache_helper.dart';

enum Language { System, Arabic, English }

class SettingController extends GetxController {
  static bool status = true;
  Language language = Language.English;
  Locale? initialLang = SharedPrefs.getString('lang') == null
      ? Get.deviceLocale
      : Locale(SharedPrefs.getString('lang')!);
  List<String> langs = [
    AppTexts.arabic,
    AppTexts.english,
    AppTexts.english,
  ];

  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    SharedPrefs.setString('lang', langCode);
    Get.updateLocale(locale);
  }

  void onToggle(val) {
    status = val;
    update();
  }

  List<Icon> settingListIcons = [
    const Icon(
      Icons.person_outline,
      color: AppColors.headLine4Color,
    ),
    const Icon(
      Icons.notifications_none,
      color: AppColors.headLine4Color,
    ),
    const Icon(
      Icons.privacy_tip_outlined,
      color: AppColors.headLine4Color,
    ),
    const Icon(
      Icons.language,
      color: AppColors.headLine4Color,
    ),
    const Icon(
      Icons.help_outline_outlined,
      color: AppColors.headLine4Color,
    ),
    const Icon(
      Icons.logout,
      color: AppColors.headLine4Color,
    ),
  ];
  List<Widget> settingTrailingIcons = [
    IconButton(
      icon: const Icon(
        Icons.arrow_forward,
        color: AppColors.headLine4Color,
      ),
      onPressed: () {
        Get.toNamed(AppRoutes.getProfileRout());
      },
    ),
    StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return Switch(
        value: status,
        activeColor: AppColors.primaryColor,
        onChanged: (value) {
          setState(() => status = value);
        },
      );
    }),
    IconButton(
      icon: const Icon(
        Icons.arrow_forward,
        color: AppColors.headLine4Color,
      ),
      onPressed: () {},
    ),
    IconButton(
      icon: const Icon(
        Icons.arrow_forward,
        color: AppColors.headLine4Color,
      ),
      onPressed: () {
        Get.toNamed(AppRoutes.getLangRout());
      },
    ),
    IconButton(
      icon: const Icon(
        Icons.arrow_forward,
        color: AppColors.headLine4Color,
      ),
      onPressed: () {
        Get.toNamed(AppRoutes.getHelpingRout());
      },
    ),
    Builder(
        builder: (context) => IconButton(
              icon: const Icon(
                Icons.arrow_forward,
                color: AppColors.headLine4Color,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.all(AppSizes.padding20.h.w),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            AppTexts.logout,
                            style: context.theme.textTheme.headline1
                                ?.copyWith(fontSize: 20.sp),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'هل أنت متأكد من أنك تريد تسجيل الخروج ؟',
                              style: context.theme.textTheme.headline3,
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            minWidth: double.infinity,
                            height: 50,
                            padding: const EdgeInsets.all(AppSizes.height10),
                            color: AppColors.primaryColor,
                            child: Text(
                              'نعم , قم بإزلته',
                              style: context.theme.textTheme.headline2,
                            ),
                          ),
                          const SizedBox(
                            height: AppSizes.height10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppSizes.height10),
                            child: MaterialButton(
                              onPressed: () {},
                              minWidth: double.infinity,
                              height: 50,
                              padding: const EdgeInsets.all(AppSizes.height10),
                              color: AppColors.backgroundColor,
                              child: Text(
                                AppTexts.cancle.tr,
                                style: context.theme.textTheme.headline5,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ))
  ];
}
