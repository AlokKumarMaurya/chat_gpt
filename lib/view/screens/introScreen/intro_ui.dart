import 'package:chat_gpt/utils/app_constants.dart';
import 'package:chat_gpt/utils/dimensions.dart';
import 'package:chat_gpt/utils/routes.dart';
import 'package:chat_gpt/utils/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntoPageUi extends StatelessWidget {
  IntoPageUi({Key? key}) : super(key: key);

  final List<String> imagesList = [
    AppConstants.introOneImage,
    AppConstants.introTwoImage,
    AppConstants.introThreeImage
  ];
  final List<String> textList = [
    "Ask the",
    "bot anything,",
    "he's always ready to help!",
    "Inquire about a",
    "specific topic",
    "Allow it to give the answer,",
    "enjoy"
  ];

  List<Widget> textWidgetList = [
    RichText(
        text: TextSpan(children: [
      WidgetSpan(
          child: Text("Ask the ",
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 1.3,
                  wordSpacing: 3,
                  color: Theme.of(Get.context!).cardColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 22))),
      WidgetSpan(
          child: Text("bot anything,",
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 1.3,
                  wordSpacing: 3,
                  color: Theme.of(Get.context!).dividerColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 22))),
      WidgetSpan(
          child: Text("he's always ready to help!",
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 1.3,
                  wordSpacing: 3,
                  color: Theme.of(Get.context!).cardColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 22)))
    ])),
    RichText(
        text: TextSpan(children: [
      WidgetSpan(
          child: Text("Inquire about a",
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 1.3,
                  wordSpacing: 3,
                  color: Theme.of(Get.context!).cardColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 22))),
      WidgetSpan(
          child: Text("specific topic",
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 1.3,
                  wordSpacing: 3,
                  color: Theme.of(Get.context!).dividerColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 22))),
    ])),
    RichText(
        text: TextSpan(children: [
      WidgetSpan(
          child: Text("Allow it to give the answer,",
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 1.3,
                  wordSpacing: 3,
                  color: Theme.of(Get.context!).cardColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 22))),
      WidgetSpan(
          child: Text("enjoy",
              textAlign: TextAlign.left,
              style: TextStyle(
                  letterSpacing: 1.3,
                  wordSpacing: 3,
                  color: Theme.of(Get.context!).dividerColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 22)))
    ]))
  ];

  Widget temp({required int index, required Color color}) =>
      Text(textList[index],
          textAlign: TextAlign.left,
          style: TextStyle(
              letterSpacing: 1.3,
              wordSpacing: 3,
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 22));

  RxInt pageNumber = 0.obs;

  void changeIndex({required int index}) {
    if (index == 3) {
      Get.offAllNamed(Routes.homeScreen);
      SharedPrefrences().saveUser();
    } else {
      pageNumber.value = index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
          height: Get.height,
          color: Colors.black.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: const Color(0xff1a1a1a),
                        image: DecorationImage(
                          image: AssetImage(
                            imagesList[pageNumber.value],
                          ),
                          fit: BoxFit.fitHeight,
                        )),
                    height: Get.height / 1.3,
                    width: Get.width,
                    child: Padding(
                        padding: const EdgeInsets.only(right: 28.0, top: 18),
                        child: InkWell(
                          onTap: () => changeIndex(index: 3),
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.3),
                          ),
                        ))),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    AppDimensions().space10(),
                    Obx(() => textWidgetList[pageNumber.value]),
                    AppDimensions().space10(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 30,
                          // width: 100,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Obx(() => Container(
                                    //padding: const EdgeInsets.symmetric(horizontal: 10),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    height: 40,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: pageNumber.value == index
                                            ? Theme.of(context).cardColor
                                            : Theme.of(context).hintColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ));
                            },
                          ),
                        ),
                        InkWell(
                          hoverColor: Colors.transparent,
                          onTap: () => changeIndex(index: pageNumber.value + 1),
                          child: Image.asset(
                            AppConstants.nextImage,
                            height: 60,
                            width: 50,
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
