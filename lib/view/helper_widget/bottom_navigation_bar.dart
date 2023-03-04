import 'package:chat_gpt/utils/app_constants.dart';
import 'package:chat_gpt/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottonNavigationBar extends StatelessWidget {
  BottonNavigationBar({Key? key}) : super(key: key);

  RxInt index = 0.obs;

  handleTap({required int val}) {
    if (val == 0) {
      Get.offNamed(Routes.homeScreen);
    } else {
      Get.toNamed(Routes.chatPageUi);
    }
    index.value = val;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(color: Theme.of(Get.context!).primaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                  onPressed: () => handleTap(val: 0),
                  icon: Obx(() => Icon(
                        Icons.home,
                        color: index.value == 0
                            ? Theme.of(Get.context!).canvasColor
                            : Theme.of(Get.context!).cardColor,
                        size: 30,
                      ))),
              Text(
                "Home",
                style: TextStyle(color: Theme.of(Get.context!).cardColor),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () => handleTap(val: 1),
                  icon: Obx(() => Image.asset(
                    height: 30,
                        width:30,
                        AppConstants.chatImage,
                        color: index.value == 1
                            ? Theme.of(Get.context!).canvasColor
                            : Theme.of(Get.context!).cardColor,
                      )
                  )),
              Text(
                "Chat",
                style: TextStyle(color: Theme.of(Get.context!).cardColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
