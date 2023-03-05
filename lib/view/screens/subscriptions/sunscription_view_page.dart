import 'package:chat_gpt/controller/subscription_controller/subscription_controller.dart';
import 'package:chat_gpt/utils/app_constants.dart';
import 'package:chat_gpt/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionUi extends StatelessWidget {
  SubscriptionUi({Key? key}) : super(key: key);

  final List<String> contentList = [
    "Unlimited Usage        ",
    "Unlock all features    ",
    "Ads Free Experience"
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(
        init: SubscriptionController(),
        builder: (subscriptionController) {
          return Scaffold(
            body: SafeArea(
                child: Container(
                  height: Get.height,
                  decoration: BoxDecoration(color: Theme
                      .of(context)
                      .primaryColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: Get.height / 2.8,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Theme
                                .of(context)
                                .cardColor,
                            image:const DecorationImage(
                                image: AssetImage(AppConstants.subscriptionImage),
                                fit: BoxFit.contain)),
                      ),
                      AppDimensions().space15(),
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics:const NeverScrollableScrollPhysics(),
                        itemCount: contentList.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  alignment:Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    shape: BoxShape.circle
                                  ),
                                  child: Icon(Icons.check,color: Theme.of(context).primaryColor,size: 15,),
                                ),
                                AppDimensions().wSpace10(),
                                Text(contentList[index],style: TextStyle(
                                  color: Theme.of(context).cardColor,
                                  fontSize: 16,
                                ),)
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )),
          );
        });
  }
}
