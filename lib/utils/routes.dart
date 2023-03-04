import 'package:chat_gpt/view/screens/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:flutter/material.dart';

import '../view/screens/dashboard/homeScreen.dart';
class Routes{

  //page names
  static const String initial="/";
  static const String splashScreen="/splash";
  static const String homeScreen="/splash";

  
  //get pages list
  static List<GetPage> routesList = [
    GetPage(name: initial, page:(){return const SplashScreen();}),
    GetPage(name: homeScreen, page:(){return const HomeScreen();}),
  ];
}