import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:final_project/features/auth_feature/widgets/auth_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/app_images/app_images.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
        Padding(
          padding: EdgeInsets.all(AppSizes.padding25.h.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    height: AppSizes.height189.h,
                    child: Image.asset(
                      AppImages.singInImage,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: AppSizes.height26.h,
                ),
                SizedBox(
                  height: AppSizes.height20*5.h,
                  child:    OtpTextField(
                    numberOfFields: 4,
                    fillColor: AppColors.primaryColor,
                     fieldWidth: 50.w,
                    showFieldAsBox: true,
                    onSubmit: (String verificationCode){
                      // c.codeController.text=verificationCode;
                    }, // end onSubmit
                  ),
                ),
                DefaultButton(AppTexts.checkCode.tr, AppRoutes.getCreatePassRout()),
                const SizedBox(
                  height: AppSizes.height10,
                ),
                Text(
                  AppTexts.resend.tr,
                  style: context.theme.textTheme.headline5
                      ?.copyWith(fontSize: AppSizes.fontSize16),
                ),

              ],
            ),
          ),
        ),
        AppTexts.checkCode.tr);
  }


}
