import 'package:chat_gpt/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/firebaseController/firebaseController.dart';


class BannerView extends StatelessWidget {
  const BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
      Container(
        margin:const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
        alignment: Alignment.center,
        height: 100,
        width: Get.width,
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppConstants.bannerImage)
          ),
          //gradient: LinearGradient(colors: [Theme.of(context).canvasColor,Theme.of(context).primaryColor],begin: Alignment.centerLeft,end: Alignment.centerRight)
        ),
      ) ,   
        ],
      ),
    );
  }
}
