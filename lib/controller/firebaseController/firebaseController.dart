import 'package:chat_gpt/utils/helper_function.dart';
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
   if (noOfChats >= 3) {
      value = true;
    } else {
      await alok.doc(await getDeviceId()).set({"no of chats": noOfChats + 1});
      value=false;
    }

    return value;
  }

  Future<int> getNumberOfChats({required String deviceId}) async {
    getApiKeyFromFirebase();
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

  Future<String> getApiKeyFromFirebase() async {
    var temp = FirebaseFirestore.instance.collection("api_key");
    var aa = await temp.get();
    String bb = aa.docs[0].get("key");
    return bb;
  }
}

//write to firebase

//add to any document //random name to the document
//await alok.add({"data": "alok"});

//add to particular document
//await alok.doc(await getDeviceId()).set({"no of chats": noOfChats + 1});

//get data from firebase

//get all data in from of list
//var temp = await alok.get();
// it has id=document name
// element.get("no of chats")   //use for loop to get the details of each document

//get data of particular document




/// for realtime database we need
/// flutter pub add firebase_database