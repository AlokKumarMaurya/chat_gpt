import 'dart:async';

import 'package:chat_gpt/utils/helper_function.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetWorkManager extends GetxController{

  final Connectivity _connectivity = Connectivity();
  //0 = No Internet, 1 = WIFI Connected ,2 = Mobile Data Connected.
  RxInt connectionType = 0.obs;
  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    getConnectivityType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }


  Future<bool> getConnectivityType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      AppHelperFunction().appPrint(val: e.toString());
    }
    _updateState(connectivityResult);
    bool temp=ConnectivityResult.wifi==connectivityResult || ConnectivityResult.mobile==connectivityResult ;
    return temp;

  }




  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value=1;
        //AppHelperFunction().showGoodSnackBar(text: "Connected to wifi");
        break;
      case ConnectivityResult.mobile:
        connectionType.value=1;
       // AppHelperFunction().showGoodSnackBar(text: "Connected to mobile data");

        break;
      case ConnectivityResult.none:
        connectionType.value=0;
        AppHelperFunction().showGoodSnackBar(text: "No internet connection please try again later");
        break;
      default:
        connectionType.value=0;
        AppHelperFunction().showGoodSnackBar(text: "Connected failed please try again later");
        break;
    }
  }





  @override
  void onClose() {
    _streamSubscription.cancel();
  }


}