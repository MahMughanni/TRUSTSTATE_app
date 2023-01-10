import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
class BookingController extends GetxController{
  late Map<DateTime, List<dynamic>> events;
  late List<dynamic> selectedEvents;

  @override
  void onInit() {
    super.onInit();
    events = {};
    selectedEvents = [].obs;
  }
  late DateTime dateTime;

}