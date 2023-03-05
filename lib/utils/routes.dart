import 'package:chat_gpt/view/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:flutter/material.dart';

import '../controller/all_list_controller/all_list_controller.dart';
import '../view/screens/chat_page/chat_ui.dart';
import '../view/screens/dashboard/homeScreen.dart';
import '../view/screens/list_page/list_view.dart';
import 'initialize_binding.dart';
class Routes{

  //page names
  static const String initial="/";
  static const String splashScreen="/splash";
  static const String homeScreen="/homeScreen";
  static const String allPageListView="/AllPageListView";
  static const String chatPageUi="/ChatPageUi";

  
  //get pages list
  static List<GetPage> routesList = [
    GetPage(name: initial, page:(){return const SplashScreen();}),
    GetPage(name: homeScreen, page:(){return const HomeScreen();},binding: InitialScreenBindings()),
    GetPage(name: allPageListView, page:(){return const AllPageListView();}),
    GetPage(name: chatPageUi, page:(){return const ChatPageUi();},preventDuplicates: true,binding: InitialScreenBindings()),
  ];
}