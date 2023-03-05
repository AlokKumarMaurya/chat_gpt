import 'dart:async';

import 'package:chat_gpt/utils/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedDotConatiner extends StatefulWidget {
  const AnimatedDotConatiner({Key? key}) : super(key: key);

  @override
  State<AnimatedDotConatiner> createState() => _AnimatedDotConatinerState();
}



class _AnimatedDotConatinerState extends State<AnimatedDotConatiner> {
int val=0;
var aa;



  @override
  void initState() {
    startAnimation();
    // TODO: implement initState
    super.initState();
  }


  startAnimation(){
   // AppHelperFunction().appPrint(val: "Timer function starrt");
   aa= Timer.periodic(const Duration(seconds: 1), (timer) {
    // AppHelperFunction().appPrint(val: "Timer function starrt");
      if(val==5){
        setState(() {
          val=1;
        });
      }else{setState(() {
        val++;
      });}
    });
  }

@override
  void dispose() {
    aa.cancel();
    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    //startAnimation();
    return SizedBox(
      height: 35,
      width: Get.width/3.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
        itemCount: val,
        itemBuilder: (context, index) {
          return Container(
         padding:const EdgeInsets.all(10),
            margin:const EdgeInsets.all(5),
            width: 10,
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor,
              shape: BoxShape.circle
            ),
          );
        },
      ),
    );
  }
}
