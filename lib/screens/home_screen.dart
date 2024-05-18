import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorials_world/controllers/home_screen_controller.dart';
import 'package:tutorials_world/widgets/internet_checker.dart';
import 'package:tutorials_world/widgets/side_menu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenController = Get.find<HomeScreenController>();
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox(
                child: SideMenuWidget(),
              ),
            ),
            Expanded(
              flex: 10,
              child: Obx(
                () {
                  return InternetChecker(
                      child: homeScreenController.screenDeterminer());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
