import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/app_texts/app_texts.dart';

class FilterWidgets extends StatelessWidget {
  final String selectedValue;
  final List<String> items;
  final Function changeValue;

  const FilterWidgets(
      {super.key,
      required this.selectedValue,
      required this.items,
      required this.changeValue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: [
              Expanded(
                child: Text(
                  AppTexts.chooseState,
                  style: context.theme.textTheme.headline2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            changeValue();
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
          dropdownPadding: const EdgeInsets.only(left: 14, right: 14),
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
    );
  }
}
