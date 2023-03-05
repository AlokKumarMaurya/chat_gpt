import 'package:chat_gpt/controller/all_list_controller/all_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper_widget/animatedDotConatiner.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllListController>(
        init: AllListController(),
        builder: (allListController) {
          return ListView.builder(
            controller: allListController.chatListScrollContoller,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: allListController.chatList.length,
            itemBuilder: (context, index) {
              return Align(
                alignment:
                    allListController.chatList[index].keys.toString() == "(1)"
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                child: UnconstrainedBox(
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: double.infinity,
                      maxWidth: Get.width / 1.5,
                      minWidth: double.minPositive,
                    ),
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).secondaryHeaderColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: allListController.chatList[index].keys.toString() ==
                            "(0)"
                        ? allListController.chatList[index][0]
                        .toString()==""?const AnimatedDotConatiner():Text(
                            allListController.chatList[index].keys.toString() ==
                                    "(1)"
                                ? allListController.chatList[index][1]
                                    .toString()
                                : allListController.chatList[index][0]
                                    .toString(),
                            softWrap: true,
                            textAlign: TextAlign.left,
                          )
                        : Text(
                            allListController.chatList[index].keys.toString() ==
                                    "(1)"
                                ? allListController.chatList[index][1]
                                    .toString()
                                : allListController.chatList[index][0]
                                    .toString(),
                            softWrap: true,
                            textAlign: TextAlign.left,
                          ),
                  ),
                ),
              );
            },
          );
        });
  }



}
