import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_constants.dart';

class HomePageGridView extends StatelessWidget {
   HomePageGridView({Key? key}) : super(key: key);

  final List<String> nameList=["Marketing","Bussiness","Content","web Development","HealthCare","Teachers"];

  @override
  Widget build(BuildContext context) {
    return  SliverGrid(
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
        childAspectRatio: 1
      ),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Container(
           // padding: EdgeInsets.symmetric(horizontal: 5),
            margin:index==0||index==3? EdgeInsets.only(left: 10):index==2||index==5?EdgeInsets.only(right: 10):null,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor.withOpacity(0.1)
            ),
            height:90 ,
            width: Get.width/5,
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Image.asset(AppConstants.splashImage,height: 60,width: Get.width/7,),
                Text(nameList[index],textAlign: TextAlign.center,style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),)
              ],
            ),
          );
        },
        childCount: nameList.length,
      ),
    );
  }
}
