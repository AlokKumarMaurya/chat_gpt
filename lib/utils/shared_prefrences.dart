import 'package:get_storage/get_storage.dart';

import 'app_constants.dart';

class SharedPrefrences {
  final box = GetStorage();

  void saveTheme({required isDarkTheme}){
    if(isDarkTheme){
      box.write(AppConstants().currentTheme, isDarkTheme);
    }
  }
  
  bool isDarkTheme(){
    return box.read(AppConstants().currentTheme)??false;
  }
}