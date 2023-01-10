import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text(AppTexts.favorite.tr),
          backgroundColor: context.theme.scaffoldBackgroundColor,
          leading:
            IconButton(onPressed: (){
              Get.toNamed(AppRoutes.getLayoutRout());
            }, icon: const Icon(Icons.arrow_back,),
            )

        ),
        Padding(
          padding:  EdgeInsets.all(AppSizes.padding20.h.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.emptyCart,),
              SizedBox(height: AppSizes.padding20.h,),
              Text(AppTexts.emptyCart.tr,style: context.theme.textTheme.headline3),
              SizedBox(height: AppSizes.height10.h,),
              Text(AppTexts.emptyCartDes.tr,style: context.theme.textTheme.headline3,textAlign: TextAlign.center),
              SizedBox(height: AppSizes.padding20.h,),
              DefaultButton(AppTexts.explore.tr, AppRoutes.getLayoutRout()),
            ],
          ),
        ),


      ],
    );
  }
}
