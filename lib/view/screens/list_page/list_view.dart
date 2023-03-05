import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/all_list_controller/all_list_controller.dart';
import '../../../utils/routes.dart';
import '../../helper_widget/listViewListTile.dart';

class AllPageListView extends StatelessWidget {
  const AllPageListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllListController>(
        init: AllListController(),
        builder: (allListController) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(
                allListController.currentTitle,
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: ListView.builder(
                itemCount: allListController.currentList.length,
                shrinkWrap: true,
                physics:const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
              return ListViewListTile(
                onTap: (){
                  allListController.setControllerValue(value: allListController.currentList[index]);
                  Get.toNamed(Routes.chatPageUi);
                },
                content: allListController.currentList[index],
              );
            })
          );
        });
  }
}
