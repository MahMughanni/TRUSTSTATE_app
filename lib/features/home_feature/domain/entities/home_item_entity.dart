import 'package:equatable/equatable.dart';
import 'package:final_project/core/app_images/app_images.dart';

class HomeEntity extends Equatable {
  String image = AppImages.houses.toString();
  String area='200 م2';
  String location='فلسطين ';
  String subLocation1='قطاع غزة';
  String subLocation2='الصناعة';
  String bedrooms=' 3 غرف نوم';
  String bathrooms= ' 3 حمامات';

   HomeEntity(
      {required this.image,
      required this.area,
      required this.location,
      required this.subLocation1,
      required this.subLocation2,
      required this.bathrooms,
      required this.bedrooms});

  // factory HomeEntity.fromJson (Map <String , dynamic > fromJson)

  @override
  List<Object?> get props =>
      [image, area, location, bedrooms, bathrooms, subLocation1,subLocation2];
}
