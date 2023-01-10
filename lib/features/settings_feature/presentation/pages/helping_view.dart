import 'package:final_project/features/settings_feature/presentation/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_colors/app_colors.dart';

import '../../../../core/app_sizes/app_sizes.dart';
import '../../../../core/app_texts/app_texts.dart';

class HelpingScreen extends GetView<SettingController> {
  const HelpingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:     AppBar(
          title: Text(AppTexts.help.tr),
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


                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Card(
                          child: ListTile(
                            title: Text(AppTexts.helpings[index].tr,
                              style: context.theme.textTheme.headline4,
                            ),
                            trailing:  IconButton(
                              icon:const Icon(Icons.arrow_forward,color: AppColors.headLine4Color,),
                              onPressed: (){},
                            ),
                          ),
                        ),
                        separatorBuilder:  (context, index) => SizedBox(height: AppSizes.height10.h,),
                        itemCount: AppTexts.helpings.length)
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
