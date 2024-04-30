import 'package:get/get.dart';
import 'package:tutorials_world/screens/home_screen.dart';
import 'package:tutorials_world/screens/tutorial_viewer_screen.dart';

class Routes {
  static String home = "/home";
  static String tutorial = "/tutorial";

  static String getHomeRoute() => home;
  static String getTutorialRoute() => tutorial;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(
      name: tutorial,
      page: () => const TutorialViewerScreen(),
    ),
  ];
}
