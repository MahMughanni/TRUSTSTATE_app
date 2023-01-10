import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/features/chat_feature/presentation/pages/chat_contact_view.dart';
import 'package:final_project/features/favorities_feature/presentation/pages/favorites_view.dart';
import 'package:final_project/features/home_feature/domain/entities/home_item_entity.dart';
import 'package:final_project/features/home_feature/presentation/pages/home_view.dart';
import 'package:final_project/features/settings_feature/presentation/pages/setting_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  int index = 0;
  bool changeView1Bool = false;
  bool changeView2Bool = false;

  HomeEntity homeEntity = HomeEntity(
      image: AppImages.houses.toString(),
      area: '200 م2',
      location: 'فلسطين ',
      subLocation1: 'قطاع غزة',
      subLocation2: 'الصناعة',
      bathrooms: ' 3 غرف نوم',
      bedrooms: ' 3 حمامات');

  void changeView1() {
    changeView1Bool = !changeView1Bool;
    changeView2Bool = false;
    update();
  }

  void changeView2() {
    changeView2Bool = !changeView2Bool;
    changeView1Bool = false;
    update();
  }

  List<Widget> screens = [
    const HomeScreen(),
    const ChatContactScreen(),
    const FavoritesScreen(),
    const SettingScreen()
  ];

  List<IconData> icons = [
    Icons.bed_outlined,
    Icons.bathtub_outlined,
    Icons.living,
    Icons.kitchen,
    Icons.local_florist_outlined,
    Icons.stacked_line_chart_outlined,
    Icons.water,
    Icons.bathtub_outlined,
    Icons.air,
    Icons.balcony,
    Icons.wifi,
    Icons.elevator_outlined,
  ];

  void changScreen(int currentIndex) {
    index = currentIndex;
    update();
  }
}
