import 'dart:async';

import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_themes/app_themes.dart';
import 'package:final_project/features/chat_feature/presentation/pages/chat_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_styles/app_styles.dart';
import '../../../../test.dart';

class ChatWidgets {
  static Widget card({title, time, subtitle, onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.all(AppSizes.height10.h.w),
        child: ListTile(
          onTap: onTap,
          contentPadding:EdgeInsets.all(AppSizes.height10/2.h.w),
          leading:  Padding(
            padding: EdgeInsets.all(AppSizes.height10/2.h.w),
            child: const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                )),
          ),
          title: Text(title,style: AppThemes.lightTheme.textTheme.headline5,),
          subtitle:subtitle !=null? Text(subtitle): null,
          trailing: Padding(
            padding:  EdgeInsets.all( AppSizes.height10.w),
            child: Text(time,style: AppThemes.lightTheme.textTheme.headline3,),
          ),
        ),
      ),
    );
  }

  static Widget circleProfile({onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 50,child: Center(child: Text('John',style: TextStyle(height: 1.5,fontSize: 12,color: Colors.white),overflow: TextOverflow.ellipsis,)))
          ],
        ),
      ),
    );
  }

  static Widget messagesCard(i, message, time) {
    bool check = i % 2 == 0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (check) const Spacer(),
          if (!check)
            const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 10,
              child: Icon(
                Icons.person,
                size: 13,
                color: Colors.white,
              ),
            ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(10),
              decoration: Styles.messagesCardStyle(check),
              child: Text(
                '$message\n\n$time',
                style: TextStyle(color: check ? Colors.white : Colors.black),
              ),
            ),
          ),
          if (check)
            const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 10,
              child: Icon(
                Icons.person,
                size: 13,
                color: Colors.white,
              ),
            ),
          if (!check) const Spacer(),
        ],
      ),
    );
  }

  static messageField({required onSubmit}) {
    final con = TextEditingController();
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: Styles.messageFieldCardStyle(),
      child: TextField(
        controller: con,
        decoration: Styles.messageTextFieldStyle(onSubmit: () {
          onSubmit(con);
        }),
      ),
    );
  }


  static searchBar(bool open, ) {
    return AnimatedDialog(
      height: open ? 800 : 0,
      width: open ? 400 : 0,

    );
  }

  static searchField({onSubmit}) {
    final con = TextEditingController();
    return Container(

      margin: const EdgeInsets.all(10),
      decoration: Styles.messageFieldCardStyle(),
      child: TextField(
        controller: con,
        decoration: Styles.searchTextFieldStyle(

        ),
      ),
    );
  }
}
class AnimatedDialog extends StatefulWidget {
  final double height;
  final double width;

  const AnimatedDialog({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  State<AnimatedDialog> createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<AnimatedDialog> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    if(widget.height != 0){
      Timer(const Duration(milliseconds: 200), () {
        setState(() {
          show = true;
        });
      });
    }else{
      setState(() {
        show = false;
      });
    }

    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color:widget.width == 0 ? Colors.grey.withOpacity(0.6):  Colors.grey.shade50,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.width == 0 ? 100 : 0),
                bottomRight: Radius.circular(widget.width == 0 ? 100 : 0),
                bottomLeft: Radius.circular(widget.width == 0 ? 100 : 0),
              )),
          child: widget.width == 0 ? null : !show ? null :  Column(
            children: [
              ChatWidgets.searchField(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, i) {
                      return ChatWidgets.card(
                        title: 'John Doe',
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}