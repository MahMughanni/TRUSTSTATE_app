import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:final_project/features/profile_feature/presentation/controllers/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_images/app_images.dart';
import '../../../../core/app_sizes/app_sizes.dart';
import '../../../../core/app_texts/app_texts.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.myProfile.tr),
        backgroundColor: context.theme.scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.padding20.w.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: const ExactAssetImage(AppImages.userImage),
                      radius: AppSizes.radius40.r,
                    ),
                    SizedBox(
                      height: AppSizes.height10.h,
                    ),
                    Text(
                      AppTexts.userName.tr,
                      style: context.theme.textTheme.headline4,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSizes.height26.h,
              ),
              Text(
                AppTexts.fullName.tr,
                style: context.theme.textTheme.headline6,
              ),
              SizedBox(
                height: AppSizes.height10.h,
              ),
              DefaultTextForm(
                  textEditingController: controller.nameController,
                  textInputType: TextInputType.text,
                  label: AppTexts.userName.tr,
                  isEnable: false,
                  validator: (value)=>''), SizedBox(
                height: AppSizes.height26.h,
              ),
              Text(
                AppTexts.email.tr,
                style: context.theme.textTheme.headline6,
              ),
              SizedBox(
                height: AppSizes.height10.h,
              ),
              DefaultTextForm(
                  textEditingController: controller.emailController,
                  textInputType: TextInputType.text,
                  label:AppTexts.userEmail.tr,
                  isEnable: false,
                  validator: (value)=>''), SizedBox(
                height: AppSizes.height26.h,
              ),
              Text(
                AppTexts.phoneNumber.tr,
                style: context.theme.textTheme.headline6,
              ),
              SizedBox(
                height: AppSizes.height10.h,
              ),
              DefaultTextForm(
                  textEditingController: controller.phoneController,
                  textInputType: TextInputType.text,
                  label:AppTexts.userPhoneNumber.tr,
                  isEnable: false,
                  validator: (value)=>''), SizedBox(
                height: AppSizes.height26.h,
              ),
              Text(
                AppTexts.address.tr,
                style: context.theme.textTheme.headline6,
              ),
              SizedBox(
                height: AppSizes.height10.h,
              ),
              DefaultTextForm(
                  textEditingController: controller.nameController,
                  textInputType: TextInputType.text,
                  label:AppTexts.userAddress.tr,
                  isEnable: false,
                  validator: (value)=>''), SizedBox(
                height: AppSizes.height26.h,
              ),

              SizedBox(
                height: AppSizes.height10.h,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
