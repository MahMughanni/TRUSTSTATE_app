import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthLayout extends StatelessWidget {
  final Widget pageContent;
  final String pageTitle;

  const AuthLayout(this.pageContent, this.pageTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        title: Text(pageTitle.tr),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: pageContent,
    );
  }
}
