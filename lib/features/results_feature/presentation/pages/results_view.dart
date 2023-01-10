import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/features/filter_feature/presentation/controllers/filter_controller.dart';
import 'package:final_project/features/home_feature/domain/entities/home_item_entity.dart';
import 'package:final_project/features/results_feature/presentation/widgets/results_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultsScreen extends GetView<FilterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppTexts.availableResults.tr),
          backgroundColor: context.theme.scaffoldBackgroundColor,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: AppImages.houses.length,
                  itemBuilder: (context, index) => ResultCard(
                          homeEntity: HomeEntity(
                        image: AppImages.houses[index],
                        area: '200 م2',
                        bathrooms: "${AppTexts.bath.tr}2",
                        bedrooms: "${AppTexts.bedroom.tr}2",
                        location: AppTexts.palestine.tr,
                        subLocation1: AppTexts.gaza.tr,
                        subLocation2: AppTexts.region.tr,
                      ))),
            ),
          ],
        ));
  }
}
