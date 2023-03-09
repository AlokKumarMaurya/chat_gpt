import 'package:chat_gpt/utils/helper_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDashBoardListController extends GetxController{

  Map<String, dynamic>? dashBoardDataMap;


/*  FirebaseDatabase database = FirebaseDatabase.instance;

  void writeDataToRealtimeDataBase()async{
    AppHelperFunction().appPrint(val: "wr,sdfnfmndfmmns,fn,nf,df");
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
database.ref("test").set("value");
    await ref.set({
      "name": "John",
      "age": 18,
      "address": {
        "line1": "100 Mountain View"
      }
    });
  }*/


@override
  void onInit() {
  getDashBoardList();
    // TODO: implement onInit
    super.onInit();
  }

  final CollectionReference alok =
  FirebaseFirestore.instance.collection("dashBoardList");

  void getDashBoardList()async{
   var temp=await alok.get();
   var list=temp.docs[0].get("dash board List") as Map;
   AppHelperFunction().appPrint(val:list.runtimeType.toString()+"thid it mdsfsn");
   dashBoardDataMap=list.cast<String,dynamic>();
   AppHelperFunction().appPrint(val: "${temp.docs}");
      AppHelperFunction().appPrint(val:list.keys.toString()+"this is the get ") ;
      for(var element in list.values){
        AppHelperFunction().appPrint(val: element.toString());
      }
      update();
   }
  }

