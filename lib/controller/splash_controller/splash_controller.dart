import 'package:chat_gpt/utils/shared_prefrences.dart';
import 'package:get/get.dart';

import '../../utils/helper_function.dart';
import '../../utils/routes.dart';

class SplashContoller extends GetxController{
bool isFirstTime=false;

void startTimer(){
  AppHelperFunction().appPrint(val: "Function started");
  getIsFirstTime()?null: Future.delayed(const Duration(seconds: 3)).then((value) => Get.offAllNamed(Routes.homeScreen));
}

bool getIsFirstTime(){
 return SharedPrefrences().getUserFirstTime();
}


}