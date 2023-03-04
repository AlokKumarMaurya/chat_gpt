import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/dashBoard_controller/home_screen_controller.dart';
import '../../../utils/helper_function.dart';
import '../../helper_widget/bottom_navigation_bar.dart';
import '../../helper_widget/drawer.dart';
import 'banner_view.dart';
import 'home_page_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenContoller>(
        init: HomeScreenContoller(),
        builder: (homeController) {
          return Scaffold(
            bottomNavigationBar: BottonNavigationBar(),
            drawer: const HomePageDrawer(),
            backgroundColor: Theme.of(context).primaryColor,
            body: CustomScrollView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverAppBar(
                  title: const Text("Hello User"),
                  centerTitle: true,
                  titleSpacing: 2.0,
                  stretch: true,
                  automaticallyImplyLeading: true,
                  elevation: 0.0,
                  floating: false,
                  pinned: true,
                  titleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.bubble_chart_sharp,
                          color: Theme.of(context).cardColor,
                          size: 30,
                        ),
                        onPressed: () => AppHelperFunction()
                            .showErrorSnackBar(text: "No functionality yet"),
                      ),
                    )
                  ],
                ),
                BannerView(),
                HomePageGridView(),
              ],
            ),
          );
        });
  }
}
