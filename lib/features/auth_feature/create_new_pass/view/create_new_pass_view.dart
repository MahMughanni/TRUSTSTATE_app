import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:final_project/features/auth_feature/widgets/auth_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateNewPassScreen extends StatefulWidget {
   const CreateNewPassScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPassScreen> createState() => _CreateNewPassScreenState();
}

class _CreateNewPassScreenState extends State<CreateNewPassScreen> {
bool isCreate=false;
var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
        SafeArea(
          top: true,
          child: Padding(
            padding:  EdgeInsets.all(AppSizes.padding20.w.h),
            child: SingleChildScrollView(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                            width: double.infinity,
                            height: AppSizes.height189.h,
                            child: Image.asset(
                              AppImages.singInImage,
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(
                          height: AppSizes.height40,
                        ),

                        DefaultTextForm(
                            textEditingController: TextEditingController(),
                            textInputType: TextInputType.visiblePassword,
                            validator: (((String? value) {
                              if (value!.isEmpty) {
                                return AppTexts.pleaseEnterPhone.tr;
                              }
                            })),
                            label: AppTexts.password.tr,
                            isPassword: true,
                            iconData: SizedBox(
                                height: AppSizes.height10.h,
                                width: AppSizes.height10.w,
                                child: Image.asset(AppImages.lockIcon))),
                        SizedBox(
                          height: AppSizes.height20.h,
                        ),
                        DefaultTextForm(
                            textEditingController: TextEditingController(),
                            textInputType: TextInputType.visiblePassword,
                            validator: ((value) {
                              if (value!.isEmpty) {
                                return AppTexts.pleaseEnterPas.tr;
                              }
                            }),
                            label: AppTexts.newPass.tr,
                            isPassword: true,
                            iconData: SizedBox(
                                height: AppSizes.height10.h,
                                width: AppSizes.height10.w,
                                child: Image.asset(AppImages.lockIcon))),

                        SizedBox(
                          height: AppSizes.height20.h,
                        ),
                        DefaultButton(AppTexts.createNewPass,
                            AppRoutes.getHomeRout(),
                          function: (){
                          setState(() {
                            isCreate==true;
                          });
                          },
                        ),
                        SizedBox(
                          height: AppSizes.height20.h,
                        ),

                      ],
                    ),
                  ),

                isCreate?  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radius40.r),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(AppSizes.padding20.h.w),
                      child: Column(
children: [
  Image.asset(AppImages.readyImage),

  Text(AppTexts.congrats.tr,
  style: context.theme.textTheme.headline5?.copyWith(
    fontSize: AppSizes.fontSize24
  ),),
  SizedBox(
    height: AppSizes.height10.h,
  ),
  Text(AppTexts.ready.tr,
    style: context.theme.textTheme.headline6,textAlign: TextAlign.center),

  SizedBox(
    height: AppSizes.height10.h,
  ),
  const CircularProgressIndicator(
    color: AppColors.primaryColor,

  )
],
                      ),
                    ),
                  )
                    :const SizedBox()
                ],
              ),
            ),
          ),
        ),
        AppTexts.newPass.tr
    );
  }
}
