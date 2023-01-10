import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/features/auth_feature/widgets/auth_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/app_colors/app_colors.dart';
import '../../../../../core/app_images/app_images.dart';
import '../../../../../core/widgets/app_widgets.dart';

class ResetPasswordScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

   ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
        Padding(
          padding: EdgeInsets.all(AppSizes.padding25.h.w),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  AppTexts.dontWorry.tr,
                  style: context.theme.textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: AppSizes.height40.h,
                ),
                DefaultTextForm(
                    textEditingController: TextEditingController(),
                    textInputType: TextInputType.phone,
                    validator: ((String? value) {
                      if (value!.isEmpty) {
                        return AppTexts.pleaseEnterPhone.tr;
                      }
                    }),
                    label: AppTexts.phoneNumber.tr,
                    hasPrefixIcon: true,
                    iconData: Image.asset(
                      AppImages.phoneIcon,
                      color: AppColors.headLine3Color,
                      height: 10.h,
                      width: 10.w,
                    )),
                SizedBox(
                  height: AppSizes.height74.h,
                ),
                DefaultButton(
                    AppTexts.resetPass, AppRoutes.getCheckCodeRout())
              ],
            ),
          ),
        ),
        AppTexts.resetPass);
  }
}
