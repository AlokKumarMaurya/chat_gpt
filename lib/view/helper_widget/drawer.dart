import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(top: 100),
      width: Get.width/1.2,
      height: Get.height,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor
      ),
      child:CustomScrollView(
        scrollDirection: Axis.vertical,
        physics:const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("General",style: TextStyle(color: Theme.of(context).cardColor,fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                AppDimensions().space20(),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor.withOpacity(0.1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      listTile(leadingIcon: Icon(Icons.restart_alt,color: Theme.of(context).cardColor,size: 30,),text:"Restore"),
                      listTile(leadingIcon: Icon(Icons.restart_alt,color: Theme.of(context).cardColor,size: 30,),text:"Restore"),
                      listTile(leadingIcon: Icon(Icons.restart_alt,color: Theme.of(context).cardColor,size: 30,),text:"Restore"),
                      listTile(leadingIcon: Icon(Icons.restart_alt,color: Theme.of(context).cardColor,size: 30,),text:"Restore"),
                      AppDimensions().space20(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("SHARING & SUPPORT",style: TextStyle(color: Theme.of(context).cardColor,fontWeight: FontWeight.bold,fontSize: 18),),
                      ),
                      AppDimensions().space20(),
                      listTile(leadingIcon: Icon(Icons.restart_alt,color: Theme.of(context).cardColor,size: 30,),text:"Restore"),
                      listTile(leadingIcon: Icon(Icons.restart_alt,color: Theme.of(context).cardColor,size: 30,),text:"Restore"),
                      listTile(leadingIcon: Icon(Icons.restart_alt,color: Theme.of(context).cardColor,size: 30,),text:"Restore"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ) ,
    );
  }

  Widget listTile({required Widget leadingIcon,required String text,/* required Widget suffixIcon*/})=>Padding(
    padding: const EdgeInsets.only(top: 5.0),
    child: Container(
      color: Theme.of(Get.context!).primaryColor,
      child: ListTile(
        onTap: ()=>Get.back(),
        tileColor: Theme.of(Get.context!).primaryColor,
        contentPadding:const EdgeInsets.symmetric(horizontal: 10),
        minVerticalPadding: 10,
        minLeadingWidth: 2,
        title: Text(text,style: TextStyle(color: Theme.of(Get.context!).cardColor,fontSize: 16),),
        leading: leadingIcon,
        trailing: Icon(Icons.navigate_next,color: Theme.of(Get.context!).cardColor,size: 30,),
      ),
    ),
  );


}
