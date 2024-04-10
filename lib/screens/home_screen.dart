import 'package:flutter/material.dart';
import 'package:tutorials_world/widgets/side_menu_widget.dart';
import 'package:tutorials_world/widgets/videos_home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                child: SideMenuWidget(),
              ),
            ),
            Expanded(
              flex: 10,
              child: VideosHomeWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
