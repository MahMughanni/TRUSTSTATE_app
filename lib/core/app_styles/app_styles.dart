
import 'dart:ui';

import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class Styles {
  static TextStyle h1() {
    return  TextStyle(
        fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white);
  }

  static friendsBox() {
    return  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)));
  }

  static messagesCardStyle(check) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: check ?AppColors.primaryColor.withOpacity(0.9): Colors.grey.shade300,
    );
  }

  static messageFieldCardStyle() {
    return BoxDecoration(
        color: Colors.white,
        border: Border.all(color:AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10));
  }

  static messageTextFieldStyle({required Function() onSubmit}) {
    return InputDecoration(
      border: InputBorder.none,
      hintText: 'Enter Message',
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      suffixIcon: IconButton(onPressed: onSubmit, icon: const Icon(Icons.send)),
    );
  }
  static searchTextFieldStyle() {
    return InputDecoration(
      border: InputBorder.none,
      hintText: 'Enter Name',
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded)),
    );
  }
  static searchField({Function(String)? onChange}) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        onChanged: onChange,
        decoration: Styles.searchTextFieldStyle(),
      ),
      decoration: Styles.messageFieldCardStyle(),
    );
  }
}