import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/helper_function.dart';
class BottonNavigationBar extends StatelessWidget {
   BottonNavigationBar({Key? key}) : super(key: key);

RxInt index=0.obs;
   handleTap({required int val}){
    index.value=val;
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
                  onPressed: () => handleTap(val: 0)
                      .showGoodSnackBar(text: "No function yest"),
                  icon:Obx(()=> Icon(
                    Icons.home,
                    color:index.value==0? Theme.of(Get.context!).canvasColor:Theme.of(Get.context!).cardColor,
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
                  onPressed: () => handleTap(val: 1)
                      .showGoodSnackBar(text: "No function yest"),
                  icon: Obx(()=>Icon(
    Icons.chat,
    color: index.value==1? Theme.of(Get.context!).canvasColor:Theme.of(Get.context!).cardColor,
    size: 30,
    ))),
              Text(
                "Chat",
                style: TextStyle(color: Theme.of(Get.context!).cardColor),
              ),
            ],
          )
        ],
      ),
    );  }
}
