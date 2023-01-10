import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/features/home_feature/presentation/widgets/estate_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_images/app_images.dart';
import '../../../../core/app_sizes/app_sizes.dart';
import '../../../home_feature/domain/entities/home_item_entity.dart';

class AgentDetailsScreen extends StatelessWidget {
  const AgentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.realEstateAgents.tr),
        backgroundColor: context.theme.scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(AppSizes.padding20.w.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 81,
                  backgroundColor: AppColors.primaryColor,
                  child: CircleAvatar(
                    backgroundImage: ExactAssetImage(
                      AppImages.agentImage,
                    ),
                    radius: AppSizes.radius40 * 2,
                  ),
                ),
              ),
              Center(
                  child: Text(AppTexts.userName.tr,
                      style: context.theme.textTheme.headline1)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(AppSizes.padding20.w.h),
                      child: Column(
                        children: [
                          Text(AppTexts.sell.tr,
                              style: context.theme.textTheme.headline1
                                  ?.copyWith(fontSize: 18.sp)),
                          Text('122', style: context.theme.textTheme.headline4),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(AppSizes.padding20.w.h),
                      child: Column(
                        children: [
                          Text(AppTexts.take.tr,
                              style: context.theme.textTheme.headline1
                                  ?.copyWith(fontSize: 18.sp)),
                          Text('320', style: context.theme.textTheme.headline4),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(AppSizes.padding20.w.h),
                      child: Column(
                        children: [
                          Text(AppTexts.rate.tr,
                              style: context.theme.textTheme.headline1
                                  ?.copyWith(fontSize: 18.sp)),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.padding20.h),
                child: Text(
                  AppTexts.propertiesList.tr,
                  style: context.theme.textTheme.headline4
                      ?.copyWith(fontSize: 18.sp),
                ),
              ),
              ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => EstateCard(
                  homeEntity: HomeEntity(
                    image: AppImages.houses[index],
                    area: '200 م2',
                    bathrooms: "${AppTexts.bath.tr}2",
                    bedrooms: "${AppTexts.bedroom.tr}2",
                    location: AppTexts.palestine.tr,
                    subLocation1: AppTexts.gaza.tr,
                    subLocation2: AppTexts.region.tr,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.padding20.h),
                child: MaterialButton(
                  color: AppColors.primaryColor,
                  onPressed: () {
                    Get.toNamed(AppRoutes.getChatRout());
                  },
                  child: Text(
                    AppTexts.startChatting.tr,
                    style: context.theme.textTheme.headline2,
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
