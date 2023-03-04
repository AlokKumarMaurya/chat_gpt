import 'package:get_storage/get_storage.dart';

import 'app_constants.dart';

class SharedPrefrences {
  final box = GetStorage();

  void saveTheme({required isDarkTheme}){
    if(isDarkTheme){
      box.write(AppConstants().curentTheme, isDarkTheme);
    }
  }
  
  bool isDarkTheme(){
    return box.read(AppConstants().curentTheme)??false;
  }
}