import 'package:get/get.dart';

import '../../utils/helper_function.dart';
import '../../utils/routes.dart';

class SplashContoller extends GetxController{
bool isFirstTime=false;

void startTimer(){
  AppHelperFunction().appPrint(val: "Function started");
  Future.delayed(const Duration(seconds: 10)).then((value) => Get.toNamed(Routes.homeScreen));
}

}