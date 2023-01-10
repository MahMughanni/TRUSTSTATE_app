import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/app_themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';
import 'dart:io';
import '../../../../core/app_images/app_images.dart';
class AddingPropertyController extends GetxController{
  static TextEditingController nameController=TextEditingController();
  static TextEditingController phoneController=TextEditingController();
  static TextEditingController idController=TextEditingController();
  static TextEditingController locationController=TextEditingController();
  static TextEditingController costController=TextEditingController();
  static TextInputType number=TextInputType.number;
  static TextInputType text=TextInputType.text;
  String? selectedValue;
  String? selectedValue1;
  List<TextEditingController> controllers=[
    nameController,
    phoneController,
    idController,
    locationController,
    costController
  ];
  List<TextInputType> inputTypes=[
   text,
    number,
    number,
    text,
    number

  ];
  List<String> labels=[
    AppTexts.fullName,
    AppTexts.phoneNumber,
    AppTexts.idNumber,
    AppTexts.propertyLocation,
    AppTexts.propertyCost,
  ];

  List<String> agents=[
   AppTexts.userName +"         "+AppTexts.percent+'2%' ,



  ];
  final imagePicker=ImagePicker();
  XFile? image;
  XFile? idImage;
  Future pickImg()async{

    image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      image=XFile(image!.path);
    }
    update();

  }
  Future pickIdImg()async{

    idImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if(idImage!=null){
      idImage=XFile(image!.path);
    }
    update();

  }
}