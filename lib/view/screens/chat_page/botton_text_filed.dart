import 'package:chat_gpt/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomTextField extends StatelessWidget {
  const BottomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: Theme.of(context).cardColor,
                size: 30,
              )),
          SizedBox(
              width: Get.width / 1.6,
              child: TextFormField(
                maxLines: null,
                cursorColor: Theme.of(context).canvasColor,
                decoration: InputDecoration(
                  fillColor: Theme.of(context).cardColor,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              )),
          Container(
            margin:const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              image:const DecorationImage(
                image: AssetImage(AppConstants.sendImage)
              ),
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Theme.of(context).secondaryHeaderColor,
                Theme.of(context).cardColor,
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            ),
          )
        ],
      ),
    );
  }
}
