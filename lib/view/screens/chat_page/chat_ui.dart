import 'package:chat_gpt/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/routes.dart';
import 'botton_text_filed.dart';

class ChatPageUi extends StatelessWidget {
  const ChatPageUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Get.offNamed(Routes.homeScreen);
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).primaryColor,
        appBar:  AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: true,
          centerTitle: false,
          title: Text("CHAT GPT",
              style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          actions: [
            IconButton(onPressed: (){}, icon:SvgPicture.asset(AppConstants.volumeOfImage,height: 30,)),
            AppDimensions().wSpace10(),
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image:const DecorationImage(
                    image: AssetImage(AppConstants.crownImage)
                ),
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Theme.of(context).secondaryHeaderColor,
                  Theme.of(context).cardColor,
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(child: SingleChildScrollView(child: Container()),),
           const BottomTextField()
          ],
        )
      ),
    );
  }
}
