import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:final_project/features/filter_feature/presentation/controllers/filter_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterScreen extends GetView<FilterController> {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.filter.tr),
        backgroundColor: context.theme.scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.padding20.w.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) =>
                    SizedBox(
                  width: double.infinity,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppTexts.chooseState.tr,
                              style: context.theme.textTheme.headline2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: controller.estateTypes
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item.tr,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: controller.selectedValue,
                      onChanged: (value) {
                        setState(() => controller.selectedValue = value);
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      iconSize: 24,
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 160,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: AppColors.primaryColor,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200.w,
                      dropdownPadding:
                          const EdgeInsets.only(left: 14, right: 14),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppColors.primaryColor,
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
              SizedBox(
                height: AppSizes.height26.h,
              ),
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
                              AppTexts.chooseCity.tr,
                              style: context.theme.textTheme.headline2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: controller.estateTypes
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item.tr,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
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
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 160,
                      buttonPadding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.padding20),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: AppColors.primaryColor,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.padding20),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.padding20),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppColors.primaryColor,
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
              SizedBox(
                height: AppSizes.height26.h,
              ),
              Text(
                AppTexts.estateType.tr,
                style: context.theme.textTheme.headline6,
              ),
              SizedBox(
                height: AppSizes.padding20.w,
              ),
              Card(
                child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    crossAxisCount: 3,
                    children: List.generate(
                        AppTexts.estateTypes.length,
                        (index) => Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.villa,
                                    color: AppColors.primaryColor,
                                    size: 24,
                                  ),
                                  Text(
                                    AppTexts.estateTypes[index].tr,
                                    style: context.theme.textTheme.headline3,
                                  ),
                                ],
                              ),
                            ))),
              ),
              SizedBox(
                height: AppSizes.height26.h,
              ),
              Text(
                AppTexts.estateCost.tr,
                style: context.theme.textTheme.headline6,
              ),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) =>
                    SfRangeSlider(
                  min: controller.min,
                  max: controller.max,
                  values: controller.values1,
                  interval: 20,
                  showLabels: true,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: AppColors.primaryColor.withOpacity(.3),
                  onChanged: (SfRangeValues value) {
                    setState(() => controller.values1 = value);
                  },
                ),
              ),
              SizedBox(
                height: AppSizes.height26.h,
              ),
              Text(
                AppTexts.estateArea.tr,
                style: context.theme.textTheme.headline6,
              ),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) =>
                    SfRangeSlider(
                  min: controller.min,
                  max: controller.max,
                  values: controller.values2,
                  interval: 20,
                  showLabels: true,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: AppColors.primaryColor.withOpacity(.3),
                  onChanged: (SfRangeValues value) {
                    setState(() => controller.values2 = value);
                  },
                ),
              ),
              SizedBox(
                height: AppSizes.height26.h,
              ),
              Text(
                AppTexts.builtUpArea.tr,
                style: context.theme.textTheme.headline6,
              ),
              Container(
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) =>
                      SfRangeSlider(
                    min: controller.min,
                    max: controller.max,
                    values: controller.values3,
                    interval: 20,
                    showLabels: true,
                    activeColor: AppColors.primaryColor,
                    inactiveColor: AppColors.primaryColor.withOpacity(.3),
                    onChanged: (SfRangeValues value) {
                      setState(() => controller.values3 = value);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.height26.h,
              ),
              Container(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.padding20.w,
                                vertical: AppSizes.height10.h),
                            child: Row(
                              children: [
                                Text(
                                  controller.estateDetailes[index].tr,
                                  style: context.theme.textTheme.headline6,
                                ),
                                const Spacer(),
                                MaterialButton(
                                  onPressed: () {
                                    controller.increments[index]();
                                  },
                                  padding: EdgeInsets.zero,
                                  minWidth: 40,
                                  height: 40,
                                  color: AppColors.primaryColor,
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                Obx(
                                  () => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppSizes.height10.w),
                                    child: Text(
                                      '${controller.counts[index]}',
                                      style: context.theme.textTheme.headline6,
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    controller.decrements[index]();
                                  },
                                  padding: EdgeInsets.zero,
                                  minWidth: 40,
                                  height: 40,
                                  color: AppColors.primaryColor,
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: AppSizes.height10.h,
                        ),
                    itemCount: 4),
              ),
              SizedBox(
                height: AppSizes.height26.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppTexts.realEstateAgents.tr,
                    style: context.theme.textTheme.headline6,
                  ),
                  IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.getAgentsRout());
                      },
                      icon: const Icon(Icons.arrow_forward))
                ],
              ),
              SizedBox(
                height: AppSizes.height10.h,
              ),
              SizedBox(
                height: AppSizes.height189.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(AppSizes.height10),
                  children: List.generate(
                    7,
                    (index) => Padding(
                      padding: EdgeInsets.only(left: AppSizes.height10.w),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                ExactAssetImage(AppImages.userImage),
                            radius: AppSizes.radius40,
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
                  ),
                ),
              ),
              DefaultButton(
                  AppTexts.viewResults.tr, AppRoutes.getResultsRout()),
            ],
          ),
        ),
      ),
    );
  }
}
