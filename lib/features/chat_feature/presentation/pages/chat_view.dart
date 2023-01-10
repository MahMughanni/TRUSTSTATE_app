import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_styles/app_styles.dart';
import '../widgets/chat_widgets.dart';

class ChatScreen extends StatelessWidget {
  final String id;

  const ChatScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.padding20.h.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: ExactAssetImage(
                    AppImages.userImage,
                  ),
                  radius: 30,
                ),
                SizedBox(
                  width: AppSizes.height10.w,
                ),
                Text(
                  AppTexts.userName.tr,
                  style: context.theme.textTheme.headline4,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.call_outlined)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.video_call_outlined)),
              ],
            ),
          ),
          SizedBox(
            height: AppSizes.height10.h,
          ),
          Expanded(
            child: Container(
              decoration: Styles.friendsBox(),
              child: ListView.builder(
                itemCount: 5,
                reverse: true,
                itemBuilder: (context, i) {
                  return ChatWidgets.messagesCard(
                      i, 'مرحباُ عزيزي , صباح الخير', '04:51 pm'.tr);
                },
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: ChatWidgets.messageField(onSubmit: (controller) {
              controller.clear();
            }),
          )
        ],
      ),
    );
  }
}
