import 'package:chat_gpt/theme/dark_theme.dart';
import 'package:chat_gpt/theme/light_theme.dart';
import 'package:chat_gpt/utils/app_constants.dart';
import 'package:chat_gpt/utils/routes.dart';
import 'package:chat_gpt/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controller/splash_controller/splash_controller.dart';
import 'controller/theme_controller/theme_contoller.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        init: ThemeController(),
        builder: (themeContoller) {
          return GetBuilder<SplashContoller>(
              init: SplashContoller(),
              //this becomes necessary while calling it in splash because it is not found
              builder: (splashController) {
                return splashController.isFirstTime
                    ? const SizedBox()
                    : GetMaterialApp(
                        navigatorKey: Get.key,
                        title: AppConstants().appName,
                        debugShowCheckedModeBanner: false,
                        smartManagement: SmartManagement.full,
                        theme: themeContoller.isDarkTheme ? dark() : light(),
                        defaultTransition: Transition.topLevel,
                        transitionDuration: const Duration(milliseconds: 500),
                        initialRoute: Routes.splashScreen,
                        getPages: Routes.routesList,
                        home: const SplashScreen(),
                      );
              });
        });
  }
}
