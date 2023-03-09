import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/all_list_controller/all_list_controller.dart';
import '../../../controller/firebaseController/get_dashboard_list_firebase.dart';
import '../../../utils/routes.dart';
import '../../helper_widget/listViewListTile.dart';

class AllPageListView extends StatelessWidget {
  const AllPageListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirebaseDashBoardListController>(
        init: FirebaseDashBoardListController(),
        builder: (firebaseDashBoardListController) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(
                Get.find<AllListController>().currentTitle,
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: firebaseDashBoardListController.dashBoardDataMap.isNull?Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: Theme.of(context).cardColor,
                ),
              ),
            ): ListView.builder(
                itemCount: firebaseDashBoardListController.dashBoardDataMap!.values.elementAt(Get.find<AllListController>().currentIndex).length,
                shrinkWrap: true,
                physics:const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
              return ListViewListTile(
                onTap: (){
                  Get.find<AllListController>().setControllerValue(value:firebaseDashBoardListController.dashBoardDataMap!.values.elementAt(Get.find<AllListController>().currentIndex)[index]);
                  Get.toNamed(Routes.chatPageUi);
                },
                content:firebaseDashBoardListController.dashBoardDataMap!.values.elementAt(Get.find<AllListController>().currentIndex)[index],
              );
            })
          );
        });
  }
}
