import 'package:final_project/features/chat_feature/presentation/pages/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_sizes/app_sizes.dart';
import '../../../../core/app_styles/app_styles.dart';
import '../../../../core/app_texts/app_texts.dart';
import '../widgets/chat_widgets.dart';

class ChatContactScreen extends StatefulWidget {
  const ChatContactScreen({Key? key}) : super(key: key);

  @override
  State<ChatContactScreen> createState() => _ChatContactScreen();
}

class _ChatContactScreen extends State<ChatContactScreen> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(children: [
        AppBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          title: Text(AppTexts.messages.tr),
          elevation: 0,
          titleSpacing: AppSizes.height40.w,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: AppSizes.height10.w),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      open == true ? open = false : open = true;
                    });
                  },
                  icon: Icon(
                    open == true ? Icons.close_rounded : Icons.search_rounded,
                    size: AppSizes.height10 * 3,
                  )),
            )
          ],
        ),
        Stack(
          children: [
            Container(
              height: AppSizes.screenHeight.h,
              margin: const EdgeInsets.all(AppSizes.padding20),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return ChatWidgets.card(
                    title: AppTexts.userName.tr,
                    subtitle: 'Hi, How are you !',
                    time: '04:40',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ChatScreen(
                              id: '',
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            ChatWidgets.searchBar(open),
          ],
        ),
      ]),
    ));
  }
}
