import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_routes/app_routes.dart';

import '../../../../core/app_images/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 5), (){

      Get.offAllNamed(AppRoutes.getOnBoardingRout());
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset(AppImages.logo,color: AppColors.primaryColor),),
          Padding(
            padding:  EdgeInsets.zero,
            child: Center(child: Text('TRUST STATE',
            style: context.theme.textTheme.headline1?.copyWith(
              color: AppColors.primaryColor,
              fontSize: 36,
            ),
            )),
          ),
          Center(child: Text('FIND YOUR DREAM PROPERTY, TODAY',
          style: context.theme.textTheme.headline3?.copyWith(
            fontSize: 13.sp


          ),
          )),

        ],
      ),
    );
  }
}
