import 'package:chat_gpt/controller/splash_controller/splash_controller.dart';
import 'package:chat_gpt/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/networkManager.dart';
import 'introScreen/intro_ui.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return GetBuilder<NetWorkManager>(
     init: NetWorkManager(),
     autoRemove: false,
     builder: (networkController) {
       return GetBuilder<SplashContoller>(
           init: SplashContoller(),
           initState: (val)=>SplashContoller().startTimer(),
           builder: (splashController){
          return splashController.getIsFirstTime()?IntoPageUi(): Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: Center(
              child: Image.asset(AppConstants.splashImage,scale: 5,),
            ),
          );
        });
     }
   );
  }
}
