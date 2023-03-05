import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';

class FireBaseController extends GetxController {
  final CollectionReference alok =
      FirebaseFirestore.instance.collection("all users");

  Future<String> getDeviceId() async {
    return await PlatformDeviceId.getDeviceId ?? "";
  }

  Future<bool> writeToFireBase() async {
    bool value = false;
    int noOfChats = await getNumberOfChats(deviceId: await getDeviceId());

    //add to any document //random name
    //await alok.add({"data": "alok"});

    //add to particular document
    //await alok.doc(await getDeviceId()).set({"no of chats": noOfChats + 1});

    if (noOfChats >= 3) {value=true;}else{
      await alok.doc(await getDeviceId()).set({"no of chats": noOfChats + 1});
    }

    return value;
  }

  Future<int> getNumberOfChats({required String deviceId}) async {
    int value = 1;
    var temp = await alok.get();
/*    temp.docs.forEach((element) {
      if(element.id==deviceId){
        value=int.parse(element.get("no of chats").toString());
       // AppHelperFunction().appPrint(val:element.get("no of chats").toString()+"this is the get ") ;
      }
    });*/
    for (var element in temp.docs) {
      if (element.id == deviceId) {
        value = int.parse(element.get("no of chats").toString());
        // AppHelperFunction().appPrint(val:element.get("no of chats").toString()+"this is the get ") ;
      }
    }

    return value;
  }
}
