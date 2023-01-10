import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_themes/app_themes.dart';
import 'package:final_project/features/on_boarding_feature/view/on_boarding_view.dart';
import 'package:final_project/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/app_network/cache_helper.dart';
import 'core/app_sizes/app_sizes.dart';
import 'core/local/local.dart';
import 'features/settings_feature/presentation/controllers/setting_controller.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingController localController = Get.put(SettingController());

    return ScreenUtilInit(
        designSize: const Size(AppSizes.screenWidth, AppSizes.screenHeight),
        minTextAdapt: true,
        splitScreenMode: true,
        builder:
            (context, child) =>
            GetMaterialApp(
              debugShowCheckedModeBanner: false,
              locale: localController.initialLang,
              translations: MyLocal(),
              theme: AppThemes.lightTheme,
              //textDirection: TextDirection.rtl,
              getPages: AppRoutes().routes,
              initialRoute: AppRoutes.getSplashRout(),
            ));
  }
}




