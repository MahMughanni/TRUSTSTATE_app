import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/features/booking_feature/presentation/controllers/booking_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingScreen extends GetView<BookingController> {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppTexts.bookAppointment.tr),
          backgroundColor: context.theme.scaffoldBackgroundColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.padding20.h.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.selectAppointment,
                  style: context.theme.textTheme.headline6,
                ),
                Card(
                  child: DatePickerDialog(
                      cancelText: '',
                      confirmText: '',
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.utc(2031)),
                ),
                Text(
                  AppTexts.availableAppointment.tr,
                  style: context.theme.textTheme.headline6,
                ),
              ],
            ),
          ),
        )

        /*Column(
        children: [

          Padding(
            padding:  EdgeInsets.all(AppSizes.padding20.h.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(AppTexts.selectAppointment,
                  style: context.theme.textTheme.headline6,
                ),
            Card(
              child:TableCalendar(

                calendarBuilders: CalendarBuilders(

                  selectedBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,color: Colors.red,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                  todayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(100.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                headerStyle: HeaderStyle(
                  titleTextStyle: context.theme.textTheme.headline4!,

                  formatButtonDecoration: BoxDecoration(
                    color:AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  formatButtonTextStyle: TextStyle(color: Colors.white),
                  formatButtonShowsNext: false,
                ),
                calendarStyle: CalendarStyle(

                    todayTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.white)
                ),

         focusedDay: DateTime.now(), firstDay: DateTime.now(), lastDay: DateTime.now(),),
            ),
              ],
            ),
          ),


        ],
      ),*/
        );
  }
}
