import 'package:get/get.dart';
import 'package:tutorials_world/controllers/home_screen_controller.dart';
import 'package:tutorials_world/controllers/network_controller.dart';
import 'package:tutorials_world/controllers/youtube_api_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkController());
    Get.put(HomeScreenController());
    Get.put(YoutubeApiController());
  }
}
