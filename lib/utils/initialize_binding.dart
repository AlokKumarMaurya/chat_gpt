import 'package:get/get.dart';

import '../controller/all_list_controller/all_list_controller.dart';
import '../controller/dashBoard_controller/home_screen_controller.dart';
import '../controller/networkManager.dart';
import '../controller/splash_controller/splash_controller.dart';
import '../controller/theme_controller/theme_contoller.dart';

class InitialScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
    Get.lazyPut(() => SplashContoller());
    Get.lazyPut(() => HomeScreenContoller());
    Get.lazyPut(() => AllListController());
    Get.put(() => NetWorkManager(),permanent: true);
  }
}