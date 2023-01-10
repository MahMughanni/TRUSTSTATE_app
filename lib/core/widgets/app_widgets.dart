import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../app_routes/app_routes.dart';

class DefaultTextForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final bool isPassword;
  final FormFieldValidator<String> validator;
  final GestureTapCallback? onTap;
  final String? label;
  final String? hintText;
  final Widget? iconData;
  final Widget? iconDataSuffixx;
  final bool isEnable;
  final bool hasPrefixIcon;
  final bool? filled;
  final bool? hint;

  const DefaultTextForm(
      {super.key, required this.textEditingController,
      required this.textInputType,
      this.onFieldSubmitted,
      this.onChanged,
      this.onTap,
      this.isPassword = false,
      required this.validator,
      this.label,
      this.hintText,
      this.iconData,
      this.iconDataSuffixx,
      this.isEnable = true,
      this.hasPrefixIcon = false,
      this.filled = false,
      this.hint = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: context.theme.textTheme.headline6,
      controller: textEditingController,
      keyboardType: textInputType,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      onTap: onTap,
      enabled: isEnable,
      obscureText: isPassword,
      textAlign: filled! ? TextAlign.center : TextAlign.start,
      decoration: InputDecoration(
          suffixIcon: iconDataSuffixx,
          suffixIconConstraints: const BoxConstraints(maxWidth: 40, maxHeight: 40),
          contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.padding20),
          label: Text(label ?? ''),
          hintText: hintText,
          hintStyle: context.theme.textTheme.caption,
          labelStyle: context.theme.textTheme.headline3,
          filled: filled,
          fillColor: AppColors.containerColor,
          // icon: Icon(iconData),
          focusColor: AppColors.primaryColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2.w),
            borderRadius: BorderRadius.circular(AppSizes.radius12.r),
          ),
          prefixIcon: iconData,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius12.r),
              borderSide: BorderSide(color: AppColors.containerColor))),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final String buttonText;
  final String page;
  final Function? function;

  const DefaultButton(this.buttonText, this.page, {super.key, this.function});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Get.toNamed(page);
        function;
      },
      height: context.theme.buttonTheme.height.h,
      shape: context.theme.buttonTheme.shape,
      color: AppColors.primaryColor,
      child: Text(
        buttonText,
        style: context.theme.textTheme.headline2,
      ),
    );
  }
}
