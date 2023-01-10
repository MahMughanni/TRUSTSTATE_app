import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/addingProperty_controller.dart';

class AddingPropertyScreen extends GetView<AddingPropertyController> {
  const AddingPropertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.addProperty.tr),
        backgroundColor: context.theme.scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.padding20.h.w),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.controllers.length,
                  itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: AppSizes.padding20.h),
                        child: DefaultTextForm(
                            label: controller.labels[index].tr,
                            textEditingController:
                                controller.controllers[index],
                            textInputType: controller.inputTypes[index],
                            validator: (value) => ''),
                      )),
              SizedBox(
                width: double.infinity,
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) =>
                      DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppTexts.agent.tr,
                              style: context.theme.textTheme.headline3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      dropdownFullScreen: true,
                      items: controller.agents
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item.tr,
                                  style: context.theme.textTheme.headline5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: controller.selectedValue1,
                      onChanged: (value) {
                        setState(() => controller.selectedValue1 = value);
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      iconSize: 24,
                      iconEnabledColor: AppColors.primaryColor,
                      // iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 160,
                      buttonPadding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.padding20),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        // color:AppColors.primaryColor,
                      ),

                      itemHeight: 40,
                      itemPadding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.padding20),
                      // dropdownMaxHeight: 200,
                      // dropdownWidth: 200,
                      dropdownPadding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.padding20),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(0, 0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.padding20.h),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(AppSizes.height10.h.w),
                    child: InkWell(
                      onTap: () => controller.pickImg(),
                      child: Row(
                        children: [
                          GetBuilder<AddingPropertyController>(
                            builder: (controller) {
                              if (controller.image == null) {
                                return const SizedBox();
                              } else {
                                return SizedBox(
                                  height: 100,
                                  child: Image.file(
                                    File(
                                      controller.image!.path,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          const Icon(
                            Icons.photo_library_outlined,
                            size: 40,
                            color: AppColors.headLine3Color,
                          ),
                          Text(
                            AppTexts.propertyProofImage.tr,
                            style: context.theme.textTheme.headline3,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.height10.h.w),
                  child: Row(
                    children: [
                      GetBuilder<AddingPropertyController>(
                        builder: (controller) {
                          if (controller.idImage == null) {
                            return const SizedBox();
                          } else {
                            return SizedBox(
                              height: 100,
                              child: Image.file(
                                File(
                                  controller.idImage!.path,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      InkWell(
                        onTap: () => controller.pickIdImg(),
                        child: const Icon(
                          Icons.photo_library_outlined,
                          size: 40,
                          color: AppColors.headLine3Color,
                        ),
                      ),
                      Text(
                        AppTexts.idImage.tr,
                        style: context.theme.textTheme.headline3,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.padding20.h,
              ),
              MaterialButton(
                onPressed: () {
                  Get.dialog(Center(
                    child: Container(
                      margin: EdgeInsets.all(AppSizes.padding20.h.w),
                      padding: EdgeInsets.all(AppSizes.padding20.h.w),
                      height: AppSizes.height478.h,
                      width: AppSizes.screenWidth - 20.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(AppSizes.radius12.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.readyImage,
                            height: AppSizes.height189,
                            width: AppSizes.height189,
                          ),
                          Text(
                            AppTexts.dataSent.tr,
                            style: context.theme.textTheme.headline1,
                          ),
                          Text(
                            AppTexts.dataSentDescription.tr,
                            style: context.theme.textTheme.headline4,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ));
                },
                color: AppColors.primaryColor,
                child: Text(
                  AppTexts.saveAndSent.tr,
                  style: context.theme.textTheme.headline2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
