import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/all_list_controller/all_list_controller.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/routes.dart';

class HomePageGridView extends StatelessWidget {
  HomePageGridView({Key? key}) : super(key: key);

  final List<String> nameList = [
    "Marketing",
    "Business",
    "Content",
    "web Development",
    "HealthCare",
    "Teachers",
    "Music",
    "Education",
    "Food & cooking"
  ];
  final List<String> imagesList = [
    AppConstants.marketingImage,
    AppConstants.businessImage,
    AppConstants.contentImage,
    AppConstants.webDevImage,
    AppConstants.healthCareImage,
    AppConstants.teacherImage,
    AppConstants.musicImage,
    AppConstants.educationImage,
    AppConstants.foodImage
  ];

  List<Color> colorList = [
    Colors.green,
    Colors.purpleAccent,
    Colors.blueAccent.shade700,
    Colors.deepOrangeAccent,
    Colors.pinkAccent.shade400,
    Colors.yellow.shade400,
    Colors.green.shade800,
    Colors.red,
    Colors.purple
  ];


  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 1),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.find<AllListController>()
                  .setCurrentPage(title: nameList[index]);
              Get.toNamed(Routes.allPageListView);
            },
            child: Container(
              margin: index == 0 || index == 3 || index == 6
                  ? const EdgeInsets.only(left: 10)
                  : index == 2 || index == 5 || index == 8
                  ? const EdgeInsets.only(right: 10)
                  : null,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme
                      .of(context)
                      .cardColor
                      .withOpacity(0.1)),
              height: 90,
              width: Get.width / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorList[index]
                    ),
                    padding: const EdgeInsets.all(13),
                    child: Image.asset(
                        imagesList[index],
                        height: 25,
                        width: 25
                    ),
                  ),
                const  SizedBox(height: 3,),
                  Text(
                    nameList[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme
                            .of(context)
                            .cardColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          );
        },
        childCount: nameList.length,
      ),
    );
  }
}
