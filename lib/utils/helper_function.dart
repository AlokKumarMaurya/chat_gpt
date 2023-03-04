import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppHelperFunction{

  void appPrint({required String val}){
    if(kDebugMode){
      print(val);
    }
  }

  void showErrorSnackBar({required String text}){
    Get.showSnackbar(GetSnackBar(
      messageText: Text(text,style: TextStyle(
        color: Theme.of(Get.context!).cardColor,
        fontSize: 16,
      ),),
      backgroundColor: Colors.red,
      duration: Duration(seconds:3),
      margin: EdgeInsets.all(10),
      borderRadius: 15,
      isDismissible: true,
      snackPosition: SnackPosition.BOTTOM,
    ));
  }

  void showGoodSnackBar({required String text}){
    Get.showSnackbar(GetSnackBar(
      messageText: Text(text,style: TextStyle(
        color: Theme.of(Get.context!).cardColor,
        fontSize: 16,
      ),),
      backgroundColor: Colors.green,
      duration: Duration(seconds:3),
      margin: EdgeInsets.all(10),
      borderRadius: 15,
      isDismissible: true,
      snackPosition: SnackPosition.BOTTOM,
    ));
  }

}