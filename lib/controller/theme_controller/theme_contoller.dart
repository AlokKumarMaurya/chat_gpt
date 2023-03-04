import 'package:get/get.dart';

import '../../utils/shared_prefrences.dart';

class ThemeController extends GetxController{
 bool _isDarkTheme=false;

bool get isDarkTheme =>_isDarkTheme;

void getTheme(){
  _isDarkTheme= SharedPrefrences().isDarkTheme();
}

}