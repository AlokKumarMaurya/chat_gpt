import 'package:chat_gpt/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      width: Get.width / 1.2,
      height: Get.height,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 80,
                  width: Get.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image:
                              AssetImage(AppConstants.settingUnpremiumImage,)),
                      color: Theme.of(context).cardColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Go Premium",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            color: Theme.of(context).cardColor),
                      ),
                      Text(
                        "Unlock All Features & No-Ads",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Theme.of(context).hintColor),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "General",
                    style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                AppDimensions().space20(),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor.withOpacity(0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      listTile(
                          leadingIcon: Image.asset(
                            AppConstants.restoreImage,
                            height: 30,
                          ),
                          text: "Restore"),
                      listTile(
                          leadingIcon: SvgPicture.asset(
                            AppConstants.ssTermsOfServiceImage,
                            height: 30,
                          ),
                          text: "Terms of Services"),
                      listTile(
                          leadingIcon: SvgPicture.asset(
                            AppConstants.ssPrivacyPolicyImage,
                            height: 30,
                          ),
                          text: "Privacy Policy"),
                      listTile(
                          leadingIcon: Image.asset(
                            AppConstants.settingsImage,
                            height: 30,
                          ),
                          text: "Manage Subscription"),
                      AppDimensions().space20(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "SHARING & SUPPORT",
                          style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      AppDimensions().space20(),
                      listTile(
                          leadingIcon: Image.asset(
                            AppConstants.restoreImage,
                            height: 30,
                          ),
                          text: "Rate Us"),
                      listTile(
                          leadingIcon: Image.asset(
                            AppConstants.shareImage,
                            height: 30,
                          ),
                          text: "Share App"),
                      listTile(
                          leadingIcon: SvgPicture.asset(
                            AppConstants.ssContactUsImage,
                            height: 30,
                          ),
                          text: "Contact Us"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listTile({
    required Widget leadingIcon,
    required String text,
    /* required Widget suffixIcon*/
  }) =>
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Container(
          color: Theme.of(Get.context!).primaryColor,
          child: ListTile(
            onTap: () => Get.back(),
            tileColor: Theme.of(Get.context!).primaryColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            minVerticalPadding: 10,
            minLeadingWidth: 2,
            title: Text(
              text,
              style: TextStyle(
                  color: Theme.of(Get.context!).cardColor, fontSize: 16),
            ),
            leading: leadingIcon,
            trailing: Icon(
              Icons.navigate_next,
              color: Theme.of(Get.context!).cardColor,
              size: 30,
            ),
          ),
        ),
      );
}
